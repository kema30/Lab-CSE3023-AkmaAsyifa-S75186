<%-- 
    Document   : carList
    Created on : 2 Jun 2026, 4:39:03 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Car Shop Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                <a href="${pageContext.request.contextPath}/" class="navbar-brand">Car Shop App</a>
                <ul class="navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/list" class="nav-link active">Cars Inventory</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="container">
            <h3 class="text-center mb-4 custom-title">List of Cars</h3>
            <hr>
            <div class="text-left mb-3">
                <a href="${pageContext.request.contextPath}/new" class="btn btn-success">Add New Car</a>
            </div>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Car Model</th>
                        <th>Brand</th>
                        <th>Price (RM)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="car" items="${listCar}">
                        <tr>
                            <td><c:out value="${car.id}"/></td>
                            <td><c:out value="${car.model}"/></td>
                            <td><c:out value="${car.brand}"/></td>
                            <td><c:out value="${car.price}"/></td>
                            <td>
                                <a href="edit?id=<c:out value='${car.id}' />" class="btn btn-sm btn-outline-primary">Edit</a>
                                &nbsp;
                                <a href="delete?id=<c:out value='${car.id}' />" class="btn btn-sm btn-outline-danger" onclick="return confirm('Delete this car?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
