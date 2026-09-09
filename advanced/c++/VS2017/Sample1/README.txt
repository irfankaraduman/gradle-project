
This is a simple C++ program that contains two issues, a Command
Injection issue, and an Unchecked Return Value issue. You need to
have Visual Studio 2017 and the Fortify Extension for Visual Studio 2017 installed.

To run this sample, follow these steps:

1. In Visual Studio 2017, open Samples\advanced\c++\VS2017\Sample1\Sample.sln.

2. To capture vulnerabilities listed below, see the Fortify Extension for Visual Studio User Guide and
the instructions for configuring advanced local scan options and add the additional scan option: -scan-policy classic.

3. Select Fortify > Analyze Solution.

NOTE: If you do not have the Fortify menu, you have not installed the
Fortify Extension for Visual Studio.

This translates and scans the solution, and opens the UI for viewing the analysis results
in Visual Studio. If only one issue is visible in the Analysis Results
pane, you might need to change the Filter Set to Security Auditor View.

You should see the following vulnerabilities:

	Command Injection: Input Validation at line 10 of Sample.cpp
	Unchecked Return Value: API Abuse at line 10 of Sample.cpp

The first issue, in the Critical folder, indicates that the application
passes an unknown value contained in argv[0] (argument 0 of the command
line starting the program -- a value entirely controlled by the user) to
the function call system(), which will run it as a command.


The second issue indicates that the program does not check the return value from
the system() function call, which is considered poor programming style.
