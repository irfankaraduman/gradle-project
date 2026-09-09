This is a simple Go language program that contains Privacy Violation and Log Forging vulnerabilities.

Analyze the project from the command line using the following commands:
  $ sourceanalyzer -b go-sample -clean
  $ sourceanalyzer -b go-sample Maps/
  $ sourceanalyzer -b go-sample -scan -f sample.fpr -scan-policy classic

After successful completion of the scan, you should see the Privacy Violation and Log Forging vulnerabilities in the analysis results. Other categories might also be present, depending on the Fortify Rulepacks used in the scan.
The first Log Forging vulnerability shows the tainted data from user input flows through "Map" to a call of the log.Println() function with the value obtained from a map by a key.
The second Log Forging vulnerability shows the tainted data from user input flows through "Map" to the assignment of a value from a map to a variable and eventually to a call to the log.Println() function.
The second Privacy Violation vulnerability shows the tainted data from user input flows through "Map" to the assignment of a value from a map to a variable and eventually to a call to the log.Println() function.
