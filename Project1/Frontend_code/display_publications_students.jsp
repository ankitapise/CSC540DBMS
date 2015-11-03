<%-- 
    Document   : display_publications
    Created on : 1 Nov, 2015, 7:30:16 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publications - NCSU Libraries</title>
    </head>
    <body>
        <div>
            <center>
                <h2> NCSU LIBRARIES </h2>
            </center>
        </div>
        <%
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=root");
            CallableStatement cstmt = conn.prepareCall("{call display_publications()}");
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
                        <td><a href="display_selected_pub_students.jsp?pub_id=<%= rs.getString(1)%>"><%= rs.getString(1)%></a></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        
                    </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="3"><a href="student_resources.html">Back</a></td>
                </tr> 
            </tbody>
        </table>  
            </center>
        </div>
    </body>
</html>
