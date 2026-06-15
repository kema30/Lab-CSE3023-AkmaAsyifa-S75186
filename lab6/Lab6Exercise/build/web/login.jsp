<%-- 
    Document   : login
    Created on : 12 May 2026, 4:23:44 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>lab 6 - exercise</title>
    </head>
    <body>
        <h2>User Login</h2>
        
        <%-- show message if fail --%>
        <% String msg = request.getParameter("msg"); 
            if(msg != null) out.print("<p style='color:red'>" + msg + "</p>"); %>
       
        <form action="doLogin.jsp" method="POST">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            <button type="submit">Login</button>
        </form>
    </body>
</html>
