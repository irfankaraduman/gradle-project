SEMANTIC CUSTOM RULES
=====================

From the $FORTIFY_HOME/Samples/advanced/customrules/semantic directory, run:

$ sourceanalyzer -b semantic_sample -clean
$ sourceanalyzer -b semantic_sample -classpath FooBar.jar FooBar.java
$ sourceanalyzer -b semantic_sample -rules semantic_rules.xml -scan -f semantic_sample.fpr

And view the results with Audit Workbench:

$ auditworkbench semantic_sample.fpr

You should see the following output:

	Unconditional: 10
	Unchecked Return Value: 1
	Process Control: 3
