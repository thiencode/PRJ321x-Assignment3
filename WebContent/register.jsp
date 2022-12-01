<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create an account</title>
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
	src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body>
	<%-- Header --%>
	<c:import url="header.jsp" />

	<%-- Body --%>
	<div class="body-signup"
		style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
		<div class="col-md-6 col-10 col-md-offset-6 col-offset-10" id="login">
			<section id="inner-wrapper" class="login">
				<article>
					<form action="Register" method="POST">
						<h2 class="text-uppercase text-center mb-5">Create an account</h2>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user">
								</i></span> <input type="text" name="name" class="form-control" placeholder="User Name.">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope">
								</i></span> <input type="email" name="user-mail" class="form-control"
									placeholder="Email Address. (Example: abc@gmail.com)">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-key">
								</i></span> <input type="password" name="pass" class="form-control"
									placeholder="Password. (0-9)">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-key">
								</i></span> <input type="password" name="repass" class="form-control"
									placeholder="Confirm Password.">
							</div>
						</div>
						<div class="text-center">
							<p style="color: red;">
								<%
								String er = (String) session.getAttribute("error");
								if (er != null) {
									out.println(er);
								}
								%>
							</p>
						</div>
						<button type="submit" class="btn btn-success btn-block">Submit</button>
					</form>
				</article>
			</section>
		</div>
	</div>
	<%-- Footer --%>
	<c:import url="footer.jsp" />
</body>
</html>