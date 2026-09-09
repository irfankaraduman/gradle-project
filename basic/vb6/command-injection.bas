Function foo()
  Dim env
  env = Environ("PATH")
  Shell(env)
End Function

Function bar ()
  Dim rs As rdoResultset
  Dim conn As rdoConnection
  Set rs = conn.OpenResultset(Environ())
  Shell(rs.GetClipString(rs.RowCount))
End Function

Function foobar()
  Shell(Request.ServerVariables("QUERY_STRING"))
  Shell(WebClass.Request.ServerVariables("QUERY_STRING"))
End Function
