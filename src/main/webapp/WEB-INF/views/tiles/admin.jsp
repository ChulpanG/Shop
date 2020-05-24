<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>


<div class="jumbotron">
    Привет <strong>${user}</strong>, ты попал в админку.
    <br/>
    Может быть ты хочешь <a href="<c:url value='/newUser' />">добавить нового пользователя </a>
    или  <a href="<c:url value='/products/add' />">добавить новых блюд?</a>
    <br/>
</div>