Run OpenText SAST (Fortify) to scan the code:

$ sourceanalyzer -b sample -clean
$ sourceanalyzer -b sample -source 17 Sample.java
$ sourceanalyzer -b sample -scan -f Sample.fpr

Open the results in Audit Workbench:

$ auditworkbench Sample.fpr

The analysis results should contain vulnerabilities in the following categories:
	Password Management: Hardcoded Password
	Privacy Violation

The analysis results might include other issues depending on the version of the Rulepacks used in the scan.

In this sample, the Privacy Violation vulnerability indicates that sensitive data is written
to the console.

Hardcoded passwords can compromise system security in a way that is not easy to remedy.
