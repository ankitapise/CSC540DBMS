<%-- 
    Document   : student_profile
    Created on : 31 Oct, 2015, 6:19:59 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
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
            CallableStatement cstmt = conn.prepareCall("{call display_student_profile(?)}");
            cstmt.setString(1,session.getAttribute("user_id").toString());
            ResultSet rs = cstmt.executeQuery();
            if (rs.next()) {
                
        %>
        <div>
            <center>
            <form method ="get" action="update_student.jsp">
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                <th colspan="2"> Profile </th>
                </thead>
                
                <tbody>
                    <tr>
                        <td>Username: </td>
                        <td><%= rs.getString(1)%></td>
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
                        <td>Phone no.: </td>
                        <td><input type="text" name="phone_no" size="20" value="<%= rs.getString(6)%>"/></td>
                    </tr>
                    <tr>
                        <td>Alternate Phone: </td>
                        <td><input type="text" name="alternate_phone" size="20" value="<%= rs.getString(7)%>"/></td>
                    </tr>
                    <tr>
                        <td>Date of Birth: </td>
                        <td><input type="text" name="DOB" size="20" value="<%= rs.getString(8)%>"/></td>
                    </tr>
                    <tr>
                        <td>Department: </td>
                        <td><%= rs.getString(9)%></td>
                    </tr>
                    <tr>
                        <td>Category: </td>
                        <td><%= rs.getString(10)%></td>
                    </tr>
                    <tr>
                        <td>Sex: </td>
                        <td><input type="text" name="sex" size="20" value="<%= rs.getString(11)%>"/></td>
                    </tr>
                    <tr>
                        <td>Degree: </td>
                        <td><%= rs.getString(12)%></td>
                    </tr>
                    <tr>
                        <td>Address Line 1: </td>
                        <td><input type="text" name="address_line1" size="20" value="<%= rs.getString(13)%>"/></td>
                    </tr>
                    <tr>
                        <td>Address Line 2: </td>
                        <td><input type="text" name="address_line2" size="20" value="<%= rs.getString(14)%>"/></td>
                    </tr>
                    <tr>
                        <td>City: </td>
                        <td><input type="text" name="city" size="20" value="<%= rs.getString(15)%>"/></td>
                    </tr>
                    <tr>
                        <td>Postal Code: </td>
                        <td><input type="text" name="postal_code" size="20" value="<%= rs.getString(16)%>"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><a href="student_login_success.jsp"> Back </a></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Update"/></td>
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
