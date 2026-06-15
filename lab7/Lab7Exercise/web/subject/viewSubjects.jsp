<%-- 
    Document   : viewSubject
    Created on : 19 May 2026, 4:45:49 pm
    Author     : akmaa
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.lab.bean.SubjectBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Registered Subjects</title>
    </head>
    <body>
        <h2>Subject Management Dashboard</h2>
        <p>Welcome, <b><%= session.getAttribute("matricNo") %></b>! | <a href="logout.jsp">Logout</a></p>
    
        <a href="${pageContext.request.contextPath}/subject/registerSubject.jsp">Register New Subject</a>
        <br><br>
    
        <table border="1" cellpadding="5">
            <tr>
                <th>Subject Code</th>
                <th>Subject Name</th>
                <th>Actions</th>
            </tr>
            
            <%
                // Retrieve list from request attribute injected by Servlet
                List<SubjectBean> listSubjects = (List<SubjectBean>) request.getAttribute("listSubjects");
                if (listSubjects != null && !listSubjects.isEmpty()) {
                    for (SubjectBean subject : listSubjects) {
            %>
            
            <tr>
                <td><%= subject.getSubjectCode() %></td>
                <td><%= subject.getSubjectName() %></td>
                <td>
                    <a href="${pageContext.request.contextPath}/SubjectServlet?action=editForm&id=<%= subject.getId() %>">Edit</a> | 
                    <a href="${pageContext.request.contextPath}/SubjectServlet?action=delete&id=<%= subject.getId() %>" onclick="return confirm('Delete this subject?')">Delete</a>
                </td>
            </tr>
            
            <% 
                    }
                } else {
            %>
            
            <tr>
                <td colspan="3">No subjects registered yet.</td>
            </tr>
            
            <% } %>
        </table>
    </body>
</html>
