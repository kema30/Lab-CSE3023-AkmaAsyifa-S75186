<%-- 
    Document   : registerSubject
    Created on : 19 May 2026, 4:50:21 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Subject</title>
    </head>
    <body>
        <h2>Register New Subject</h2>
        <form action="../SubjectServlet?action=add" method="POST">
            <label>Subject Code:</label><br>
            <input type="text" name="subjectCode" required><br><br>
        
            <label>Subject Name:</label><br>
            <input type="text" name="subjectName" required><br><br>
        
            <input type="submit" value="Register Subject">
            <a href="../SubjectServlet?action=view">Cancel</a>
        </form>
    </body>
</html>
