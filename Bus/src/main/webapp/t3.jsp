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
String[] g=request.getParameterValues("c");
if(g!=null & g.length!=0){
	for(int i=0;i<g.length;i++){
		
		Connection c=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
			Statement s=c.createStatement();
			String q="SELECT * FROM bus3 WHERE seatno = "+g[i];
			ResultSet rs=s.executeQuery(q);
			while(rs.next()){
				String a=rs.getString("alloted");
				out.println(a);
			if(a.equals("false")){
			Class.forName("com.mysql.jdbc.Driver");
			c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
			PreparedStatement s1=c.prepareStatement("UPDATE bus3 SET alloted='true' WHERE seatno=?");
			s1.setString(1,g[i]);
			s1.executeUpdate();
			out.println("booked");
			}
			else{
				out.println("already booked");
			}
			}
			
		}
		catch(Exception e){
			out.println(e);
		}
	}
}
%>
</body>
</html>