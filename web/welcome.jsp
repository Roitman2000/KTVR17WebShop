

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Главная</title>
    </head>
    <body>
        <h1>Навигация по сайту</h1>
        ${textToPage}<br>
        <a href="newProduct">Добавить продукт</a><br><br>
        <a href="newCustomer">Добавить покупателя</a><br><br>
        <a href="showProducts">Список продуктов</a><br><br>
        <a href="showCustomer">Список покупателей</a><br><br>
        <a href="shop">Купить продукт</a>
        <a href="showBuyProduct">Список купленных товаров</a>
        <br>
        Добавлен продукт:<br><br>
        Название продукта: ${product.name}<br>
        Цена продукта: ${product.price}<br>
        Количество: ${product.count}<br>
        <br>
        Добавлен покупатель:<br><br>
        Имя: ${customer.name}<br>
        Фамилия: ${customer.surname}<br>
        Деньги: ${customer.money}<br>
    </body>
</html>
