package com.preethi;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Insert extends HttpServlet{

	   public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	      PrintWriter out = res.getWriter();
	      res.setContentType("text/html");
	      
	      String name =(String) req.getParameter("name");
	      String mobno =(String) req.getParameter("mobno");
	      String pass = (String) req.getParameter("pass");
	      String cpass = (String) req.getParameter("cpass");

	       
		   if(mobno.length()==10) 
		   {
			   if(pass.equals(cpass)) 
			   {
			    	  try{
			    	        
			    	        Class.forName("com.mysql.jdbc.Driver");
			    	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
			    	        PreparedStatement pst = con.prepareStatement("insert into sign(Name,Password,MobileNo) values(?,?,?)");
 
			    	        pst.setString(1, name);
			    	        pst.setString(2, pass);
			    	        pst.setString(3, mobno);
			    	        pst.executeUpdate();  
			    	        res.sendRedirect("alert.jsp");
			      }
			    	  catch (Exception e)
			          {
			          out.println("An error occurred."+e);
			          }
			        }
			   else
			   {
				   res.sendRedirect("error1.jsp");
			   }
		   }
		   else
		   {
			   res.sendRedirect("error2.jsp");
		   }
		   }
	   
}
