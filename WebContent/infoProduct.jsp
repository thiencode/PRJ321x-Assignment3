<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.name}</title>
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
	href="${pageContext.request.contextPath}/css/infoProduct.css">
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
    <div class="container">
            <div class="title">
                <h3>${product.name}</h3>
            </div>
            <div class="content row">
                <div class="image">
                    <img src="${product.src}" alt=""/>
                </div>
                <div class="description">
                    <h4>$ ${product.price}</h4>
                    <p>${product.description}</p>
                    <a href="AddToCartController?id=${product.id}&action=add" class="btn btn-warning btn-lg">Add to cart</a>
                </div>
            </div>
    </div>

	<c:import url="footer.jsp" />
</body>
</html>