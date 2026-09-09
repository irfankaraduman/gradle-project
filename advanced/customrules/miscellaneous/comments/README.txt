COMMENTS CUSTOM RULES
=====================

The rules contained in comments_rules.xml rulepack can be used to detect
missing copyright notices at the top of the files, as well as informative
comments in the real-world applications.

From the $FORTIFY_HOME/Samples/advanced/customrules/miscellaneous/comments
directory, run:

$ sourceanalyzer -b comments -clean
$ sourceanalyzer -b comments Comments.java
$ sourceanalyzer -b comments -rules comments_rules.xml -scan -f comments.fpr

And view the results with Audit Workbench:

$ auditworkbench comments.fpr

You should see the following output:

	Missing Copyright Notice: 1
	Informative Comment: 3
