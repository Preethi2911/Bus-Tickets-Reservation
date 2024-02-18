<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String n=request.getParameter("n");
String p=request.getParameter("p");
session.setAttribute("user", n);
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
    Statement s=con.createStatement();
    String q="SELECT Name,Password FROM sign WHERE Name='"+n+"'";
    ResultSet rs=s.executeQuery(q);
    while(rs.next()){
    	
    	String name=rs.getString("Name");
    	String pass=rs.getString("Password");
    	
    	if(n.equals(name) && p.equals(pass)){
    		
        	response.sendRedirect("welcome.jsp");
        	}
        	else{
        		response.sendRedirect("error.jsp");
        	}
    	
    	
    	
    }
}
catch (Exception e){
	
}

%>
</body>
</html>