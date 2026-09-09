This folder contains a sample Java web application.

To analyze the sample, change to this directory in a command prompt or 
shell window and run the following commands:
 
$ sourceanalyzer -b LoginProject -clean
$ sourceanalyzer -b LoginProject -cp LoginProject/lib/**/*.jar -source 17 LoginProject
$ sourceanalyzer -b LoginProject -scan-policy classic -scan -f LoginProject.fpr

Open the analysis results in Audit Workbench:

$ auditworkbench LoginProject.fpr

The analysis results should contain vulnerabilities in the following categories:

      Cross-Site Scripting: Persistent
	  SQL Injection
      System Information Leak: Incomplete Servlet Error Handling
	  Trust Boundary Violation
	  
The analysis results might include other issues depending on the version of the Rulepacks used in the scan.

The SQL injection issue indicates that potentially
tainted data obtained from the servlet request is used to create a SQL
statement, which might cause a potential vulnerability in the application.

The Cross-Site Scripting: Persistent vulnerability indicates that data enters a web application through an untrusted source. In the case of persistent (also known as stored) XSS, the untrusted source is typically a database or other back-end data store, while in the case of reflected XSS it is typically a web request.

The System Information Leaks vulnerability indicates there are locations where exceptions should be caught,
rather than allowing them to pass to the application server.

A trust boundary violation occurs when a program blurs the line between what is trusted and what is untrusted. The most common way to make this mistake is to allow trusted and untrusted data to commingle in the same data structure.