<%-- 
    Document   : editUsersRoles
    Created on : 24-Nov-2018, 20:15:13
    Author     : agloi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Назначение ролей</title>
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
            <h3  style='margin-left: 100px;color:red;'>Назначение ролей</h3>
        <form action="addUserRole" method="POST">
            <select name="user">
                <c:forEach var="entry" items="${mapUsers}">
                    <option  value="${entry.key.id}">${entry.key.login}, роль: ${entry.value}</option>
                </c:forEach>

            </select>
            <select  name="role">
                <c:forEach var="role" items="${listRoles}">
                    <option value="${role.id}">${role.name}</option>
                </c:forEach>

            </select>
            <input type="submit" value="Назначить">
        </form>
        
    </body>
</html>
