<%-- 
    Document   : logout
    Created on : 24 May 2026, 12:20:52 pm
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
        <%
            // Invalidate the session to clear memory and security contexts
            session = request.getSession(false);
            if (session != null) {
                 session.invalidate();
            }
            // Redirect cleanly back to the front entrance login form
            response.sendRedirect("login.html");
        %>
    </body>
</html>
