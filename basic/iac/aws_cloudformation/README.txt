This sample includes various files that serve as templates for AWS CloudFormation. 
It contains three files, each using a common file extension for CloudFormation templates: .json, .yaml, and .template. 
These files demonstrate different property types supported by AWS CloudFormation, including strings, booleans, integers, enums, and lists. 
Additionally, the sample features examples of intrinsic functions such as Ref, FindInMap, and ForEach.

To analyze the code, run OpenText SAST (Fortify) using the following commands:

$ sourceanalyzer -b amazon-cloudformation-sample -clean
$ sourceanalyzer -b amazon-cloudformation-sample ./
$ sourceanalyzer -b amazon-cloudformation-sample -scan -f amazon-cloudformation-sample.fpr

Open the results in Audit Workbench:

$ auditworkbench amazon-cloudformation-sample.fpr

The analysis results highlight the following vulnerabilities:
	AWS CloudFormation Misconfiguration: Improper IAM Access Control in iamcontrol.json on lines 43, 51, 60 and 67
	AWS CloudFormation Misconfiguration: Improper IAM Access Control Policy in iamcontrol.json on lines 25, 31 and 88
	AWS CloudFormation Misconfiguration: Weak IAM Authentication in iamcontrol.json on lines 43, 51 and 67
	AWS CloudFormation Misconfiguration: Improper S3 Access Control in buckets.template on line 12
	AWS CloudFormation Misconfiguration: Improper S3 Bucket Network Access Control in buckets.template on line 14
	AWS CloudFormation Misconfiguration: Insecure S3 Bucket Storage in buckets.template on line 21
	AWS CloudFormation Misconfiguration: Insecure API Gateway Transport in apigateway.yaml on line 22
	AWS CloudFormation Misconfiguration: Insufficient API Gateway Logging in apigateway.yaml on lines 41 and 59
	AWS CloudFormation Misconfiguration: Weak API Gateway Authentication in apigateway.yaml on line 41

The analysis might identify additional issues depending on the version of OpenText SAST (Fortify) and the Rulepacks used in the scan.

Some issues might be marked as hidden and not immediately visible. To view hidden issues, from the Options menu, select Show Hidden Issues.