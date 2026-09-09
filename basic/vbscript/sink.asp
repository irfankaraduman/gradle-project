<%

' This file is actually included into the source.asp
' file, which is why the dataflow form the call to MySqlStuff
' to the implementation of it here works. Were this file NOT
' included, what we would have here is really two top-level
' ASP files, so a call to MySqlStuff might actually refer to
' some other function.

Sub MySqlStuff(password, cmd1, cmd2)
  Set conn=Server.CreateObject("ADODB.Connection")
  conn.Provider="Microsoft.Jet.OLEDB.4.0"
  conn.Open "c:/webdata/foo.mdb", "foo", password

  Set rs=conn.Execute(cmd2)
  Set rs = Server.CreateObject("ADODB.recordset")
  rs.Open cmd1, conn
End Sub

%>
