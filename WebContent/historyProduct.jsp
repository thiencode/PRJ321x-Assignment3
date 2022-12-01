<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase history</title>
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
<%-- JavaScript --%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body class="d-flex flex-column min-vh-100">
	<c:import url="header.jsp" />

	<%-- Body page --%>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Purchase history
						</h2>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>ORDER ID</th>
						<th>LIST PRODUCT</th>
						<th>Amount</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="o" items="${oList}">
					<%-- <c:set var="x" property="p.lp"  /> --%>
						<tr>
							<td>${o.orderId}</td>
							<td>
								<ul>
									<c:forEach var="po" items="${o.lp}">
										<li><a href="InformationProductController?id=${po.productId}">${po.nameProduct}</a></li>
									</c:forEach>
								</ul>
							</td>
							<td>$ ${o.amount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


	<c:import url="footer.jsp" />
</body>
</html>