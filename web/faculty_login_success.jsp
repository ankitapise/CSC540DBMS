<%-- 
    Document   : faculty_login_success
    Created on : 1 Nov, 2015, 6:03:37 AM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome - NCSU Libraries</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    <div>
        <center>
            <h2> NCSU Libraries </h2>
        </center>
    </div>
        <%
            if ((session.getAttribute("user_id") == null) || (session.getAttribute("user_id") == "")) {
        %>
        You are not logged in<br/>
        <a href="index.html">Please Login</a>
        <%} else {
        %>
        Welcome <%=session.getAttribute("user_id")%>!
    <div>
        <table border="1" cellpadding="5" cellspacing="2">
            <thead>
                <tr>
                    <th><a href="faculty_profile.jsp">Profile</a></th>
                    <th><a href="faculty_resources.html">Resources</a></th>
                    <th><a href="checkedout_resources_faculty.html">Checked-out Resources</a></th>
                    <th><a href="requested_resources_faculty.html">Requested Resources</a></th>
                    <th><a href='logout.jsp'>Log out</a></th>
                </tr>
            </thead>
        </table>
    </div>
    </body>
</html>

<%
    }
%>

