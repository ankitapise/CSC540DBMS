<%-- 
    Document   : display_selected_pub
    Created on : 1 Nov, 2015, 8:52:19 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Publication - NCSU Libraries</title>
    </head>
    <body>
        <div>
            <center>
                <h2> NCSU LIBRARIES </h2>
            </center>
        </div>
        <%
            String pub_id = request.getParameter("pub_id");
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call display_selected_publication(?)}");
            cstmt.setString(1,pub_id);
            ResultSet rs = cstmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            
        %>
        <div>
            <center>
                <table border="1" cellpadding="5" cellspacing="2">
                    <thead>
                    <th colspan="3"> Publication Details </th>
                    </thead>
                    <tbody>
                <% 
                    while (rs.next()) {
                        for(int i = 1; i < columnCount + 1; i++)
                        {
                %>    
                    <tr>
                        <td><%= rsmd.getColumnName(i)%> </td><td colspan="2"><%= rs.getString(i)%></td>
                    </tr>
                <%
                    }
                    }
                %>
                <tr>
                  <td><form method="post" action="publication_checkout_form_students.jsp?pub_id=<%= pub_id%>"><input type="submit" value="Checkout Publication"></form></td>
                  <td><form method="post" action="renew_publication_students.jsp?pub_id=<%= pub_id%>"><input type="submit" value="Renew"></form></td>
                    <td><form method="post" action="e_copy_checkout_students.jsp?pub_id=<%= pub_id%>"><input type="submit" value="Checkout E-copy"></form></td>
                </tr>
                <tr>
                    <td colspan="3"><a href="display_publications_students.jsp">Back</a></td>
                </tr> 
            </tbody>
        </table>  
            </center>
        </div>
    </body>
</html>
