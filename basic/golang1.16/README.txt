This is a simple Go language program that contains a JSON Injection vulnerability.

Analyze the project from the command line using the following commands:
  $ sourceanalyzer -b go-sample -clean
  $ sourceanalyzer -b go-sample JsonInjectionFromEmbedFile_BlockVar/
  $ sourceanalyzer -b go-sample -scan -f sample.fpr -scan-policy classic

After successful completion of the scan, you should see a JSON Injection vulnerability in the analysis results. Other categories of issues might also be present, depending on the Fortify Rulepacks used in the scan.
The JSON Injection vulnerability shows that the tainted data from user input is saved to an embedded file as a JSON object. Data is then decoded from an embedded file and, eventually, function json.Marshal() is called.
