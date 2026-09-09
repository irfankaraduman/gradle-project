This sample is an example of a Salesforce Apex project. It consists of .cls, .page and .object files, 
representing Apex classes, VisualForce pages, and custom objects in the Salesforce database.
It was created using Salesforce Ant Migration Tool, and package.xml was used in the sample.
A sample requires at least v57 of Apex and VisualForce. It consists of a wide range of vulnerabilities, 
that OpenText SAST (Fortify) can detect inside Apex classes and VisualForce pages.

Run OpenText SAST (Fortify) to scan the code:

$ sourceanalyzer -b salesforce-apex-sample -clean
$ sourceanalyzer -b salesforce-apex-sample ./
$ sourceanalyzer -b salesforce-apex-sample -scan -f salesforce-apex-sample.fpr

Open the results in Audit Workbench:

$ auditworkbench salesforce-apex-sample.fpr

The analysis results should contain following vulnerabilities:
	Cross-Site Scripting : Reflected in CrossSiteScriptingReflected.cls on line 10
	Frame Spoofing in FrameSpoofing.page on line 6
	Header Manipulation in HeaderManipulation.cls on line 11
	Open Redirect in OpenRedirectController.cls on line 6
	Path Manipulation in PathManipulationController.cls on line 6
	Privacy Violation in PrivacyViolationController.cls on line 12
	SOQL Injection in SOQLInjection.cls on line 10
	SOSL Injection in SOSLInjection.cls on line 10

The analysis results might include other issues depending on the version of the Rulepacks used in the scan.

Some issues might be marked as hidden and not visible. In order to see them, you can go to Options->Show Hidden Issues and activate this option.
