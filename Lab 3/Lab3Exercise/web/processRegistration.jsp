<%-- 
    Document   : processRegistration
    Created on : 14 Apr 2026, 3:49:10 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Page</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        
        <h2>Registration Details</h2>
        
        <fieldset>
        <%
            String name = request.getParameter("studentName");
            String matric = request.getParameter("matricNo");
            String club = request.getParameter("club");
            
            ArrayList<String[]> members = (ArrayList<String[]>)session.getAttribute("members");
            
            if (members == null) {
                members = new ArrayList<String[]>();
            }
            
            if (name != null && matric != null) {
                members.add(new String[]{name, matric, club});
            }
            
            session.setAttribute("members", members);
        %>
        
        <!-- display output -->
        <p>Thank you for registering as a <%= club %> member!</p>
        <p>This is your details:</p>
        <p><strong>Name:</strong> <%= name %></p>
        <p><strong>Matric Number:</strong> <%= matric %></p>
        <p><strong>Selected Club:</strong> <%= club %></p>
        
        </fieldset>
        <%@ include file="footer.jsp" %>
    </body>
</html>
