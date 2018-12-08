
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
                        <style>
            input {
 display: inline-block;margin-left: 100px;
  width: 15em;
  font-size: 80%;
  color: rgba(255,255,255,.9);
  text-shadow: #2e7ebd 0 1px 2px;
  text-decoration: none;
  text-align: center;
  line-height: 1.1;
  white-space: pre-line;
  padding: .7em 0;
  border: 1px solid;
  border-color: #60a3d8 #2970a9 #2970a9 #60a3d8;
  border-radius: 6px;
  outline: none;
  background: #60a3d8 linear-gradient(#89bbe2, #60a3d8 50%, #378bce);
  box-shadow: inset rgba(255,255,255,.5) 1px 1px;
}
select {margin-left: 100px;width: 180px;color:black;border-color: #60a3d8 #2970a9 #2970a9 #60a3d8;
 background: #60a3d8 linear-gradient(#89bbe2, #60a3d8 50%, #378bce);
  box-shadow: inset rgba(255,255,255,.5) 1px 1px;   
}
button {        
 width: 150px;
  background: #60a3d8 linear-gradient(#89bbe2, #60a3d8 50%, #378bce);
  box-shadow: inset rgba(255,255,255,.5) 1px 1px;
}
select {margin-left: 100px;width: 180px;color:black;border-color: #60a3d8 #2970a9 #2970a9 #60a3d8;
 background: #60a3d8 linear-gradient(#89bbe2, #60a3d8 50%, #378bce);
  box-shadow: inset rgba(255,255,255,.5) 1px 1px;   
}
        </style>}

        </style>
    </head>
    <body>
        <h2  style='margin-left: 200px;color: blue;'>&#10148; SHOP &#10148;</h2>
        <form  action="buyProduct" method="POST" name="form1">
            <h2 style="font-size: 16px;color:blue; margin-left: 100px;">Список товаров</h2>
            <select name="selectedProduct">
                <c:forEach var="product" items="${listProducts}">
                    <option value="${product.id}">${product.name} ${product.price}euro, ${product.count} tk.</option>
                </c:forEach>
            </select>
                <h2 style="font-size: 16px;color:green;margin-left: 100px;">Список покупателей</h2>
            <select name="selectedCustomer">
                <c:forEach var="customer" items="${listCustomer}">
                    <option value="${customer.id}">${customer.name} ${customer.surname}${customer.money}</option>
                </c:forEach>
            </select>
                <button type="submit" name="buyProduct">Купить  продукт</button>
        </form>
    </body>
</html>