<%-- 
    Document   : camera_checkout_form_students
    Created on : 3 Nov, 2015, 10:31:58 AM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Checkout Camera - NCSU Libraries</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
        minDate:0,
        autoSize: true,         // automatically resize the input field 
        dateFormat: 'yy-mm-dd',  // Date Format used
        firstDay: 1 // Start with Monday
    });
    
  });
  $(function() {
    $( "#datepicker2" ).datepicker({
        minDate:0,
        autoSize: true,         // automatically resize the input field 
        dateFormat: 'yy-mm-dd',  // Date Format used
        firstDay: 1 // Start with Monday
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
        <%
            String pub_id = request.getParameter("pub_id");
        %>
        <div>
            <center>
                <form method="post" action="checkout_publication_students.jsp?pub_id=<%= pub_id%>">
                    <p>Select Checkout Date: <input type="text" name="out_date" id="datepicker"></p>
                    <br>
                    <p>Enter Checkout Time(hh:mm:ss): <input type="text" name="out_time"/></p>
                    <br><br>
                    <p>Select Return Date: <input type="text" name="return_date" id="datepicker2"/></p>
                    <br>
                    <p>Enter Return Time(hh:mm:ss): <input type="text" name="return_time"/></p>
                    <input type="submit" value="Checkout"/>
                </form>
                    <br>
            <a href="display_selected_pub_students.jsp?pub_id=<%= pub_id%>">Back</a>
            </center>
        </div>
    </body>
</html>