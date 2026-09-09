using System.Diagnostics;

namespace sealedToString
{
    class SealedToStr
    {
        static void Main(string[] args)
        {
            var taint_data = Console.ReadLine();
            var clear_data = "ClearData";
            var shell = "cmd.exe";
            CommandToExecute command_read = new CommandToExecute(clear_data);
            InheritedRecord inh_rec = new InheritedRecord(taint_data);

            Console.WriteLine(command_read.ToString());
            Console.WriteLine(inh_rec.ToString());

            Process.Start(shell, inh_rec.ToString());
        }

        public record CommandToExecute(string CommandName)
        {
            public sealed override string ToString()
            {
                return $" /C {CommandName}";
            }
        }

        public record InheritedRecord : CommandToExecute
        {
            public InheritedRecord(string CommandName) : base(CommandName)
            {

            }
        }
    }
}
