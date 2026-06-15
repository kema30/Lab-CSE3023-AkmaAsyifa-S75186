<%-- 
    Document   : feeCalculator
    Created on : 14 Apr 2026, 3:49:44 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fee Calculator Page</title>
    </head>
    <body>
         <%@ include file="header.jsp" %>
         
        <h2>Membership Fee Calculator</h2>
        
        <form method="post">
            Number of activities:
            <input type="number" name="activities" required>
            <input type="submit" value="Calculate">
        </form>
        
        <%
            String actStr = request.getParameter("activities");

            if (actStr != null) {
                int activities = Integer.parseInt(actStr);
                double total = activities * 10.0;
       %>
       
       <h3>Total Fee: RM <%= String.format("%.2f", total) %></h3>
       
       <%
            }
       %>
        
        <%@ include file="footer.jsp" %>
    </body>
</html>
