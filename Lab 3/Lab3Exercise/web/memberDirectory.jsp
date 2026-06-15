<%-- 
    Document   : memberDirectory
    Created on : 14 Apr 2026, 3:50:05 pm
    Author     : akmaa
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Directory Page</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        
        <h2>Club Member Directory</h2>
        
        <table border="1" cellpadding="8" cellspacing="0">
            <tr>
                <th>No.</th>
                <th>Name</th>
                <th>Matric Number</th>
                <th>Club</th>
            </tr>
            
            <%
                ArrayList<String[]> members = (ArrayList<String[]>)session.getAttribute("members");
                
                if (members != null && !members.isEmpty()) {
                    int count = 1;
                    for (String[] member:members){
            %>
            
            <tr>
                <td><%= count++ %></td>
                <td><%= member[0] %></td>
                <td><%= member[1] %></td>
                <td><%= member[2] %></td>
            </tr>
            <%
              }
            }else {
            %>
            
            <tr>
                <td colspan="4">No members registered yet.</td>
            </tr>
            
            <%
               }
            %>
        </table>
        
        <%@ include file="footer.jsp" %>
    </body>
</html>
