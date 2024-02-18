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
<h2>Select your start and end location</h2><br/><br/>
<form method="post" action="#">
Choose the Start Location: <select id="bus" name="busname">
<option value="chennai">Chennai</option>
<option value="trichy">Trichy</option>
<option value="madurai">Madurai</option>
<option value="kanyakumari">Kanyakumari</option>
<option value="koorg">Koorg</option>
</select>

Choose the End Location: <select id="bus1" name="busname1">
<option value="chennai">Chennai</option>
<option value="trichy">Trichy</option>
<option value="madurai">Madurai</option>
<option value="kanyakumari">Kanyakumari</option>
<option value="koorg">Koorg</option>
</select>
<br/><br/>

<input type="submit" value="Submit" name="submit"/>
</form>

<table>
            <tr>
                <th>id</th>
                <th>Student Name</th>
                <th>Course</th>
                <th>Fee</th>
                <th>Book tickets</th>
            </tr>
            
            <%
            if((request.getParameter("submit"))!=null){
            	
            
            Connection con;
               ResultSet rs;
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
               String sl=request.getParameter("busname");
               String el=request.getParameter("busname1");
           
               String query = "select * from busdetail WHERE startLocation='"+sl+"'";
               Statement st = con.createStatement();
                  rs= st.executeQuery(query);
                  
                      while(rs.next())
                      {
                    	  String id = rs.getString("busid");
                    	  String slocation=rs.getString("startLocation");
                    	  String elocation=rs.getString("endLocation");
                    	  
                    	  
                    		  
                    	  
                    	  
                      
             %>
             
	               <tr>
	                <td><%= id%></td>
	                <td><%= slocation%></td>
	                <td><%= elocation%></td>
	                <td><%=rs.getString("Price") %></td>
	                <td><a href="<%= id%>.jsp">Book here</a></td>
	               </tr>  
               
                   <%
                       }}
            
                   %>
                   
       </table>

</body>
</html>
