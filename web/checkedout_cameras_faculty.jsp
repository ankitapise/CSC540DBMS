<%-- 
    Document   : checkedout_publications_students
    Created on : 3 Nov, 2015, 7:17:13 AM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checked-out Cameras - NCSU Libraries</title>
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
            CallableStatement cstmt = conn.prepareCall("{call display_checked_out_cameras(?)}");
            cstmt.setString(1,patron_id);
            ResultSet rs = cstmt.executeQuery();    
        %>
        <div>
            <center>
                
                <table border="1" cellpadding="5" cellspacing="2">
                    <thead>
                        <tr>
                            <th colspan="3"> Publications </th>
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
                        <td><a href="display_checkedout_camera_faculty.jsp?cam_id=<%= rs.getString(1)%>"><%= rs.getString(1)%></a></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        
                    </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="3"><a href="checkedout_resources_faculty.html">Back</a></td>
                </tr> 
            </tbody>
        </table>  
            </center>
        </div>
    </body>
</html>
