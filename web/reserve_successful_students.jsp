<%-- 
    Document   : reserve_successful_students
    Created on : 3 Nov, 2015, 3:24:30 AM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation made - NCSU Libraries</title>
    </head>
    <body>
        <div>
    <center>
        <h2> NCSU LIBRARIES </h2>
    </center>
</div>
        <%
        try
            {
            String cam_id = request.getParameter("cam_id");
            String patron_id = session.getAttribute("patron_id").toString();
            String checkout_date = request.getParameter("out_date");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date j_out_date = sdf.parse(checkout_date);
            java.sql.Date out_date = new java.sql.Date(j_out_date.getTime());
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call camera_reserve(?,?,?,?)}");
            cstmt.registerOutParameter(4, java.sql.Types.SMALLINT);
            cstmt.setString(1,cam_id);
            cstmt.setString(2,patron_id);
            cstmt.setDate(3,out_date);
            cstmt.execute();
            int queue_position = cstmt.getInt(4);
            out.println("Your reservation has been successful. Your waitlist position is " + queue_position +".");
            }
        catch (Exception e)
                {
                    out.println("You already have a reservation for this date. Please choose another date.");
                }
            
        %>
        <div>
            <a href="display_cameras_students.jsp">Reserve another camera</a>
            <br>
            <a href="camera_options_students.html">Back to Camera Options</a>
        </div>
    </body>
</html>
