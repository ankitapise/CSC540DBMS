<%-- 
    Document   : display_checkedout_publication_students
    Created on : 3 Nov, 2015, 11:17:00 AM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View/Renew Checked-out Plublication - NCSU Libraries</title>
        </head>
    <body>
        <div>
            <center>
                <h2> NCSU LIBRARIES </h2>
            </center>
        </div>
        <%
            String patron_id = session.getAttribute("patron_id").toString();
            String pub_id = request.getParameter("pub_id");
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call display_selected_checked_out_publication(?,?)}");
            cstmt.setString(1,pub_id);
            cstmt.setString(2,patron_id);
            ResultSet rs = cstmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
        %>
        <div>
            <center>
                <span class="status"></span>
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
                    <td><form method="post" action="checkedout_pub_renew_students.jsp?pub_id=<%= pub_id%>"><input type="submit" value="Renew Publication"></form></td>
                </tr>
                <tr>
                    <td><a href="checkedout_publications_students.jsp">Back</a></td>
                </tr>
                </body>
                </table>
            </center>
        </div>
    </body>
</html>