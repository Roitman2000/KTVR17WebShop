<%-- 
    Document   : listBuyProducts
    Created on : 16-Oct-2018, 21:33:26
    Author     : agloi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Купленный товар</title>
    </head>
    <body>
           <h1 style="font-size: 16px;color:blue;"Список купленных товаров</h1>
        ${info}
        <form action="deleteProduct" method="POST">
            <ul>
                <c:forEach var="purchase" items="${buyProducts}">
                    <li>Товар: ${purchase.product.name} куплен: ${purchase.customer.name} ${purchase.customer.surname}
    
                </c:forEach> 
            </ul>
        </form>
    </body>
</html>
