
This is a sample J2EE cross-tier application with Servlets and EJBs. The
servlet calls the EJB with some data retrieved from the servlet request.
The EJB then makes some JDBC calls using that data received as the
value of a parameter.

To run the sample, change to this directory in a command prompt or 
shell window and run the following commands:
 
$ sourceanalyzer -b ejb-sample -clean
$ sourceanalyzer -b ejb-sample . -cp <path_to_j2ee.jar>
$ sourceanalyzer -b ejb-sample -scan-policy classic -scan -f ejb-sample.fpr

Note that your results will be incomplete if you do not supply j2ee.jar on 
the classpath. It is required to find the System Information Leak issues.

Open the results in Audit Workbench by running the following command:

$ auditworkbench ejb-sample.fpr

Audit Workbench should show at least the following types of issues:

      SQL Injection
      J2EE Misconfiguration: Incomplete Error Handling
      J2EE Misconfiguration: Excessive Session Timeout
      System Information Leak: Incomplete Servlet Error Handling

The Dataflow Analyzer detects the SQL injection vulnerability by
analyzing across the web, EJB, and database tiers. It determines that potentially
tainted data obtained from the servlet request is used to create a SQL
statement thus causing potential vulnerability in the application.

The J2EE Misconfiguration issues are risky configuration settings discovered
in the web.xml file.

The System Information Leaks are locations where exceptions should be caught,
rather than allowing them to pass to the application server, which might
print a stack trace or similar data out, where an attacker might be able to
examine it.

Other issues might also be present.
