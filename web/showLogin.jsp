<%--
    Document   : ShowLogin
    Created on : Dec 4, 2018, 10:30:35 AM
    Author     : pupil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Вход в систему</title>
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
        </style>
    </head>
    <body>

               <h3 style='margin-left: 200px;color:red;'>&#128274;Для входа в систему введите ЛОГИН и ПАРОЛЬ</h3>
        ${info}<br>
        <form action="login" method="POST" name="form1" id="_form1">
             Логин:<br>
            <input type="text" name="login"><br>
            <br>
             Пароль:<br>
            <input type="password" name="password"><br>
            <br>
            <input type="submit" value="Войти">
        </form><br><br>
        <a href="newCustomer">&#10148;Зарегистрироваться &#10148;</a>
        </form><br>
    </body>
</html>
