Type the following commands to run OpenText SAST (Fortify) on source.php and sink.php:

$ sourceanalyzer -b php-sample -clean

$ sourceanalyzer -b php-sample Sample.php -php-version 8.0

$ sourceanalyzer -b php-sample -scan -f php-sample.fpr

As with all scripting languages, it is important to translate (the second command that converts source files into analyzable format) as many of the input source files as possible at one time. This enables the translation phase to glean more data from the original sources. In languages such as C or Java, the source files contain explicit information about types and externally referenced code and data, which we must infer for scripting languages.

Open the analysis results file in Audit Workbench:

$ auditworkbench php-sample.fpr

This test demonstrates a couple of simple dataflow vulnerabilities. While it is artificial, it illustrates the types
of problems PHP programs frequently experience. The program reads data from
the $_GET array (which contains data provided by the -- potentially
hostile -- browser) into the variable $tainted.

This variable, which contains potentially dangerous data from an
attacker, is passed to another function, sqlCall().

This function does one dangerous thing with the arguments, which it
evidently trusts:

      - Prints out a string, which will normally wind up on a web page. An attacker carefully placing hostile data in a URL can thus control this web page.
      - Runs a SQL query. An attacker placing hostile data in a URL can perform essentially any database operation.

The Following detected issues are shown in Audit Workbench:
       -cross-site scripting (XSS) 
       -SQL Injection
       -Password Managment: Hardcoded Password

The Fortify analysis might detect other types of issues depending on the Fortify Security Content (Rulepack) version used
