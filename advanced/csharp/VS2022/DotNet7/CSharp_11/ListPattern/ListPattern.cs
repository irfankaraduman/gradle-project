using System.Diagnostics;

void MatchMessage(string message)
{
    var str = message is ['a' or 'A', .. var s, 'a' or 'A']  
        ? $"{message} matches; inner part is {s}."
        : $"{message} doesn't match.";

    Process.Start("cmd.exe", "/C " + str);
}

Console.Write("Enter something: ");
MatchMessage(Console.ReadLine()); 