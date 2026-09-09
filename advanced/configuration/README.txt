
This is a sample J2EE application that has vulnerabilities in its web
module deployment descriptor: web.xml.

To run the sample, change to this directory in a command prompt or shell
window and run:
 
$ sourceanalyzer -b config-sample -clean
$ sourceanalyzer -b config-sample .
$ sourceanalyzer -b config-sample -scan -f config-sample.fpr -scan-policy classic

View the results with Audit Workbench:

$ auditworkbench config-sample.fpr
