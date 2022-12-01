<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search result</title>
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
<%-- CSS --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/head.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
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
		<c:if test="${not empty result}">
			<div class="flex-layout">
				<c:forEach items="${result}" var="p">
					<div class="flex-item"
						onclick="location.href='InformationProductController?id=${p.id}'">
						<div class="flex-content">
							<img src="${p.src}" alt="" class="flex-image" />
							<div class="content">
								<h4 class="phone-co">${fn:toUpperCase(p.type)}</h4>
								<p class="phone-name">${p.name}</p>
								<p class="phone-cost">$${p.price }</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		<%-- Paging java --%>
		<div class="d-flex justify-content-center pagination_rounded ${endP<2?'hidden':''}">
			<ul>
				<li><a href="SearchController2?index=${tag-1}&s=${txt}"
					class="prev ${tag==1?'hidden':'' }"><i
						class="fa fa-angle-double-left"></i> Prev </a></li>
				<c:forEach begin="1" end="${endP}" var="i">
					<li class="hidden-xs"><a
						href="SearchController2?index=${i}&s=${txt}"
						class='${tag ==i?"active":"" }'>${i}</a></li>
				</c:forEach>
				<li><a href="SearchController2?index=${tag+1}&s=${txt}"
					class="next ${tag==endP?'hidden':'' }"> Next <i
						class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</c:if>
	<c:if test="${empty result}">
		<h2>No Items to result</h2>
	</c:if>

	<c:import url="footer.jsp" />
</body>
</html>