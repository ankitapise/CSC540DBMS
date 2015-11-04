<%-- 
    Document   : display_rooms_students
    Created on : 3 Nov, 2015, 9:57:34 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserve Room - NCSU Libraries</title>
    </head>
    <body>
        <div>
            <center>
                <h2> NCSU LIBRARIES </h2>
            </center>
        </div>
        <%
            String patron_id = session.getAttribute("patron_id").toString();
            String start_time = request.getParameter("startTime");
            String end_time = request.getParameter("endTime");
            String lib_id = request.getParameter("lib_id");
            String room_no = request.getParameter("room_no");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            java.util.Date starttime  = sdf.parse(start_time);
            java.sql.Date startTime = new java.sql.Date(starttime.getTime());
            java.util.Date endtime = sdf.parse(end_time);
            java.sql.Date endTime = new java.sql.Date(endtime.getTime());
            sdf.applyPattern("yyyy-MM-dd hh:mm:ss");
            
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call display_rooms(?,?,?,?,?)}");
            cstmt.setString(1,patron_id);
            cstmt.setString(2,lib_id);
            cstmt.setString(3,room_no);
            cstmt.setDate(4,startTime);
            cstmt.setDate(5,endTime);
            cstmt.execute();
                out.println("Reservation Successful");
           
               %>
               <a href="display_rooms_students.jsp">Back</a>
    </body>
</html>
