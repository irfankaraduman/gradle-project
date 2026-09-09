This sample demonstrates how to use sourceanalyzer's -filter option.

Filters enable you to suppress specific vulnerabilities by category,
rule ID, or instance ID. In this example, the filter file filter.txt
contains the instance ID of an issue that we want to suppress.

Run the following commands to scan the sample code:

$ sourceanalyzer -b filter-demo -clean

$ sourceanalyzer -b filter-demo gcc filter-demo.c
 - or -
$ sourceanalyzer -b filter-demo cl filter-demo.c

$ sourceanalyzer -b filter-demo -scan -f filter-demo.fpr

Open the results in Audit Workbench:

$ auditworkbench filter-demo.fpr

The results should show one Dangerous Function result.

Run the analysis again, but this time use the filter file provided:

$ sourceanalyzer -b filter-demo -scan -filter filter.txt -f filter-demo.fpr

Open the FPR file in Audit Workbench and there should be no issues.

