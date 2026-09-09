string str = "Leak: " + Environment.MachineName;
Span<char> text = stackalloc char[str.Length];
str.AsSpan().CopyTo(text);

if (text is not "Test")
{
    Console.WriteLine(text.ToString());
}