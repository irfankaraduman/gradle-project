CONFIGURATION CUSTOM RULES
==========================

From the <Install_Dir>/Samples/advanced/customrules/configuration directory,
run the following commands:

$ sourceanalyzer -b properties_sample -clean
$ sourceanalyzer -b properties_sample properties/
$ sourceanalyzer -b properties_sample -rules configuration_rules.xml -scan -f properties_sample.fpr

And view the results with Audit Workbench:

$ auditworkbench properties_sample.fpr

The output should contain five J2EE Misconfiguration issues: two in
security.properties and three in username.properties:


If you run the following commands:

$ sourceanalyzer -b xml_sample -clean
$ sourceanalyzer -b xml_sample xml/
$ sourceanalyzer -b xml_sample -rules configuration_rules.xml -scan -f xml_sample.fpr

And view the results with Audit Workbench:

$ auditworkbench xml_sample.fpr

You should see this output:

	J2EE Misconfiguration: 2
