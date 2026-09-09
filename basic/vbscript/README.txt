Type the following commands to run OpenText SAST (Fortify) on source.asp and sink.asp:

$ sourceanalyzer -b sample-asp -clean

$ sourceanalyzer -b sample-asp source.asp sink.asp

$ sourceanalyzer -b sample-asp -scan -f sample-asp.fpr

Open the analysis results file in Audit Workbench:

$ auditworkbench sample-asp.fpr

This sample demonstrates a couple of simple SQL injection attacks. In the
file source.asp, two tainted strings are prepared, sql1 and sql2. The
first contains a cookie from the Request object and the second a parameter.
Both these strings, therefore, contain data that could have been provided
by a malicious user.

source.asp then calls a subroutine, MySqlStuff(), with these data as
parameters.

The sink.asp file contains the definition of MySqlStuff(), and does some
dubious things with its arguments. It appears to assume that its arguments
have been validated as "safe" because it simply uses them to access a database
object directly at lines 7 and 9, respectively.
