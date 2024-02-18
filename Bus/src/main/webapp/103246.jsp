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
    
<form action="t1.jsp" method="post">
<input type="checkbox" name="c" value=1></input>
<input type="checkbox" name="c" value=2></input></br></br>
<input type="checkbox" name="c" value=3></input>
<input type="checkbox" name="c" value=4></input></br></br>
<input type="checkbox" name="c" value=5></input>
<input type="checkbox" name="c" value=6></input></br></br>
<input type="checkbox" name="c" value=7></input>
<input type="checkbox" name="c" value=8></input></br></br>
<input type="checkbox" name="c" value=9></input>
<input type="checkbox" name="c" value=10></input></br></br>
<input type="submit" value="submit"></input>
</form>	
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
	Statement s=c.createStatement();
	String q="SELECT alloted,seatno FROM bus1";
	ResultSet rs=s.executeQuery(q);

	while(rs.next()){
			String p=rs.getString("alloted");
			int se=rs.getInt("seatno");
			int[] num={1,2,3,4,5,6,7,8,9,10,11};
			%>
			<script>
			var ele=document.getElementsByName("c");
                     ele[<%=se%>-1].disabled=<%=p%>;  
			</script>
			<% 
	}

}
catch(Exception e){
	out.println(e);
}
%>

</body>
</html>