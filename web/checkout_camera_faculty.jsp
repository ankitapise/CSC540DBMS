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
            String cam_id = request.getParameter("cam_id");
            String checkout_date = request.getParameter("out_date");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date j_out_date = sdf.parse(checkout_date);
            java.sql.Date out_date = new java.sql.Date(j_out_date.getTime());

            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call camera_checkout(?,?,?,?)}");
            cstmt.setString(1,cam_id);
            cstmt.setString(2,session.getAttribute("patron_id").toString());
            cstmt.setDate(3, out_date);
            cstmt.registerOutParameter(4,java.sql.Types.TINYINT);
            cstmt.execute();
            
            int checkout_status = cstmt.getInt(4);
            if (checkout_status == 1)
            {
                out.println("Camera checkout successful!");
            }
            else if (checkout_status == 2)
            {
                out.println("Your request is still waitlisted. Please wait for the camera to be available.");
            }
            else {
                out.println("This camera has already been checked-out by another patron. Please make a reservation again for another time.");
            }
            %>
            <br>
            <a href="display_reserved_cameras_faculty.jsp">Back</a>
    </body>
</html>