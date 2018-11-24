<%-- 
    Document   : newRole
    Created on : 24-Nov-2018, 20:18:58
    Author     : agloi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Нова роль</title>
    </head>
    <body>
          <h1>Добавляем в Shop новую роль</h1>
        ${info}
        <form action="addRole" method="POST" name="form1" id="_form1">
             Имя  роли:<br>
            <input type="text" name="nameRole"><br>
           
            <br>
            <input type="submit" value="Добавить">
        </form><br>
        <a href="welcome">На главную </a>
    </body>
</html>
