<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp" pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
</head>

<h2 class="glyphicon glyphicon-log-in"><font color="#71F557">Bienvenue  Cher Réceptionniste : </font></h2>
<h3 align="right">Votre addresse :<a href="#"> ${mail}</a></h3>
<body bgcolor="#FAAEA2">
<div align="center">
<img alt="" src="file:///C:/Users/HP/Desktop/Projet%20JEE/GestionClinique/src/main/webapp/img3/team-2.jpg" width=100 height=100>
<form action="#" method="post">
	<div align="center">
		<table border="2">
		<caption align="top" style="background:blue;color:white;font-size:35;">La liste des Consultations</caption>
		<tr>
		<th style="th">ID</th>
		<th>Date Consultation</th>
		<th>Description</th>
		<th>Prix</th>
		<th>Cin</th>
		</tr>
		 <%
    if(session.getAttribute("cin")==null && session.getAttribute("mail")==null ){
    	response.sendRedirect("login.jsp");		
    }
	 Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_clinique","root","");
	//System.out.print("Connected");
	String req="SELECT * FROM consultation";
	PreparedStatement ps = con.prepareStatement(req);
	ResultSet rs = ps.executeQuery();
	while(rs.next()) { %>
		<tr>
		<td><%=rs.getInt("id")%></td>
		<td><%=rs.getString("date_cons")%></td>
		<td><%=rs.getString("Description")%></td>
		<td><%=rs.getString("prix")%></td>
		<td><%=rs.getString("cin")%></td>
		</tr>
		<% } %>
		</table>
	</div>
</form><br>
<div align="center"><a href="recep_page.jsp">Le Menu</a><br></div>
</body>
</html>







