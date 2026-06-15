<%-- 
    Document   : carForm
    Created on : 2 Jun 2026, 4:39:45 pm
    Author     : akmaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Car Shop Management</title>
        <link class="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body class="bg-light">
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                <a href="${pageContext.request.contextPath}/" class="navbar-brand">Car Shop App</a>
            </nav>
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <form action="<c:choose><c:when test='${car != null}'>update</c:when><c:otherwise>insert</c:otherwise></c:choose>" method="post">
                        
                        <h2 class="text-left mb-4 custom-title" style="font-size: 24px;">
                            <c:if test="${car != null}">Edit Car Info</c:if>
                            <c:if test="${car == null}">Add New Car</c:if>
                        </h2>

                        <c:if test="${car != null}">
                            <input type="hidden" name="id" value="<c:out value='${car.id}' />" />
                        </c:if>

                        <div class="form-group">
                            <label>Car Model</label>
                            <input type="text" value="<c:out value='${car.model}' />" class="form-control" name="model" required="required">
                        </div>

                        <div class="form-group">
                            <label>Brand / Manufacturer</label>
                            <input type="text" value="<c:out value='${car.brand}' />" class="form-control" name="brand" required="required">
                        </div>

                        <div class="form-group">
                            <label>Price (RM)</label>
                            <input type="number" step="0.01" value="<c:out value='${car.price}' />" class="form-control" name="price" required="required">
                        </div>

                        <button type="submit" class="btn btn-success px-4">Save</button>
                        <a href="list" class="btn btn-light px-4">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>