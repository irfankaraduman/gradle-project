string name = "Joshn";
string surname = Environment.MachineName;

string jsonString =
  $$"""
  {
    "Name": {{name}},
    "Surname": {{surname}}
  }
  """;

Console.WriteLine(jsonString);