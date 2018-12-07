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
            .input {
   border: 1px solid #cccccc;
   border-radius: 3px; 
   -webkit-border-radius: 3px; 
   -moz-border-radius: 3px;
   -khtml-border-radius: 3px; 
   background: #ffffff !important;
   outline: none; 
   height: 24px; 
   width: 120px;
   color: #cccccc; 
   font-size: 11px;
   font-family: Tahoma; 
}
        </style>
    </head>
    <body>
            <h1>Назначение ролей</h1>
        <form action="addUserRole" method="POST">
            <select name="user">
                <c:forEach var="entry" items="${mapUsers}">
                    <option value="${entry.key.id}">${entry.key.login}, роль: ${entry.value}</option>
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
