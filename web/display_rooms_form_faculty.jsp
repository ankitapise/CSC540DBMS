<%-- 
    Document   : display_rooms_students
    Created on : 3 Nov, 2015, 9:25:43 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Reserve Room - NCSU Libraries</title>
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
  </script>
    </head>
    <body>
        <div>
            <center>
                <h2> NCSU LIBRARIES </h2>
            </center>
        </div>
        <form method="post" action="display_rooms_faculty.jsp">
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                <th colspan="2"> Reserve Room </th>
                </thead>
                
                <tbody>
                    <tr>
                        <td>No. of occupants: </td>
                        <td><input type="text" name="occupancy" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Type: </td>
                        <td><select name="type">
                                <option value="Study">Study</option>
                                <option value="Conference">Conference</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Date: </td>
                        <td><input type="text" name="reserve_date" size="20" id="datepicker"/></td>
                    </tr>
                    <tr>
                        <td>Start Time(hh:mm:ss): </td>
                        <td><input type="text" name="start_time" size="20"/></td>
                    </tr>
                    <tr>
                        <td>End Time(hh:mm:ss): </td>
                        <td><input type="text" name="end_time" size="20"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><a href="faculty_resources.html"> Back </a></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Check available rooms"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
