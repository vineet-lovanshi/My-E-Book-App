<%-- 
    Document   : home
    Created on : 9 Aug, 2024, 11:39:49 PM
    Author     : jyoti
--%>

<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>User Home</h1>
        <%
            // Retrieve the User object from the session
            User user = (User) session.getAttribute("useObj");
            if (user != null) {
        %>
            <h1>Name: <%= user.getName() %></h1>
            <h1>Email: <%= user.getEmail() %></h1>
            <h1>Password: <%= user.getPassword() %><h1>
        <%
            } else {
        %>
            <h1>No user is logged in.</h1>
        <%
            }
        %>
    </body>
</html>
