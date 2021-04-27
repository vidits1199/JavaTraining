<%@page import="com.java.mphasis.lib.ConnectionHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<%
String user=(String)session.getAttribute("username");
Connection con = ConnectionHelper.getConnection();
String cmd = " select * from transreturn where username = ?"; 			
PreparedStatement pst = con.prepareStatement(cmd);
pst.setString(1,user);			
ResultSet rs = pst.executeQuery();

%>
<table border='3' align="center">
<br/><br/>
<tr>
<th>Book ID</th>
<th>From Date</th>
<th>To Date</th></tr>
<% 
while(rs.next()){
	%>
<tr><td><%= rs.getString("BookID")%></td>
<td><%= rs.getString("FromDate")%></td> 
<td><%= rs.getString("ToDate")%></td></tr>
	<%} %>
</table>
</body>
</html>