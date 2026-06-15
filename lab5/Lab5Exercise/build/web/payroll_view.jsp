<%-- 
    Document   : payroll_view
    Created on : 29 Apr 2026, 4:09:28 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Payroll</title>
        
        <style>
        table { 
            width: 80%; 
            border-collapse: collapse; 
            margin-top: 20px; }
        th, td { 
            border: 1px solid black; 
            padding: 10px; 
            text-align: left; }
        th { 
            background-color: #f2f2f2; }
    </style>
    </head>
    <body>
        <h2>Employee Payroll List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Basic Salary (RM)</th>
            <th>Status</th> <%-- Column baru untuk Logic Challenge --%>
        </tr>

        <%-- Iteration: Guna c:forEach untuk pusing dalam employeeList --%>
        <c:forEach var="emp" items="${employeeList}">
            <tr>
                <td>${emp.empId}</td>
                <td>${emp.name}</td>
                <td>${emp.department}</td>
                <td>${emp.basicSalary}</td>
                
                <%-- Logic Challenge: Guna c:choose --%>
                <td>
                    <c:choose>
                        <c:when test="${emp.basicSalary >= 3000}">
                            <strong>Senior</strong>
                        </c:when>
                        <c:otherwise>
                            Junior
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>
