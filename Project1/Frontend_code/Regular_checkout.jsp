<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
            String pub_id = request.getParameter("pub_id");
            String patron_id = request.getParameter("patron_id");
            int result =0;
            System.out.println(pub_id+":"+patron_id);
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibraryDb?" + "user=root&password=root");
            //CallableStatement cstmt = conn.prepareCall("{call publication_checkout(?,?,?)}");
            //cstmt.setString(1,pub_id);
            //cstmt.setString(2,patron_id);
            //cstmt.registerOutParameter(3, java.sql.Types.TINYINT);
             //cstmt.executeQuery();
             //result = cstmt.getInt(3);
             System.out.println(result);
//            ResultSetMetaData rsmd = rs.getMetaData();
  //          int columnCount = rsmd.getColumnCount();
            
        %>
</body> 	
</html>