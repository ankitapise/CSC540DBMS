<%-- 
    Document   : validate_faculty_login
    Created on : 31 Oct, 2015, 4:13:29 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
    
        try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?" + "user=root&password=localhost_123");    
        CallableStatement cst = conn.prepareCall("{call login_faculty(?,?)}");
        cst.setString(1, username);
        cst.setString(2, password);
        ResultSet rs = cst.executeQuery();                        
        if(rs.next()){
            session.setAttribute("user_id", username);
            response.sendRedirect("faculty_login_success.jsp");  
        }
        else
        {
            out.println("Invalid login credentials. <a href='index.html'> Try Again </a>");
        }            
   }
   catch(Exception e){       
       out.println("Something went wrong !! <a href='index.html'> Try Again </a>");       
   }      
%>
