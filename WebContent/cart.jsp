<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<!-- add icon link -->
<link rel="icon"
	href="${pageContext.request.contextPath}/media/logo/logo-no-background.png"
	type="image/x-icon">
<%-- CSS reset --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<%-- CSS Scrollball --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/scrollball.css">
<%-- CSS Bootstrap --%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/head.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cart.css">
<%-- JavaScript --%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body>
	<c:import url="header.jsp" />

	<%-- Body page --%>
	<div class="containers">
		<div class="tbl-product">
			<table>
				<thead>
					<tr>
						<th style="width: 40%">Products in cart: ${countP}</th>
						<th style="width: 15%">Price</th>
						<th style="width: 15%">Quantity</th>
						<th style="width: 15%">Amount</th>
						<th style="width: 15%">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productList}" var="pro">
						<tr>
							<td>${pro.name}<br />${pro.id}</td>
							<td>$ ${pro.price}</td>
							<td>
								<div class="stepper">
									<!-- Minus button -->
									<span class="stepper__button" onclick="location.href='AddToCartController?id=${pro.id}&action=minus'">-</span>

									<!-- Input container -->
									<div class="stepper__content">
										<span class="stepper__input">${pro.number}</span>
									</div>

									<!-- Plus button -->
									<span class="stepper__button" onclick="location.href='AddToCartController?id=${pro.id}&action=add'">+</span>
								</div>
							</td>

							<td>$ ${pro.getAmount()}</td>
							<td><a href="AddToCartController?id=${pro.id}&action=delete"
								class="btn btn-danger btn-sm">Remove</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">Total <c:out
								value="${sessionScope.cart.amount}" />
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="userForm">
			<form action="PayController" method="post">
				<div class="rowInput">
					<label for="name">Customer name</label> <input type="email"
						name="name" id="name"
						placeholder="Email Address. (Example: abc@gmail.com)">
				</div>
				<div class="rowInput">
					<label for="address">Customer address</label> <input type="text"
						name="address" id="address" placeholder="Enter address">
				</div>
				<div class="rowInput">
					<label for="discount">Discount code(if any):</label> <input
						type="text" name="discount" id="code" placeholder="Enter discount">
				</div>
				<p class="text-danger">${error}</p>
				<input type="submit" value="Submit" class="btn btn-warning btn-lg">
			</form>
		</div>
	</div>

	<c:import url="footer.jsp" />
</body>
</html>