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
form {margin-left: 100px;}
        </style>   
    </head>
    <body>
        <h3 style='margin-left: 100px;color:red;'>Добавляем в Shop нового покупателя</h3>
        ${info}
        <form action="addCustomer" method="POST" name="form1" id="_form1">
            Имя:<br>
            <input type="text" name="name"><br><br>
            Фамилия:<br>
            <input type="text" name="surname"><br><br>
            Деньги:<br>
            <input type="text" name="money"><br>
            <br>
            Логин:<br>
            <input type="text" name="login"><br><br>
            Пароль:<br>
            <input type="text" name="password1"><br>
            Повторите пароль:<br>
            <input type="text" name="password2">
            <br>
            <br><br>
            <input type="submit" value="Добавить">
        </form><br><br>
    </body>
</html>
