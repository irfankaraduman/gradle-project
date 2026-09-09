This sample includes simple VB.NET programs that contain a System Information Leak vulnerability. 
To analyze these programs, you must have .NET SDK 8.0 and MSBuild 17.4 (or later) or Visual Studio 2022 installed.

The sample uses the VB.NET 16.9 feature: Init only properties

Translate and scan the solution from the Developer Command Prompt with the following commands:
  $ sourceanalyzer -b Sample -clean
  $ sourceanalyzer -b Sample msbuild /t:restore /t:rebuild VB_16.9.sln
  $ sourceanalyzer -b Sample -sc classic -scan Sample.fpr

Open the results (FPR file) in Audit Workbench.

In this sample, the System Information Leak indicates that sensitive data is written out to the console.
The analysis results might include other issues depending on the version of the Rulepacks used in the scan.

