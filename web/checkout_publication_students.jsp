<%-- 
    Document   : e_copy_checkout
    Created on : 2 Nov, 2015, 6:19:43 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Camera - NCSU Libraries</title>
    </head>
    <body>
        <div>
            <center>
                <h2> NCSU LIBRARIES </h2>
            </center>
        </div>
        <%
            String pub_id = request.getParameter("pub_id");
            String checkout_date = request.getParameter("out_date");
            String checkout_time = request.getParameter("out_time");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date j_out_date = sdf.parse(checkout_date);
            java.sql.Date out_date = new java.sql.Date(j_out_date.getTime());
            SimpleDateFormat sdft = new SimpleDateFormat("HH:mm:ss");
            java.util.Date j_out_time = sdft.parse(checkout_time);
            java.sql.Date out_time = new java.sql.Date(j_out_time.getTime());
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call publication_checkout(?,?,?)}");
            cstmt.setString(1,pub_id);
            cstmt.setString(2,session.getAttribute("patron_id").toString());
            cstmt.registerOutParameter(3,java.sql.Types.TINYINT);
            cstmt.execute();
            
            int checkout_status = cstmt.getInt(3);
            if (checkout_status == 0)
            {
                out.println("Publication is not available at present. You have been added to the waitlist.");
            }
            else if (checkout_status == 1)
            {
                out.println("Publication checkout successful.");
            }
            else if(checkout_status == 2)
            {
                out.println("You have already checked-out this publication.");
            }
            else
            {
                out.println("You are trying to checkout a reserved publication for a course you are not enrolled in.");
            }
            %>
            <br>
            <a href="display_selected_pub_students.jsp?pub_id=<%= pub_id%>">Back</a>
    </body>
</html>