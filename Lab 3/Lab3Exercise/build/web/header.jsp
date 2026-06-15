<%-- 
    Document   : header
    Created on : 14 Apr 2026, 3:46:53 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        
         <style>
        body {
            margin: 0;
            padding:0;
            font-family: Arial, sans-serif;
        }

        .header {
            background-color: purple;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
        }

        .nav {
            background-color: purple;
            padding: 10px;
            text-align: center;
        }

        .nav a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-weight: bold;
        }

        .nav a:hover {
            text-decoration: underline;
        }

        .content {
            padding: 20px;
        }
    </style>
    </head>
    <body>
        <div class="header">Student Club Registration System</div>
        
        <div class="nav">
            <a href="registerClub.jsp">Registration Page</a>|
            <a href="feeCalculator.jsp">Fee Calculator</a>|
            <a href="memberDirectory.jsp">Club Member Directory</a>
        </div>
        
        <div class="content">
    </body>
</html>
