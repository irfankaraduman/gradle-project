These are simple C# programs that contain Command Injection vulnerabilities. You must have .NET 6 and MSBuild 17.0 or Visual Studio 2022 installed.
These samples use new C# 10 features including "Record types can seal ToString", and "Assignment and declaration in same deconstruction".
This sample also includes an example for a new improvement of LINQ method "ElementAt". It is now possible to use indexing starting from the end.

Translate and scan the solution from the Developer Command Prompt.
Change to this directory (VS2022\DotNet6\Sample1), and then run the following commands:
  $ sourceanalyzer -b cs10 -clean
  $ sourceanalyzer -b cs10 msbuild /t:restore /t:rebuild Sample.sln
  $ sourceanalyzer -b cs10 -scan -f Sample.fpr

 After successful completion of the scan, you should have the following analysis results:
- Command Injection vulnerabilities 
- Other categories might also be present, depending on the Fortify Rulepacks used in the scan.

A data flow "Command Injection" vulnerability is reported in three files:
* AssignAndDeconstruct.cs - Tainted data is passed through a new deconstruction and used to start a new process.
* LINQ_ElementAt.cs - Tainted data is retrieved from the "commands" array using the LINQ method "ElementAt" by indexing starting from the end. Later, the tainted data is used to start a new process.
* SealedToStr.cs - Tainted data is passed through a record "InheritedRecord", that inherits a "ToString" method from a base record. Later, the tainted data is used to start a new process.
