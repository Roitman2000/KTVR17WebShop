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
           <h1 style="font-size: 16px;color:blue;">Список купленных товаров</h1>
        ${info}
     
         <form action="returnProduct" method="POST">
            <ul>
                <c:forEach var="purchase" items="${buyProducts}">
                    <li> Товар <b>"${purchase.product.name}"</b>по цене ${purchase.product.price} euro   - купил <b>
                                   ${purchase.customer.name} ${purchase.customer.surname} ; </b>в количестве - ${purchase.quantity} tk. &nbsp;&nbsp; 
                         <a href="returnProduct?purchaseId=${purchase.id}">     Посмотреть товар на складе</a></li>
                       
                </c:forEach> 
            </ul>
        </form>
        <a href="welcome">На главную </a>
    </body>
</html>
