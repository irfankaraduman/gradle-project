This is a simple C# program that contains SQL injection vulnerabilities. You must have .NET Framework 4.7.2 and MSBuild 15.0 or Visual Studio 2017 installed (and optionally the Fortify extension for Visual Studio 2017).

You can translate and scan the solution from the command line:
From the Windows command prompt, change to this directory (VS2017\Sample1), and then run the following commands:
  $ sourceanalyzer -b cs-sample -clean
  $ sourceanalyzer -b cs-sample msbuild /t:rebuild Sample1.sln
  $ sourceanalyzer -b cs-sample -sc classic -scan -f Sample.fpr

Alternatively, if you have Visual Studio 2017 installed you can translate and scan the solution from the Developer Command Prompt:
1. Start a Developer Command Prompt for Visual Studio 2017 window.  
2. Change to this directory (VS2017\Sample1) and run the following commands:
  $ sourceanalyzer -b cs-sample -clean
  $ sourceanalyzer -b cs-sample devenv Sample1.sln /REBUILD Debug
  $ sourceanalyzer -b cs-sample -sc classic -scan -f Sample.fpr

If you have the Fortify Extension for Visual Studio 2017 installed, you can translate and scan the solution from Visual Studio:
1. In Visual Studio 2017, open Sample1\Sample1.sln.
2. Select Fortify > Analyze Solution.

NOTE: If you do not have the Fortify menu, you have not installed the Fortify Extension for Visual Studio.
After successful completion of the scan, you should see the SQL Injection vulnerabilities and one Unreleased Resource vulnerability. Other categories might also be present, depending on the Fortify Rulepacks used in the scan.
The first SQL Injection vulnerability is reported for SqlDataAdapter object created with an argument to the main function.
The second vulnerability shows the tainted data flow through String concatenation and cloning to a call to create a SqlDataAdapter.
