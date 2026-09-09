Run OpenText SAST (Fortify) to scan the code (sourceanalyzer requires internet access during scan):

$ sourceanalyzer -b sample -clean
$ sourceanalyzer -b sample sources
$ sourceanalyzer -b sample -scan -f Sample.fpr

Open the results in Audit Workbench:

$ auditworkbench Sample.fpr

The analysis results show vulnerabilities in the following categories:
	Authorization Bypass: tx.origin
	Code Correctness: Reentrancy
	Dynamic Code Evaluation: Delegatecall
	Integer Overflow
	Solidity Misconfiguration: Compiler With Known Vulnerabilities


The analysis results might include other issues depending on the Rulepack version used in the scan.


The following are brief descriptions of these vulnerability categories:

Authorization Bypass: tx.origin - The tx.origin global variable holds the address of the account from where a transaction originated.
If a smart contract S1, receives a transaction from an account A1, and then S1 calls another smart contract S2, then inside S2, tx.origin contains the address of account A1. If the intent of tx.origin is to verify authorization of A1, then this authorization is bypassed.
If an attacker tricks a user into sending a transaction into a malicious contract that invokes the vulnerable contract where the user is authorized via tx.origin, then tx.origin contains the address of the user account that initiated the transaction and authorization is bypassed.

Code Correctness: Reentrancy - A reentrancy attack occurs when a malicious contract calls back into the calling contract before the first invocation is finished. This happens when a vulnerable contract exposes a function that interacts with external contracts before locally carrying out the effect of the current call. This can lead to the external contract taking over the control flow of the interaction.

Dynamic Code Evaluation: Delegatecall - Unlike a regular message call, using delegatecall causes the code at the target address to be executed in the context of the calling address. delegatecall effectively enables the smart contract to dynamically load code from a different address at runtime, which is dangerous as the code at the target address can change any storage values and potentially take over full control of the caller's balance.

Integer Overflow - An integer overflow/underflow occurs when a calculation or an arithmetic operation results in a value that is over/under the maximum/minimum value of the integer type. This causes the value to loop back to the lower/upper limit and continue from there. The resulting value of an arithmetic operation is effectively the modulus of the integer range from the upper/lower boundaries.

Solidity Misconfiguration: Compiler With Known Vulnerabilities - When developers create a Solidity smart contract, they can specify the compiler version to use. However, many compiler-related vulnerabilities have been publicly disclosed over the years and newer patched versions of the compiler have been created to address those issues. The smart contract currently specifies use of a version of the compiler that has known vulnerabilities.