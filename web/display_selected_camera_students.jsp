<%-- 
    Document   : display_selected_cameras_students
    Created on : 3 Nov, 2015, 12:13:13 AM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Cameras - NCSU Libraries</title>
    </head>
    <body>
        <div>
            <center>
                <h2> NCSU LIBRARIES </h2>
            </center>
        </div>
        <%
            String cam_id = request.getParameter("cam_id");
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call display_selected_camera(?)}");
            cstmt.setString(1,cam_id);
            ResultSet rs = cstmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            
        %>
        <div>
            <center>
                <table border="1" cellpadding="5" cellspacing="2">
                    <thead>
                    <th colspan="3"> Camera Details </th>
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
                    <td colspan="2"><form method="post" action="reserve_camera_form_students.jsp?cam_id=<%= cam_id%>"><input type="submit" value="Reserve"></form></td>
                </tr>
                </tr>
                <tr>
                    <td colspan="3"><a href="display_cameras_students.jsp">Back</a></td>
                </tr> 
            </tbody>
        </table>  
            </center>
        </div>
    </body>
</html>
