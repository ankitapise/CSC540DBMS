<%-- 
    Document   : renew_publication_students
    Created on : 2 Nov, 2015, 8:49:19 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Renew Publication - NCSU Libraries</title>
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
            CallableStatement cstmt = conn.prepareCall("{call publication_renewal(?,?,?)}");
            cstmt.setString(1,pub_id);
            cstmt.setString(2,session.getAttribute("patron_id").toString());
            cstmt.registerOutParameter(3,java.sql.Types.TINYINT);
            cstmt.execute();
            
            int checkout_status = cstmt.getInt(3);
            if (checkout_status == 1)
            {
                out.println("Renew successful");
            }
            else if (checkout_status == 0)
            {
                out.println("Book requested by another patron. Cannot renew publication at this time. Try again later.");
            }
            else
            {
                out.println("You haven't reserved this book.");
            }
            %>
            <br>
            <a href="display_checkedout_pub_faculty.jsp?pub_id=<%= pub_id%>">Back</a>
    </body>
</html>
