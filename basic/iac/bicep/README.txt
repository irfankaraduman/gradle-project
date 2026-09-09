Run OpenText SAST (Fortify) to scan the code (sourceanalyzer requires internet access during scan):

$ sourceanalyzer -b sample -clean
$ sourceanalyzer -b sample sources
$ sourceanalyzer -b sample -scan -f Sample.fpr

Open the results in Audit Workbench:

$ auditworkbench Sample.fpr

The analysis results show vulnerabilities in the following categories:
	Azure ARM Misconfiguration: Hardcoded Secret
	Azure ARM Misconfiguration: Improper Compute VM Access Control 
	Azure ARM Misconfiguration: Insecure Storage Account Transport
	Privacy Violation


The analysis results might include other issues depending on the Rulepack version used in the scan.


The following are brief descriptions of these vulnerability categories:

Azure ARM Misconfiguration: Hardcoded Secret - Sensitive Azure ARM template parameters, such as passwords, typically use the @secure() decorator.
For parameters that use the @secure() decorator, the parameter values are not logged or stored in the deployment history.
However, if a hardcoded default value is configured for a secure type, that default value is discoverable to anyone who can access the template or the deployment history.

Azure ARM Misconfiguration: Improper Compute VM Access Control - Systems protected by basic authentication offer attackers a potential weak link. Attackers can compromise passwords (especially weak ones) by brute-force, guessing, or social engineering.

Azure ARM Misconfiguration: Insecure Storage Account Transport - A service does not enforce robust encryption in transit. Insufficiently protected data communication channels can put critical organizational data at risk of theft, tampering, or disclosure.

Privacy Violation - Privacy violations occur when:
1. Private information enters the program.
2. The data is written to an external location, such as the console, file system, or network.
