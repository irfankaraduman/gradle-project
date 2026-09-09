The SQL code in this sample demonstrates some simple issues that can
exist in SQL code.

To analyze the file database.pks, run the following commands:

$ sourceanalyzer -b db -clean
$ sourceanalyzer -b db database.pks
$ sourceanalyzer -b db -scan -f database.fpr

Open the results in Audit Workbench:

$ auditworkbench database.fpr

The analysis results show an "Access Control: Database" vulnerability. The user
supplies a string that appears to be used as a username in the SQL query
without being properly validated and/or escaped. This might represent an
access control problem.

Depending on the Rulepack version used in the scan, OpenText SAST (Fortify)
might discover other vulnerabilities.
