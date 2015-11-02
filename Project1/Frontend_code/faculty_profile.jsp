<%-- 
    Document   : faculty_profile
    Created on : 1 Nov, 2015, 6:07:28 AM
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
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call display_faculty_profile(?)}");
            cstmt.setString(1,session.getAttribute("user_id").toString());
            ResultSet rs = cstmt.executeQuery();
            if (rs.next()) {
                
        %>
        <div>
            <center>
            <form method ="post" action="update_student.jsp">
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                <th colspan="2"> Profile </th>
                </thead>
                
                <tbody>
                    <tr>
                        <td>Username: </td>
                        <td><input type="text" name="user_id" size="20" value="<%= rs.getString(1)%>"/></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="text" name="password" size="20" value="<%= rs.getString(2)%>"/></td>
                    </tr>
                    <tr>
                        <td>First Name: </td>
                        <td><input type="text" name="first_name" size="20" value="<%= rs.getString(3)%>"/></td>
                    </tr>
                    <tr>
                        <td>Last Name: </td>
                        <td><input type="text" name="last_name" size="20" value="<%= rs.getString(4)%>"/></td>
                    </tr>
                    <tr>
                        <td>Nationality: </td>
                        <td><input type="text" name="nationality" size="20" value="<%= rs.getString(5)%>"/></td>
                    </tr>
                    <tr>
                        <td>Department: </td>
                        <td><%= rs.getString(6)%></td>
                    </tr>
                    <tr>
                        <td>Category: </td>
                        <td><%= rs.getString(7)%></td>
                    </tr>
                    <tr>
                        <td colspan="2"><a href="student_login_success.jsp"> Back </a></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit"/></td>
                    </tr>
                </tbody>
            </table>
            </form>
            </center>
        </div>
        <%
             }
        %>
    </body>
</html>
