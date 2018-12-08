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
        <h1 style="font-size: 16px;color:red;margin-left: 200px;">Список продуктов:</h1><br>
            <ul style="font-size: 16px;color:blue;margin-left: 100px;">
            <c:forEach var="product" items="${listProducts}" >  
                <li>   ${product.name}, ${product.price} euro - ${product.count} tk.	&nbsp;	&nbsp;
                    <a href="deleteProduct?deleteProductId=${product.id}">  Удалить </a><br> <!--${num.index+1} -->    
                </li>
            </c:forEach> 
            </ul>
</body>
</html>
 