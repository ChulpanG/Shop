<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"/>"></script>
<script src="<c:url value="/resources/js/controllers.js"/>"></script>


<section class="container" ng-app="cartApp">
    <div ng-controller="cartCtrl" ng-init="initCartId('${cartId}')" class="col-xs-8">

        <div>
            <a class="btn btn-danger pull-left"
               ng-click="clearCart()"> <span
                    class="glyphicon glyphicon-remove-sign"></span> Очистить корзину
            </a>
            <a href="<spring:url value="/checkout?cartId=${cartId}"/>" class="btn btn-success pull-right"> <span
                class="glyphicon-shopping-cart glyphicon"></span> Подтвердить
        </a>
        </div>
        <table class="table table-hover">
            <tr>
                <th>Продукт</th>
                <th>Цена</th>
                <th>Количество</th>
                <th>Итого</th>
                <th>Действие</th>
            </tr>
            <tr ng-repeat="item in cart.products">
                <td>{{item.product.productName}}</td>
                <td>{{item.product.productPrice}}</td>
                <td>{{item.quantity}}</td>
                <td>{{item.totalValue}}</td>
                <td><a href="#" class="label label-danger" ng-click="removeFromCart(item.product.id)">
                    <span class="glyphicon glyphicon-remove"/></span> Удалить
                </a></td>
            </tr>
            <tr>
                <th></th>
                <th></th>
                <th>Итого</th>
                <th>{{cart.totalPrice}} РУБ</th>
                <th></th>
            </tr>
        </table>

        <a href="<spring:url value="/products" />" class="btn btn-default">
            <span class="glyphicon-hand-left glyphicon"></span> Продолжить покупки
        </a>
    </div>
</section>




