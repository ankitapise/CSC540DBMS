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
        <title>Requested Plublications - NCSU Libraries</title>
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
            CallableStatement cstmt = conn.prepareCall("{call publication_requests(?)}");
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
                            <th> Publication ID </th>
                            <th> Title </th>
                            <th> Type </th>
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
                        
                    </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="3"><a href="requested_resources_students.html">Back</a></td>
                </tr> 
            </tbody>
        </table>  
            </center>
        </div>
    </body>
</html>