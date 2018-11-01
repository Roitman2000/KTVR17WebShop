<%--
    Document   : listCustomer
    Created on : 16-Oct-2018, 21:30:41
    Author     : agloi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page Shop</title>
    </head>
    <body>
        <h1 style="font-size: 16px;color:green;">Список покупателей</h1>
        <ul>
            <c:forEach var="customer" items="${listCustomer}">
                <li>${customer.name} ${customer.surname}</li>
            </c:forEach>
        </ul>
    </body>
</html>
