using System.Diagnostics;

var executor = (Shell: "cmd.exe", Command: " /C " + Console.ReadLine());

string cmd = " /C sdf";

(string shell, cmd) = executor;

Process.Start(shell, cmd);
