DATA FLOW CUSTOM RULES
======================

From the $FORTIFY_HOME/Samples/advanced/customrules/dataflow directory, run:

$ sourceanalyzer -b dataflow_sample -clean
$ sourceanalyzer -b dataflow_sample -classpath FruitQuery.jar FruitQuery.java
$ sourceanalyzer -b dataflow_sample -rules dataflow_rules.xml -scan -f dataflow_sample.fpr

And view the results with Audit Workbench:

$ auditworkbench dataflow_sample.fpr

You should see the following output:

	SQL Injection: 4
