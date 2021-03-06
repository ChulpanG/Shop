<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<div class="list-group">
    <a href="/admin" class="list-group-item "><i class="glyphicon glyphicon-th-list"></i> Меню</a>
    <br>
    <a href="<c:url value='/newUser'/>" class="list-group-item"><i class="glyphicon glyphicon-plus"></i> Добавить пользователей</a>
    <a href="<c:url value='/products/add'/>" class="list-group-item"><i class="glyphicon glyphicon-plus"></i> Добавить продукты</a>
    <a href="<c:url value='/admin/users'/>" class="list-group-item"><i class="glyphicon glyphicon-user"></i>  Список пользователей</a>
    <a href="<c:url value='/myOrders'/>" class="list-group-item"><i class="glyphicon glyphicon-barcode"></i>  Список заказов</a>
</div>

