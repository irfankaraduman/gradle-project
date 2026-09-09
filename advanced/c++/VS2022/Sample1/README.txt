
This is a simple C++ program that contains some issues. There are 
a Command Injection issue, and a Privacy Violation issue, and a Buffer Overflow issue. You need to
have Visual Studio 2022 and the Fortify Extension for Visual Studio 2022 installed.

To analyze this sample:

1. In Visual Studio 2022, open Samples\advanced\c++\VS2022\Sample1\Sample1.vcxproj.

2. To capture vulnerabilities listed below, see the Fortify Extension for Visual Studio User Guide and 
 the instructions for configuring advanced local scan options and add the additional scan option: -scan-policy classic.

3. Select Extensions > Fortify > Analyze Solution.

NOTE: If you do not see the Fortify menu, you have not installed the
Fortify Extension for Visual Studio.

After the Fortify analysis is complete, the results are displayed in the Analysis Results window
in Visual Studio. If only one issue is visible in the Analysis Results
window, you might need to change the Filter Set to Security Auditor View.

You should see the following vulnerabilities:

	Command Injection: at line 32 of Sample1.cpp
	Privacy Violation: at line 5 of Sample1.cpp
	Buffer Overflow: at line 11 of Sample1.cpp

The Command Injection issue, in the High folder, indicates that the application
passes an unknown value contained in argv[1] (argument 1 of the command
line starting the program -- a value entirely controlled by the user) to
the function call system(), which will run it as a command.

The Privacy Violation issue, in the Critical folder, indicates that  the function printInfo() 
mishandles confidential information on line 5. The program could compromise user privacy.

The Buffer Overflow issue, in the High folder, indicates that the function getCmd() might be able 
to write outside the bounds of allocated memory on line 11, which could corrupt data, 
cause the program to crash, or lead to the execution of malicious code.