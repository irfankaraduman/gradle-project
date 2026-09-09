Run OpenText SAST (Fortify) to scan the code:

$ sourceanalyzer -b sample -clean
$ sourceanalyzer -b sample sources
$ sourceanalyzer -b sample -scan -f Sample.fpr

Open the results in Audit Workbench:

$ auditworkbench Sample.fpr

The analysis results show vulnerabilities in the following categories:
	Azure ARM Misconfiguration: Databricks Missing Customer-Managed Encryption Key
	Azure ARM Misconfiguration: NetApp Missing Customer-Managed Encryption Key
	Azure ARM Misconfiguration: Insecure Active Directory Domain Service Transport


The analysis results might include other issues depending on the Rulepack version used in the scan.


The following are brief descriptions of these vulnerability categories:

Azure ARM Misconfiguration: Databricks Missing Customer-Managed Encryption Key and Azure ARM Misconfiguration: NetApp Missing Customer-Managed Encryption Key - Customer-managed keys are not used to encrypt data at rest. Customer-managed keys enable organizations to use cryptographic keys of their choice to encrypt data. This gives organizations better control over encryption processes.

Azure ARM Misconfiguration: Insecure Active Directory Domain Service Transport - The Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols provide a protection mechanism to ensure the authenticity, confidentiality, and integrity of data transmitted between a client and web server. Both TLS and SSL have undergone revisions that result in periodic version updates. Each new revision addresses security weaknesses discovered in the previous version. Use of an insecure version of TLS/SSL weakens the strength of the data protection and might allow an attacker to compromise, steal, or modify sensitive information.
