<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8"/>

    <link rel="stylesheet"
          href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <title>Покупатель</title>
</head>
<body>
<section>
    <div class="jumbotron">
        <div class="container">
            <h1>Покупатель</h1>
            <p>Детали</p>
        </div>
    </div>
</section>
<section class="container">
    <form:form modelAttribute="order.user" class="form-horizontal">
        <fieldset>
            <legend>Детали</legend>
            <form:errors path="*" cssClass="alert alert-danger" element="div"/>


            <div class="form-group">
                <label class="control-label col-lg-2" for="firstName">Имя</label>
                <div class="col-lg-10">
                    <form:input id="firstName" path="firstName" type="text" class="form:input-large"/>
                    <form:errors path="firstName" cssClass="text-danger"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="lastName">Фамилия</label>
                <div class="col-lg-10">
                    <form:input id="lastName" path="lastName" type="text" class="form:input-large"/>
                    <form:errors path="lastName" cssClass="text-danger"/>

                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="email">E-mail</label>
                <div class="col-lg-10">
                    <form:input id="email" path="email" type="text" class="form:input-large"/>
                    <form:errors path="email" cssClass="text-danger"/>

                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="phoneNumber">Телефон</label>
                <div class="col-lg-10">
                    <form:input id="phoneNumber" path="phoneNumber" type="text" class="form:input-large"/>
                    <form:errors path="phoneNumber" cssClass="text-danger"/>

                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="doorNo">Номер квартиры</label>
                <div class="col-lg-10">
                    <form:input id="doorNo" path="doorNo" type="text"
                                class="form:input-large"/>
                    <form:errors path="doorNo" cssClass="text-danger"/>

                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="streetName">Улица</label>
                <div class="col-lg-10">
                    <form:input id="streetName" path="streetName" type="text"
                                class="form:input-large"/>
                    <form:errors path="streetName" cssClass="text-danger"/>

                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="areaName">Район</label>
                <div class="col-lg-10">
                    <form:input id="areaName" path="areaName" type="text"
                                class="form:input-large"/>
                    <form:errors path="areaName" cssClass="text-danger"/>

                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="state">Регион</label>
                <div class="col-lg-10">
                    <form:input id="state" path="stateName" type="text"
                                class="form:input-large"/>
                    <form:errors path="stateName" cssClass="text-danger"/>

                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="country">Страна</label>
                <div class="col-lg-10">
                    <form:input id="country" path="country" type="text"
                                class="form:input-large"/>
                    <form:errors path="country" cssClass="text-danger"/>

                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="zipCode">Индекс</label>
                <div class="col-lg-10">
                    <form:input id="zipCode" path="zipCode" type="text"
                                class="form:input-large"/>
                    <form:errors path="zipCode" cssClass="text-danger"/>

                </div>
            </div>

            <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"/>

            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" id="btnAdd" class="btn btn-primary"
                           value="Add" name="_eventId_customerInfoCollected"/>
                    <button id="btnCancel" class="btn btn-default" name="_eventId_cancel">Отменить</button>
                </div>
            </div>

        </fieldset>
    </form:form>
</section>
</body>
</html>
