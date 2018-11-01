<%-- 
    Document   : newCustomer
    Created on : 16-Oct-2018, 21:17:50
    Author     : agloi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page нового покупателя</title>
    </head>
    <body>
        <h1>Добавляем в Shop нового покупателя</h1>
        <form action="addCustomer" method="POST" name="form1" id="_form1">
             Имя:<br>
            <input type="text" name="name"><br>
             Фамилия:<br>
            <input type="text" name="surname"><br>
             Деньги:<br>
            <input type="text" name="money"><br>
            <br>
            <input type="submit" value="Добавить">
        </form><br>
    </body>
</html>
