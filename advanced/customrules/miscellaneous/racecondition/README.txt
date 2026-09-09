RACE CONDITION CUSTOM RULES
===========================

The rule contained in race_condition_rules.xml rulepack can be used to detect
possible race conditions on assignments to non-final static fields in real-world
applications. To reduce false potives, the rule is designed not to report 
assignments that are performed inside a synchronized block, but no verification
of correct synchronization is performed. 

From the $FORTIFY_HOME/Samples/advanced/customrules/miscellaneous/racecondition 
directory, run:

$ sourceanalyzer -b racecondition -clean
$ sourceanalyzer -b racecondition RaceCondition.java
$ sourceanalyzer -b racecondition -rules race_condition_rules.xml -scan -f racecondition.fpr

And view the results with Audit Workbench:

$ auditworkbench racecondition.fpr

The output should contain one Non-final Static Field Race Condition issue.

