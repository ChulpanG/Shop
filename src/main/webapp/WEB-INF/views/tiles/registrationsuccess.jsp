<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="alert alert-success" role="alert">
    <a href="#" class="alert-link">
        Подтверждение : ${success}
        <br>
        Хотитите <a href="<c:url value='/newUser' />">добавить еще пользователя</a>?
        <br/>
        Перейти в <a href="<c:url value='/admin' />">админку</a> или <a href="<c:url value="/logout" />">Выйти</a>
    </a>
</div>