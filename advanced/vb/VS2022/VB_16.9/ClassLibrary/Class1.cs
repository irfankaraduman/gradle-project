namespace ClassLibrary
{
    public class Class1
    {
        public record Something 
        { 
            public int ID { get; init; }
            public string Machine { get; init; } = Environment.MachineName;
        }
    }
}
