<%-- 
    Document   : main
    Created on : 12 May 2026, 4:28:41 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome to Main Page</h1>
        
        <%
           // Ambil data dari session
            String user = (String)session.getAttribute("user");
            String fname = (String)session.getAttribute("fname");
            String lname = (String)session.getAttribute("lname");

            if(user == null) {
                response.sendRedirect("login.jsp"); // Paksa login jika cuba masuk tanpa login
            }
        %>
        
        <p>Username: <b><%= user %></b></p>
        <p>First Name: <b><%= fname %></b></p>
        <p>Last Name: <b><%= lname %></b></p>
        <br>
        
        <a href="login.jsp">Logout</a>
    </body>
</html>
