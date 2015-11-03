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
            String phone_no = request.getParameter("phone_no");
            String alternate_phone = request.getParameter("alternate_phone");
            String DOB = request.getParameter("DOB");
            String sex = request.getParameter("sex");
            String address_line1 = request.getParameter("address_line1");
            String address_line2 = request.getParameter("address_line2");
            String city = request.getParameter("city");
            String postal_code = request.getParameter("postal_code");
            
            try 
                {
                    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=root");
                    CallableStatement cstmt = conn.prepareCall("{call update_student_profile(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
                    cstmt.setString(1,session.getAttribute("user_id").toString());
                    cstmt.setString(2,password);
                    cstmt.setString(3,first_name);
                    cstmt.setString(4,last_name);
                    cstmt.setString(5,nationality);
                    cstmt.setString(6,phone_no);
                    cstmt.setString(7,alternate_phone);
                    cstmt.setString(8,DOB);
                    cstmt.setString(9,sex);
                    cstmt.setString(10,address_line1);
                    cstmt.setString(11,address_line2);
                    cstmt.setString(12,city);
                    cstmt.setString(13,postal_code);
                    cstmt.executeUpdate();
                    response.sendRedirect("student_profile.jsp");
                } 
            catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            %> 
            
    </body>
</html>
