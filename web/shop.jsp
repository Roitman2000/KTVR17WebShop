
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
    </head>
    <body>
        <h1>Shop</h1>
        <form  action="takeProduct" method="POST" name="form1">
            <h2 style="font-size: 16px;color:blue;">Список товаров</h2>
            <select name="selected">
                <c:forEach var="product" items="${listProducts}">
                    <option value="${product.id}">${product.name} ${product.price} ${product.count}</option>
                </c:forEach>
            </select>
                <h2 style="font-size: 16px;color:green;">Список покупателей</h2>
            <select name="selectedReader">
                <c:forEach var="reader" items="${listCustomer}">
                    <option value="${customer.id}">${customer.name} ${customer.surname}${customer.money}</option>
                </c:forEach>
            </select>
                <button type="submit" name="takeProduct">Выдать продукт</button>
        </form>
    </body>
</html>