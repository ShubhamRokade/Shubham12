<html>
<head>
<title>Hi</title>
</head>
<BODY bottomMargin=0 aLink=#f0f0f0 leftMargin=90 rightMargin=90 link=#f0f0f0
topMargin=5 bgColor=#98afc7 vLink=#f0f0f0 >
<TABLE border=10 cellSpacing=0 cellPadding=0 width="100%" bgColor=#4e9258>
<TR>
<TD vAlign=top align=middle>
<TABLE bgcolor=#f0f0f0 border=0 cellSpacing=0
cellPadding=0 width=140 align=center>
<TR>
<TD height=100 width="25%"><IMG border=0 alt=""
src="logo.gif" width=250
hei
ght=100>&nbsp;</TD>
<TD height=100 width="50%"><IMG border=0 alt=""
src="logo2.jpg" width=580
height=100>
</TD>
<TD height=100 width="25%"><IMG border=0 alt=""
src="logo.gif" width=250
height=100>&nbsp;</TD>
</tr>
<TABLE border=10 cellSpacing=10 cellPadding=0 width="100%"
bgColor=#54c571>
<TR align="right">
<%
String sname=(String)session.getAttribute("sname");
String sid=(String)session.get
Attribute("sid");
String iname=(String)session.getAttribute("iname");
out.println("<TD bgColor=#e56e94 vAlign=top align=middle width='60%'>Hi "+sname+"<FONT
color='white' size=2 face=Tahoma> (student id="+sid+")</FONT></td>");
%>
<TD bgColor=#e56e94 vAlign=top align=middle width="10%"><FONT size=3
face=Arial><B><A
href="logout.jsp">Logout</A></B></FONT></TD></TR></TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=10 width="
100%" bgcolor="#ffffff">
<TR>
<TD vAlign=top align=left>
<P><BR><FONT color=#ff0000 size=4 face="Lucida Calligraphy"><B>
<H1><center>
<%@page import="java.sql.*"%>
<%
Class.forName("su
n.jdbc.odbc.JdbcOdbcDriver");
Connection c=DriverManager.getConnection("jdbc:odbc:mydsn");
Statement s=c.createStatement();
String tbl=iname+"slist";
ResultSet rs=s.executeQuery("select * from "+tbl+" where SID="+sid+" and Sname='"+sname+"'");
rs.next();
d
ouble egiven=Double.parseDouble(rs.getString(3));
if(egiven==1.0){
out.println("You have already given the test.<br><br>");
out.println("<font face='arial' color=blue size=5>Result:<i> "+rs.getString(5)+"</i></font><br>");
out.println("<font face='arial' c
olor=blue size=5>Marks:<i> "+rs.getString(4)+"</i></font><br>");
}
else
{
out.println("Want to take test now??<br><br>");
out.println("<a href='afterslogin3.jsp'><img src='taketest.jpg' width=200 height=200></a><br><br>");
}
%>
</center>
</H1></B></FONT>
</table>
</table>
</body>
</html>