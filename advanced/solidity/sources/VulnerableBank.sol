// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Vulnerable Customer Database
contract CustomerDatabase {
    mapping(address => uint256) public customerJoinedAt;
    address[] public customers; // Array to keep track of all customers
    uint public total = 0;  
    
    function addCustomer(address _customer) virtual public {
        customerJoinedAt[_customer] = block.timestamp;
        customers.push(_customer);  // Add customer to array
        total += 1;
    }
    
    function isCustomer(address _customer) public virtual returns (bool) {
        return customerJoinedAt[_customer] > 0;
    }

    function isNewCustomer(address _customer, uint256 promoTime) public view returns (bool) {
        uint256 time;
        unchecked {
            time = block.timestamp - promoTime;
        }
        return time < customerJoinedAt[_customer];
    }

    // Function to get the list of all customers
    function getAllCustomers() public view returns (address[] memory) {
        return customers;
    }
}

contract NewCustomerDatabase is CustomerDatabase {
    struct Customer {
        address addr;
        uint256 joinDate;
    }

    Customer[] public customerArray;

    function addCustomer(address customer) override public {
        uint total = block.timestamp + 1 days;
        Customer memory customer = Customer({
            addr: customer,
            joinDate : total
        });
        customerArray.push(customer);
        total += 1;
    }

    function isCustomer(address _customer) public override returns (bool) {
        return customerJoinedAt[_customer] > 0;
    }
}

contract MaliciousCustomerDatabase is CustomerDatabase {
    address public vulnerableBankAddress;
    
    constructor(address _vulnerableBankAddress) {
        vulnerableBankAddress = _vulnerableBankAddress;
    }
    
    function isCustomer(address _customer) public override returns (bool) {
        VulnerableBank bank = VulnerableBank(vulnerableBankAddress);
        bank.withdrawPromo();
        return super.isCustomer(_customer);
    }
}

contract CustomerDatabaseProxy {
    address public implementation;
    address public owner;
    CustomerDatabase public cd;

    constructor(address _implementation) {
        implementation = _implementation;
        owner = msg.sender;
        cd = CustomerDatabase(_implementation);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function upgradeImplementation(address _newImplementation) public onlyOwner {
        implementation = _newImplementation;
        cd = CustomerDatabase(_newImplementation);
    }

    function isNewCustomer(address _customer, uint256 promoTime) public view returns (bool) {
        return cd.isNewCustomer(_customer, promoTime);
    }

    function isCustomer(address _customer) public returns (bool) {
        return cd.isCustomer(_customer);
    }

    function getAllCustomers() public view returns (address[] memory) {
        return cd.getAllCustomers();
    }

    function customerJoinedAt(address customer) public view returns (uint256){
        return cd.customerJoinedAt(customer);
    }

    fallback() external payable {
        address _implementation = implementation;
        require(_implementation != address(0));

        (bool success, ) = _implementation.delegatecall(msg.data);
    }

    receive () external payable {
        
    }
}

// Vulnerable Banking Application
contract VulnerableBank {
    CustomerDatabaseProxy public customerDatabaseProxy;
    mapping(address => uint256) public balances;
    address owner; // SWC-108
    uint256 private promoTime;
    
    constructor(address payable _customerDatabase) {
        customerDatabaseProxy = CustomerDatabaseProxy(_customerDatabase);
        owner = msg.sender;
        promoTime = 1 weeks;
    }
    
    modifier isOwner() {
        require(tx.origin == owner, "You are not the owner");
        _;
    }
    
    modifier isNewCustomer() {
        require(
            customerDatabaseProxy.isNewCustomer(msg.sender, promoTime),
            "You are not a new customer"
        );
        _;
    }

    modifier falseAssertion(){
        assert(false); // SWC-110
        _;
    }

    function changePromoTime(uint256 amount) public isOwner {
        promoTime = amount;
    }
    
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        msg.sender.call{value: amount}("");
        balances[msg.sender] -= amount;
    }
    
    function withdrawPromo() public isNewCustomer {
        require(customerDatabaseProxy.isCustomer(msg.sender), "You are not a customer");
        
        payable(msg.sender).transfer(1000 gwei);
    }
    
    function emergencyWithdraw() public isOwner falseAssertion{
        payable(tx.origin).transfer(address(this).balance);
    }

     // Distribute loyalty rewards to all customers who have been with us for at least 6 months
    function distributeLoyaltyRewards() public isOwner {
        address[] memory allCustomers = customerDatabaseProxy.getAllCustomers();
        for (uint i = 0; i < allCustomers.length; i++) {
            address customer = allCustomers[i];
            uint256 joinedAt = customerDatabaseProxy.customerJoinedAt(customer);
            // Check if the customer has been with us for at least 6 months
            if (block.timestamp >= joinedAt + 26 weeks) {
                // Attempt to transfer 1000 gwei to each eligible customer
                (bool success, ) = payable(customer).call{gas: 2300, value: 1000 gwei}("");
                require(success, "Transfer failed");  // If one transfer fails, the loop breaks and others won't get paid
            }
        }
    }

    struct LockRecord {
        uint256 amount;
        uint256 maturityTime;
    }

    mapping(address => LockRecord) public lockRecords;
    // Function to lock a certain amount of Ether
    function lockAmount(uint256 amount, uint256 lockDuration) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        LockRecord memory record = LockRecord({
            amount: amount,
            maturityTime: block.timestamp + lockDuration
        });
        
        lockRecords[msg.sender] = record;
        balances[msg.sender] -= amount;
    }

    // Function to withdraw the locked amount with interest after it matures
    function withdrawLockedAmountWithInterest() public {
        LockRecord memory record = lockRecords[msg.sender];
        require(record.maturityTime <= block.timestamp, "Amount not yet matured");
        
        uint256 amountWithInterest = record.amount + (record.amount / 10);  // 10% interest
        
        require(address(this).balance == amountWithInterest, "Contract balance mismatch");
        
        payable(msg.sender).transfer(amountWithInterest);
    }
}
