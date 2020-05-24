<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8"/>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Заказ подтвержден </title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1 class="alert alert-danger"> Thank you</h1>
				<p>Спасибо за ваш заказ! Он прибудет к вам очень скоро!</p>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<p>
				<a href="<spring:url value="/products" />" class="btn btn-primary">
					<span class="glyphicon-hand-left glyphicon"></span> products
				</a>
			</p>
		</div>
		
	</section>
</body>
</html>
