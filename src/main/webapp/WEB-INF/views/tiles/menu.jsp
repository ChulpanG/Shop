<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authorize access="hasRole('ADMIN')">

    <div class="list-group">
        <a href="/admin" class="list-group-item "><i class="glyphicon glyphicon-th-list"></i> Меню</a>
        <br>
        <a href="<c:url value='/newUser'/>" class="list-group-item"><i class="glyphicon glyphicon-plus"></i> Добавить пользователя</a>
        <a href="<c:url value='/products/add'/>" class="list-group-item"><i class="glyphicon glyphicon-plus"></i> Добавить продукт</a>
        <a href="<c:url value='/admin/users'/>" class="list-group-item"><i class="glyphicon glyphicon-user"></i>  Список пользователей</a>
        <a href="<c:url value='/myOrders'/>" class="list-group-item"><i class="glyphicon glyphicon-barcode"></i>  Список заказов</a>
        <a href="<c:url value='/about'/>" class="list-group-item"><i class="glyphicon glyphicon-barcode"></i> About </a>
    </div>


</sec:authorize>
<br>
<div class="list-group">
    <a href="/products" class="list-group-item "><i class="glyphicon glyphicon-th-list"></i> Menu</a>
    <br>
    <a href="<c:url value='/products?category=Breakfast'/>" class="list-group-item">Завтраки</a>
    <a href="<c:url value='/products?category=Lanch'/>" class="list-group-item">Обеды</a>
    <a href="<c:url value='/products?category=Dinner'/>" class="list-group-item">Ужины</a>
    <a href="<c:url value='/products?category=Other'/>" class="list-group-item">Другое</a>
</div>

