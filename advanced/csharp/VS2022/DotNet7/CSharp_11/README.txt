This sample includes simple C# programs that contain Command Injection and System Information Leak vulnerabilities. To analyze these programs, you must have .NET 7 and MSBuild 17.4 or Visual Studio 2022 installed.
This sample uses new C# 11 features including "List Patterns", "Pattern match Span<char> on a constant string", and "Raw string literals".

Translate and scan the solution from the Developer Command Prompt.
Change to this directory (VS2022\DotNet7\CSharp_11), and then run the following commands:
  $ sourceanalyzer -b cs11 -clean
  $ sourceanalyzer -b cs11 msbuild /t:restore /t:rebuild Sample.sln
  $ sourceanalyzer -b cs11 -sc classic -scan -f Sample.fpr

 After successful completion of the scan, you can see the following analysis results:
- Command Injection and System Information Leak vulnerabilities 
- Other categories might also be present, depending on the Fortify Rulepacks used in the scan.

The solution contains the following projects:
1. List Pattern (see ListPattern project):
The MatchMessage function takes a string message as input. 
The first line of the MatchMessage function uses a ternary operator to check if the input string matches the specified pattern. 
The is keyword is used to check if the input string matches a particular pattern. The verification is defined using a C# feature called "list pattern". 
If the input string matches the pattern, the string interpolation expression ($"{message} matches; inner part is {s}.") is evaluated to generate a message that includes the original input string and the extracted inner part. 
If the input string does not match the pattern, the second part of the ternary operator ($"{message} doesn't match.") is evaluated instead.
The last line of the MatchMessage function starts a new process using the Process.Start method. This method starts a new process with the specified file name and command-line arguments. 
In this case, the file name is "cmd.exe", which is the Windows command-line interpreter, and the command-line arguments are "/C " + str, which tells the command-line interpreter to execute the command specified by the str variable. This leads to a Command Injection vulnerability.

2. Pattern match Span<char> on a constant string (see PatternMatchSpanChr project):
The code creates a string str that contains the word "Leak" followed by the name of the current machine, obtained using the Environment.MachineName property. 
It then creates a stack-allocated span of characters called "text" that has the same length as the "str" string.
The str string is then copied to the text span using the CopyTo method. This method copies the contents of the str string to the text span starting at the beginning of the span. 
The AsSpan method is used to obtain a Span<char> representation of the str string, which is required by the CopyTo method.
The next line of code represents the feature "Pattern match Span<char> on a constant string" and checks if the contents of the text span are not equal to the string "Test". 
If the contents of the text span are not equal to "Test", the code prints the contents of the text span to the console using the Console.WriteLine method. This leads to a System Information Leak vulnerability..

3. Raw string literals (see RawStringLiteral project):
The code defines two string variables, name and surname, and initializes them with the value "Joshn" and the name of the current machine, respectively, using the Environment.MachineName property.
The code then defines a string variable called jsonString that contains a JSON object with two properties, "Name" and "Surname", whose values are the name and surname variables, respectively. 
This JSON object is defined using a raw string literal, which is enclosed in triple quotes (""") instead of double quotes. This allows the string to contain newline characters and other escape sequences without needing to use escape characters. 
Additionally, the curly braces surrounding the name and surname variables are escaped using double curly braces ({{ and }}) to indicate that they should be treated as literal curly braces rather than placeholders for variable interpolation.
Finally, the code prints the jsonString variable to the console using the Console.WriteLine method. This leads to a System Information Leak vulnerability.