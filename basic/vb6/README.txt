To analyze the command-injection.bas file, type the following commands:

$ sourceanalyzer -b sample-vb6 -clean

$ sourceanalyzer -b sample-vb6 command-injection.bas

$ sourceanalyzer -b sample-vb6 -scan -scan-policy classic -f sample-vb6.fpr

As with all scripting languages, it is important to translate (the second command that converts source files into analyzable format) as many of the input source files as possible at one time. This enables the translation phase to glean more data from the original sources. In languages such as C or Java, the source files contain explicit information about types and externally referenced code and data, which we must infer for scripting languages.

Open the analysis results file in Audit Workbench:

$ auditworkbench sample-vb6.fpr

Audit Workbench should show at least five issues:

- Four issues are command injection issues, where data from untrusted sources
  (the environment, a remote data object, or a web request) is passed
  to the Shell() function, which simply executes the argument as a command.

- One issue is a SQL injection, where unsafe data (from the environment or via 
  the Environ() function) is used in a call to OpenResultset().

The Fortify analysis might detect other issues depending on the Rulepack version
used in the scan.
