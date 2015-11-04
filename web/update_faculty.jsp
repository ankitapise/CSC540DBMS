<%-- 
    Document   : update_student
    Created on : 2 Nov, 2015, 2:09:05 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile - NCSU Libraries</title>
    </head>
    <body>
        <div>
            <center>
                <h2> NCSU LIBRARIES </h2>
            </center>
        </div>
        <%
            String password = request.getParameter("password");
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String nationality = request.getParameter("nationality");
            
            try 
                {
                    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?" + "user=root&password=localhost_123");
                    CallableStatement cstmt = conn.prepareCall("{call update_faculty_profile(?,?,?,?,?)}");
                    cstmt.setString(1,session.getAttribute("user_id").toString());
                    cstmt.setString(2,password);
                    cstmt.setString(3,first_name);
                    cstmt.setString(4,last_name);
                    cstmt.setString(5,nationality);
                    cstmt.executeUpdate();
                    response.sendRedirect("faculty_profile.jsp");
                } 
            catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            %> 
            
    </body>
</html>
