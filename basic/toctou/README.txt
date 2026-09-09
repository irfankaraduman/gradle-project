This sample demonstrates a time-of-check/time-of-use vulnerability.

Note: You must have the gcc or the cl compiler installed on your
system to analyze this sample.

To analyze the sample code, type the following commands:

$ sourceanalyzer -b toctou -clean

$ sourceanalyzer -b toctou gcc toctou.c
 - or -
$ sourceanalyzer -b toctou cl toctou.c

$ sourceanalyzer -b toctou -scan -scan-policy classic -f toctou.fpr

Open the results in Audit Workbench:

$ auditworkbench toctou.fpr

The output should show a single File Access Race Condition issue.

OpenText SAST (Fortify) detects a TOCTOU vulnerability in the code
that checks permissions on a file prior to opening that file. The code
checks that a user has access to write to the file, then opens file for
writing. However, between the check and the open, an attacker could have
manipulated the file, causing the program to open a different file than
the one for which the access checks were performed.
