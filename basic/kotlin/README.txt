Run OpenText SAST (Fortify) to scan the code:

$ sourceanalyzer -b sample -clean
$ sourceanalyzer -b sample Sample.kt
$ sourceanalyzer -b sample -scan-policy classic -scan -f Sample.fpr

Open the results in Audit Workbench:

$ auditworkbench Sample.fpr

The analysis results contain vulnerabilities in the following categories:
	Password Management: Hardcoded Password
	Privacy Violation
	System Information Leak: Internal

The analysis results might include other issues depending on the version of the Rulepacks used in the scan.

In this sample, the Privacy Violation vulnerability indicates that sensitive data is written
to the console.

Hardcoded passwords can compromise system security in a way that is not easy to remedy.

System Information Leak: Internal vulnerability occurs when the program sends system data or debug information to a local file, console, or screen using printing or logging.