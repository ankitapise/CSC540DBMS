<%-- 
    Document   : display_cameras_students
    Created on : 3 Nov, 2015, 12:07:13 AM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cameras - NCSU Libraries</title>
    </head>
    <body>
        <div>
            <center>
                <h2> NCSU LIBRARIES </h2>
            </center>
        </div>
        <%
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call display_cameras()}");
            ResultSet rs = cstmt.executeQuery();       
        %>
        <div>
            <center>
                
                <table border="1" cellpadding="5" cellspacing="2">
                    <thead>
                        <tr>
                            <th colspan="3"> Cameras </th>
                        </tr>
                        <tr>
                            <th> Camera ID </th>
                            <th> Make </th>
                            <th> Model </th>
                        </tr>
                    </thead>
                    <tbody>
                <% 
                    while (rs.next()) {
                %>    
                    <tr>
                        <td><a href="display_selected_camera_faculty.jsp?cam_id=<%= rs.getString(1)%>"><%= rs.getString(1)%></a></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        
                    </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="3"><a href="camera_options_faculty.html">Back</a></td>
                </tr> 
            </tbody>
        </table>  
            </center>
        </div>
    </body>
</html>
