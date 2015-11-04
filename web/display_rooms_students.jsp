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
            String start_date = request.getParameter("reserve_date");
            String end_date = request.getParameter("reserve_date");
            String start_time = request.getParameter("start_time");
            String end_time = request.getParameter("end_time");
            String occupancy = request.getParameter("occupancy");
            String type = request.getParameter("type");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            java.util.Date starttime  = sdf.parse(start_date + " "+ start_time);
            java.sql.Date startTime = new java.sql.Date(starttime.getTime());
            java.util.Date endtime = sdf.parse(end_date+" "+end_time);
            java.sql.Date endTime = new java.sql.Date(endtime.getTime());
            sdf.applyPattern("yyyy-MM-dd hh:mm:ss");
            
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?" + "user=root&password=localhost_123");
            CallableStatement cstmt = conn.prepareCall("{call display_rooms(?,?,?,?,?,?)}");
            cstmt.setString(1,patron_id);
            cstmt.setString(2,occupancy);
            cstmt.setString(3,type);
            cstmt.setDate(4,startTime);
            cstmt.setDate(5,endTime);
            cstmt.registerOutParameter(6, java.sql.Types.TINYINT);
            ResultSet rs = cstmt.executeQuery();
            int display_status = cstmt.getInt(6);
            if (display_status == 0)
            {
                out.println("You are not authorized to select conference rooms. Please select a different room.");
            }
            else
            {
            %>    
               <div>
            
                <table border="1" cellpadding="5" cellspacing="2">
                    <thead>
                        <tr>
                            <th colspan="4"> Available Rooms </th>
                        </tr>
                        <tr>
                            <th> Library ID </th>
                            <th> Room no. </th>
                            <th> Floor </th>
                            <th>Reserve Room</th>
                        </tr>
                    </thead>
                    <tbody>
                <% 
                    while (rs.next()) {
                %>    
                    <tr>
                        <td><%= rs.getString(1)%></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><a href="reserve_room_students.jsp?lib_id=<%= rs.getString(1)%>&room_no=<%= rs.getString(2)%>&startTime=<%= startTime%>&endTime=<%= endTime%>">Reserve</a></td>
                        
                    </tr>
                <%
                    }
            }
                %>
                <tr>
                    <td colspan="4"><a href="display_rooms_form_students.jsp">Back</a></td>
                </tr> 
            </tbody>
        </table>  
           
        </div>
    </body>
</html>
