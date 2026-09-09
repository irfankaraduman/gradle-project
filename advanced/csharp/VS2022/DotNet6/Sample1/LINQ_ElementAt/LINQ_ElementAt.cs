using System.Diagnostics;

var taintData = Console.ReadLine();
var commands = new[] { "test1", "test2", taintData, "test3", "test4" };

var commandFromTheEnd = commands.ElementAt(^3);

Process.Start("cmd.exe", " /C " + commandFromTheEnd);