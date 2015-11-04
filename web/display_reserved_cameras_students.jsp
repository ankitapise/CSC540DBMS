<%-- 
    Document   : display_reserved_cameras_students
    Created on : 3 Nov, 2015, 6:26:48 AM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Camera Reservations - NCSU Libraries</title>
        </head>
    <body>
        <div>
            <center>
                <h2> NCSU LIBRARIES </h2>
            </center>
        </div>
        <%
            String patron_id = session.getAttribute("patron_id").toString();
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call display_reserved_cameras(?)}");
            cstmt.setString(1,patron_id);
            ResultSet rs = cstmt.executeQuery();    
        %>
        <div>
            <center>
                
                <table border="1" cellpadding="5" cellspacing="2">
                    <thead>
                        <tr>
                            <th colspan="8"> My Reservations </th>
                        </tr>
                        <tr>
                            <th> Camera ID </th>
                            <th> Make </th>
                            <th> Model </th>
                            <th> Memory Available </th>
                            <th> Lens Configuration </th>
                            <th> Reservation Date</th>
                            <th> Library </th>
                        </tr>
                    </thead>
                    <tbody>
                <% 
                    while (rs.next()) {
                %>    
                    <tr>
                        <td><%= rs.getString(1)%></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td>
                        <td><%= rs.getString(6)%></td>
                        <td><%= rs.getString(7)%></td>
                        <td><a href="camera_checkout_form_students.jsp?cam_id=<%= rs.getString(1)%>">Checkout</a></td>
                        
                    </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="3"><a href="camera_options_students.html">Back</a></td>
                </tr> 
            </tbody>
        </table>  
            </center>
        </div>