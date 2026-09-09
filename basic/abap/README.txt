Run OpenText SAST (Fortify) to scan the code:

$ sourceanalyzer -b sample -clean
$ sourceanalyzer -b sample sample.abap
$ sourceanalyzer -b sample -scan -f Sample.fpr

Open the results in Audit Workbench:

$ auditworkbench Sample.fpr

The analysis results contain vulnerabilities in the following category:
	Privacy Violation

The analysis results might include other issues depending on the version of the Rulepacks used in the scan.

In this sample, the Privacy Violation vulnerability indicates that mishandling private or sensitive information, such as passwords can compromise user privacy.