<%-- 
    Document   : e_copy_checkout
    Created on : 2 Nov, 2015, 6:19:43 PM
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
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call checkout_e_copy(?,?,?)}");
            cstmt.setString(1,pub_id);
            cstmt.setString(2,session.getAttribute("patron_id").toString());
            cstmt.registerOutParameter(3,java.sql.Types.TINYINT);
            cstmt.execute();
            
            int checkout_status = cstmt.getInt(3);
            if (checkout_status == 1)
            {
                out.println("E-copy checkout successful");
            }
            else if (checkout_status == 2)
            {
                out.println("E-copy already checked-out");
            }
            else {
                out.println("E-copy is not available");
            }
            %>
            <br>
            <a href="display_selected_pub_students.jsp?pub_id=<%= pub_id%>">Back</a>
    </body>
</html>