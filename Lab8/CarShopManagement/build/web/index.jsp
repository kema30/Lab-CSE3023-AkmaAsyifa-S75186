<%-- 
    Document   : index
    Created on : 2 Jun 2026, 4:37:14 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Shop Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body class="container mt-5">
        <div class="jumbotron text-center">
            <h1>Application MVC System for Car Shop</h1>
            <br>
            <a href="${pageContext.request.contextPath}/list" class="btn btn-primary m-2">View All Cars</a>
            <a href="${pageContext.request.contextPath}/new" class="btn btn-success m-2">Add New Car</a>
        </div>
    </body>
</html>
