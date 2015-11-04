<%-- 
    Document   : logout
    Created on : 31 Oct, 2015, 6:09:49 PM
    Author     : Ankita Arun Pise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.setAttribute("user_id", null);
session.invalidate();
response.sendRedirect("index.html");
%>
