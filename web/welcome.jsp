

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Главная</title>
    </head>
    <body>
 <h1 style='color:blue;margin-left:100px;'>Навигация по сайту</h1>
        ${info}<br>
         <a href="showLogin" style='margin-left: 200px;'> &#10148; Войти в систему</a>
        <a href="logout"> &#10148;Выйти из системы</a><br><br>
        <a href="newProduct" style='margin-left: 200px;'> &#10004;Добавить продукт</a>&#10059;
        <a href="newCustomer"> &#10004;Добавить покупателя</a>&#10059;<br><br>
        <a href="showProducts" style=" display: inline-block;margin-left: 200px;
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
  box-shadow: inset rgba(255,255,255,.5) 1px 1px;">Список продуктов</a><br><br>
        <a href="showCustomer"  style=" display: inline-block;margin-left: 200px;
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
  box-shadow: inset rgba(255,255,255,.5) 1px 1px;">Список покупателей</a><br><br>
        <a href="shop" style='margin-left: 200px;'> &#10148;Купить продукт</a>
        <a href="showBuyProduct"> &#10148;Список купленных товаров</a>
        <br>
        <p style="margin-left: 50px;"> Для администратора:
          <a href="editUserRoles" style="display: inline-block;
  width: 300px;
  height: 50px;
  line-height: 50px;
  font-size: 20px;
  text-align: center;
  text-decoration: none;
  text-shadow: 0 1px rgba(255,255,255,.2), 0 -1px rgba(0,0,0,.8);
  outline: none;
  border: none;
  border-radius: 100px;
  background: rgb(28,107,114) radial-gradient(150% 100% at 50% 5px, rgba(255,255,255,.2), rgba(0,0,0,0));
  box-shadow: inset rgba(0,0,0,.6) 0 -2px 5px, inset rgba(252,255,255,.7) 0 2px 5px, rgba(0,0,0,.8) 0 2px 5px -1px;
  color: rgb(0,79,86);
  user-select: none;">Назначение ролей пользователям</a></p>
        <br><br>
        <h3  style='margin-left: 200px;color: blue;'>&#10148; Продукты &#10148;</h3>
        <p style="margin-left: 200px;">В базу данных добавлен продукт:<br>
        Название продукта: ${product.name}<br>
        Цена продукта: ${product.price}<br>
        Количество: ${product.count}<br></p>
        <br>
        <h3  style='margin-left: 200px;color:blue;'>&#10148; Покупатель &#10148;</h3>
        <p style="margin-left: 200px;">В базу данных добавлен покупатель:<br>
        Имя: ${customer.name}<br>
        Фамилия: ${customer.surname}<br>
        Деньги: ${customer.money}<br></p>
    </body>
</html>
