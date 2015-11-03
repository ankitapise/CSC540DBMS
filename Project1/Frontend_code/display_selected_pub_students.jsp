<%-- 
    Document   : display_selected_pub
    Created on : 1 Nov, 2015, 8:52:19 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
        <title>Request Publication - NCSU Libraries</title>
    <script>
    
    function fetchfile(pub_id,patron_id)
	{
		$.ajax
		({
		type: "POST",
		url: "Regular_Checkout",
		data:{ pub_id: pub_id, patron_id: patron_id },
			
		success: function(msg)
		{
		}
		});
	}
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
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=root");
            CallableStatement cstmt = conn.prepareCall("{call display_selected_publication(?)}");
            cstmt.setString(1,pub_id);
            ResultSet rs = cstmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            
        %>
        <div>
            <center>
                <span class="status"></span>
                <table border="1" cellpadding="5" cellspacing="2">
                    <thead>
                    <th colspan="3"> Publications Details </th>
                    </thead>
                    <tbody>
                <% 
                    while (rs.next()) {
                        for(int i = 1; i < columnCount + 1; i++)
                        {
                %>    
                    <tr>
                        <td><%= rsmd.getColumnName(i)%> </td><td colspan="2"><%= rs.getString(i)%></td>
                    </tr>
                <%
                    }
                    }
                %>
                <tr>
                  <td><input type="button" value="Checkout Publication" id="click" name="click" onclick="fetchfile('<%=request.getParameter("pub_id")%>','<%=session.getAttribute("patron_id")%>')"></form></td>
                    <td><form method="post" action="e_copy_checkout.jsp"><input type="submit" value="Checkout E-copy"></form></td>
                </tr>
                <tr>
                    <td colspan="3"><a href="display_publications_students.jsp">Back</a></td>
                </tr> 
            </tbody>
        </table>  
            </center>
        </div>
    </body>
</html>
