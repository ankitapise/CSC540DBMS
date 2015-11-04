<%-- 
    Document   : reserve_camera_form_students
    Created on : 3 Nov, 2015, 2:22:42 AM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import =" java.util.* " %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Select Date - NCSU Libraries</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
        minDate:0,
        autoSize: true,         // automatically resize the input field 
        dateFormat: 'yy-mm-dd',  // Date Format used
        firstDay: 1, // Start with Monday
        beforeShowDay: function(date)

        { return [date.getDay() === 5,""];}
    });
    
  });
  </script>
</head>
<body>
<div>
    <center>
        <h2> NCSU LIBRARIES </h2>
    </center>
</div>
<div>
    <% String cam_id = request.getParameter("cam_id"); %>
    <center>
        <h4> Please select a date to reserve the camera:</h4>
        <form method="post" action="reserve_successful_students.jsp?cam_id=<%= cam_id%>">
            <p>Date: <input type="text" name="out_date" id="datepicker"></p>
            <br>
            <input type="submit" value="Make reservation"/>
        </form>
            <br>
            <a href="display_selected_camera_students.jsp?cam_id=<%= cam_id%>">Back</a>
    </center>
</div>
        
 
</body>
</html>
