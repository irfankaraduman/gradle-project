Type the following commands to run OpenText SAST (Fortify) on Sample.py:

$ sourceanalyzer -b python-sample -clean

$ sourceanalyzer -b python-sample Sample.py 

$ sourceanalyzer -b python-sample -scan -f python-sample.fpr -sc classic

As with all scripting languages, it is important to translate (the second command that converts source files into analyzable format) as many of the input source files as possible at one time. This enables the translation phase to glean more data from the original sources. In languages such as C or Java, the source files contain explicit information about types and externally referenced code and data, which we must infer for scripting languages.

Open the analysis results file in Audit Workbench:

$ auditworkbench python-sample.fpr

This test demonstrates a couple of simple structural and dataflow vulnerabilities. While it is artificial, it illustrates the types
of problems Python programs frequently experience.
 
The Following detected issues are shown in Audit Workbench:
      -Hardcoded password: Storing credentials directly in source code is insecure and exposes sensitive data if the code is leaked.
      -Privacy violation: Displaying the saved password in plain text reveals confidential information to anyone running the program.
      -System information leak: 
            -Printing raw exception messages can expose internal logic or sensitive details about the system.
            -Catch‑all error handling that outputs exception details may disclose stack traces or runtime environment information.
The Fortify analysis might detect other types of issues depending on the Fortify Security Content (Rulepack) version used
