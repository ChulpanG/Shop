<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="now" class="java.util.Date" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8"/>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Подтверждение заказа</title>
</head>

<body>

	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Order</h1>
				<p>Подтверждение заказа</p>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="row">
			<form:form modelAttribute="order" class="form-horizontal">
				<input type="hidden" name="_flowExecutionKey"
					value="${flowExecutionKey}" />

				<div
					class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
					<div class="text-center">
						<h1>Чек</h1>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<address>
								<strong>Адрес доставки</strong> <br>
								${order.user.lastName} ${order.user.firstName}<br>
								${order.user.doorNo},${order.user.streetName}
								<br>
								${order.user.areaName},${order.user.stateName}
								<br>
								${order.user.country},${order.user.zipCode}
								<br>
							</address>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 text-right">
							<p>
								Дата доставки: <fmt:formatDate type="date" value="${now}" />
								<%--<em>Shipping DateDate: <fmt:formatDate type="date"--%>
										<%--value="${order.shippingDetail.shippingDate}" /></em>--%>
							</p>
						</div>
					</div>
					<div class="row">

						<table class="table table-hover">
							<thead>
								<tr>
									<th>Продукт</th>
									<th>Количество</th>
									<th class="text-center">Цена</th>
									<th class="text-center">Итого</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${order.cart.products}">
									<tr>
										<td class="col-md-9"><em>${item.value.product.productName}</em></td>
										<td class="col-md-1" style="text-align: center">
											${item.value.quantity}</td>
										<td class="col-md-1 text-center">$${item.value.product.productPrice}</td>
										<td class="col-md-1 text-center">$${item.value.totalValue}</td>
									</tr>
								</c:forEach>

								<tr>
									<td></td>
									<td></td>
									<td class="text-right"><h4>
											<strong>Итого:</strong>
										</h4></td>
									<td class="text-center text-danger"><h4>
											<strong>$${order.cart.totalPrice}</strong>
										</h4></td>
								</tr>
							</tbody>
						</table>
						<button id="back" class="btn btn-default"
							name="_eventId_backToCollectShippingDetail">Назад</button>

						<button type="submit" class="btn btn-success"
							name="_eventId_orderConfirmed">
							Подтвердить<span class="glyphicon glyphicon-chevron-right"></span>
						</button>
						<button id="btnCancel" class="btn btn-default"
							name="_eventId_cancel">Оменить</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>
