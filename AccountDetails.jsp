<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.java.mphasis.lib.ConnectionHelper"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<%
String user=(String)session.getAttribute("username");
out.println(user);
out.write("issued books details :<br/><br/>");
Connection con = ConnectionHelper.getConnection();
String cmd = " select * from tranbook where username = ?"; 			
PreparedStatement ps = con.prepareStatement(cmd);
ps.setString(1,user);			
ResultSet rs = ps.executeQuery();
%>
<table border="3" align="center">
<tr>
<th>Book ID</th>
<th>Issued Date</th></tr>
<% 
while(rs.next()){
	%>
	<tr><td><%=rs.getString("BookID")%></td>
	<td><%= rs.getString("FromDate")%></td></tr>
	<%
}
%>
</table>
</body>
</html>