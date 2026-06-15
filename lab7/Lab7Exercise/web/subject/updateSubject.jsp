<%-- 
    Document   : updateSubject
    Created on : 19 May 2026, 4:53:59 pm
    Author     : akmaa
--%>
<%@ page import="com.lab.bean.SubjectBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Subject Details</title>
    </head>
    <body>
        
        <%
        // Get the specific subject attributes sent from Servlet 'editForm' action
        SubjectBean subject = (SubjectBean) request.getAttribute("subject");
        if (subject != null) {
        %>
        
        <form action="${pageContext.request.contextPath}/SubjectServlet?action=update" method="POST">
            <input type="hidden" name="id" value="<%= subject.getId() %>">
        
            <label>Subject Code:</label><br>
            <input type="text" name="subjectCode" value="<%= subject.getSubjectCode() %>" required><br><br>
        
            <label>Subject Name:</label><br>
            <input type="text" name="subjectName" value="<%= subject.getSubjectName() %>" required><br><br>
        
            <input type="submit" value="Update Details">
            <a href="${pageContext.request.contextPath}/SubjectServlet?action=view">Cancel</a>
        </form>
            
        <% } else { %>
            <p style="color:red;">Error: Subject data not found.</p>
            <a href="${pageContext.request.contextPath}/SubjectServlet?action=view">Back to List</a>
        <% } %>
    </body>
</html>
