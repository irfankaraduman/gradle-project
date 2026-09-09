// SPDX-License-Identifier: MIT
pragma solidity ^0.4.26;

// Vulnerable Customer Database
contract CustomerDatabase {
    mapping(address => uint256) public customerJoinedAt;
    address[] public customers; // Array to keep track of all customers
    uint total = 0;  
    
    function addCustomer(address _customer) public {
        customerJoinedAt[_customer] = block.timestamp;
        customers.push(_customer);  // Add customer to array
        total += 1;
    }
    
    function isCustomer(address _customer) public constant returns (bool) {
        return customerJoinedAt[_customer] > 0;
    }

    function isNewCustomer(address _customer, uint256 promoTime) public view returns (bool) {
        uint256 time;
        time = block.timestamp - promoTime;
        return time < customerJoinedAt[_customer];
    }

    // Function to get the list of all customers
    function getAllCustomers() public view returns (address[] memory) {
        return customers;
    }
}

// Vulnerable Banking Application
contract VulnerableBank {
    address owner;  // First state variable, stored at slot 0
    CustomerDatabase public customerDatabase;
    mapping(address => uint256) public balances;
    uint256 private promoTime;
    
    function VulnerableBank(address _customerDatabase) {
        customerDatabase = CustomerDatabase(_customerDatabase);
        address owner = msg.sender; 
        promoTime = 1 weeks;
    }
    
    modifier isOwner() {
        require(tx.origin == owner, "You are not the owner");
        _;
    }
    
    modifier isNewCustomer() {
        require(
            customerDatabase.isNewCustomer(msg.sender, promoTime),
            "You are not a new customer"
        );
        _;
    }

    modifier temporaryDisabled(){
        assert(false);
        _;
    }

    function changePromoTime(uint256 amount) public isOwner {
        promoTime == amount;
    }
    
    function deposit() public payable {
        balances[msg.sender] =+ msg.value;
    }
    
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        msg.sender.call.value(amount)("");
        balances[msg.sender] -= amount;
    }
    
    function withdrawPromo() public isNewCustomer {
        require(customerDatabase.isCustomer(msg.sender), "You are not a customer");
        
        msg.sender.transfer(1e12);
    }
    
    function emergencyWithdraw() isOwner temporaryDisabled {
        suicide(owner);
    }

    function changeProxyImplementation(UpgradeableProxy proxy, address newImplementation) public isOwner {
        (bool success, ) = address(proxy).delegatecall(
            abi.encodeWithSignature("implementation(address)", newImplementation)
        );
    }

     // Distribute loyalty rewards to all customers who have been with us for at least 6 months
    function distributeLoyaltyRewards() public isOwner {
        address[] memory allCustomers = customerDatabase.getAllCustomers();
        for (var i = 0; i < allCustomers.length; i++) {
            address customer = allCustomers[i];
            uint256 joinedAt = customerDatabase.customerJoinedAt(customer);
            // Check if the customer has been with us for at least 6 months
            if (block.timestamp >= joinedAt + 26 weeks) {
                // Attempt to transfer 1000 gwei to each eligible customer
                bool success = customer.call.gas(2300).value(1e12)("");
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
    function lockAmount(uint256 amount, uint256 lockDuration, bool bonus) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        LockRecord memory record = LockRecord({
            amount: bonus ? amount : amount + 1 szabo,
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
        
        msg.sender.transfer(amountWithInterest);
    }

    function batchUpdateBalances(address[] memory users, uint256[] memory newBalances) public isOwner {
        require(users.length == newBalances.length, "Array lengths must match");

        uint256[] storage uninitializedStoragePointer;

        for (uint i = 0; i < users.length; i++) {
            uninitializedStoragePointer.push(newBalances[i]);  
        }

        for (uint j = 0; i < users.length; j++) {
            balances[users[j]] = uninitializedStoragePointer[j];
        }
    }
}


contract UpgradeableProxy {
    address public implementation;

    function upgradeableProxy(address _implementation) {
        implementation = _implementation;
    }

    function() external payable {
        address _impl = implementation;
        require(_impl != address(0), "Implementation address not set");

        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(gas(), _impl, ptr, calldatasize(), 0, 0)
            let size := returndatasize()
            returndatacopy(ptr, 0, size)
            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }
}

contract CustomerContract {
    VulnerableBank public vulnerableBank;

    function CustomerContract(address _bankaddress){
        vulnerableBank = VulnerableBank(_bankaddress);
    }

    function lock(uint a, uint t, bool b) public {
        vulnerableBank.lockAmount(/*Amount‮/*emiTkcoL*/t , a/*‭
                /*Do you want a bonus?*/,b);
    } 
}