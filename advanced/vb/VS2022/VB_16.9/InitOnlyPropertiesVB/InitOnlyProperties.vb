Imports System
Imports ClassLibrary.Class1

Module Program
    Sub Main(args As String())
        Dim c = New Something With {.ID = Environment.ProcessId}
        Console.WriteLine(c.ID)
    End Sub
End Module
