<html>
<head>
<title>Ilogin</title>
<script language="JavaScript">
function Abort(){
history.back();
}
</script>
</head>
<BODY bottomMargin=0 aLink=#f0f0f0 leftMargin=90 rightMargin=90 link=#f0f0f0
topMargin=5 bgColor=#98
afc7 vLink=#f0f0f0 >
<TABLE border=10 cellSpacing=0 cellPadding=0 width="100%" bgColor=#4e9258>
<TR>
<TD vAlign=top align=middle>
<TABLE bgcolor=#f0f0f0 border=0 cellSpacing=0
cellPadding=0 width=140 align=center>
<TR>

<TD height=100 width="50%"><IMG border=0 alt="" src="online.jpg" width=780
height=100>
</TD>
</tr>

<%@page import="java.sql.*"%>
<%Cookie c1,c2;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection c=DriverManager.getConnection("jdbc:odbc:mydsn");
Statement s=c.createStatement();
String name=request.getParameter("LoginName");
String password=request.getParameter("Password");
String s3="";
if(request.getParameter("remember")!=null)
s3=request.getParameter("remember");
ResultSet rs=s.executeQuery("select * from org_details where LoginName='"+name+"' and Password='"+password+"'");
if(!rs.next())
{
out.println("<TABLE border=0 cellSpacing=10 cellPadding=0 width=100% bgColor=#54c571>
<tr><td
width=30% align=left>");
out.println("<img src=fail.gif width=200 height=150></td><td align=left>");
out.println("<h3>Username or password is incorrect...Try again</h3></td></tr>");
out.println("<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>");
out.println("<tr><td align=left><a href='ilogin.jsp'>Back</a></td></tr>");
}
else
{
String inid=rs.getString(1);
request.setAttribute("iname",name);
request.setAttribute("iid",inid);
RequestDispatcher rd=request.getReque
stDispatcher("afterilogin2.jsp");
rd.forward(request, response);
}
if(s3.equals("on")){
c1=new Cookie("name",name);
c2=new Cookie("pass",password);
}
else
{
c1=new Cookie("name","");
c2=new Cookie("pass","");
}
response.addCookie(c1);
response.addCookie(c2);
%>
</TABLE>
</body>
</html>