<!-- go include the sink definition, so it's available on this page. -->
<!-- #include file="sink.asp" -->
<%
  Set pwd="bar"

  Set sql1="SELECT companyname FROM " & Request.Cookies("hello")
  Set sql2=Request.QueryString("foo")

  MySqlStuff pwd, sql1, sql2

%>
