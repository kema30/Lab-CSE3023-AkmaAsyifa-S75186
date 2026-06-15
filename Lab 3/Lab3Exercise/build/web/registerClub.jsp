<%-- 
    Document   : registerClub
    Created on : 14 Apr 2026, 3:48:35 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        
        <h2>Club Registration</h2>
        
        <form action="processRegistration.jsp" method="post">
            
            Student Name: <input type="text" name="studentName" required><br><br>
            Matric Number: <input type="text" name="matricNo" required><br><br>
            
            Select Club:
            <select name="club">
                <option value="Programming Club">Programming Club</option>
                <option value="Robotics Club">Robotics Club</option>
                <option value="Multimedia Club">Multimedia Club</option>
                <option value="Sports Club">Sports Club</option>
            </select><br><br>

        <input type="submit" value="Register">
        </form>
        
        <%@ include file="footer.jsp" %>
    </body>
</html>
