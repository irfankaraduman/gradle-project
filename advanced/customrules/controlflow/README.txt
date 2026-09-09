CONTROL FLOW CUSTOM RULES
=========================

From the $FORTIFY_HOME/Samples/advanced/customrules/controlflow directory, run:

$ sourceanalyzer -b controlflow_sample -clean
$ sourceanalyzer -b controlflow_sample -classpath FruitQuery.jar FruitQuery.java
$ sourceanalyzer -b controlflow_sample -rules controlflow_rules.xml -scan -scan-policy classic -f controlflow_sample.fpr

Now view the results in Audit Workbench:

$ auditworkbench controlflow_sample.fpr

You should see the following output:
 
	Unreleased Resource: 1
	Null Dereference: 1
	Poor Error Handling: Overly Broad Throws: 1
