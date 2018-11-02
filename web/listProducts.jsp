<%-- 
    Document   : listProduct
    Created on : 16-Oct-2018, 21:28:44
    Author     : agloi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP  Shop</title>
    </head>
    <body>
        <h1 style="font-size: 16px;color:red;"Список продуктов:</h1>
            <c:forEach var="product" items="${listProducts}" varStatus="count">
                <li>${count.index+1}. ${product.name} ${product.price} euro, ${product.count} tk. </li>
                <a href="deleteProduct?deleteProductId=${product.id}">Удалить</a><br>
            </c:forEach>

        </ul>
</body>
</html>
