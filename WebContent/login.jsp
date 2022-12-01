<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- add icon link -->
<link rel="icon"
	href="${pageContext.request.contextPath}/media/logo/logo-no-background.png"
	type="image/x-icon">
<title>Login page</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>

	<div class="main">
		<div class="sidenav">
			<div class="login-main-text">
				<h1>Welcome Back!</h1>
				<p>
					To keep connected with us <br> please login with your personal
					<br> info
				</p>
			</div>
		</div>
		<div class="col-sm-12">
			<div class="login-form">
				<form action="login" method="post">
					<h1>Sign in</h1>
					<input type="hidden" name="action" value="dologin" />
					<%
					Cookie[] cookie = request.getCookies();
					String value = "";
					if (cookie != null) {
						for (Cookie retrievedCookie : cookie) {
							if (retrievedCookie.getName().equals("username"))
						value = retrievedCookie.getValue();
						}
					}
					if (value == "") {
					%>
					<div class="form-group">
						<label for="username"><b>User Name</b></label> <input type="email"
							name="username" class="form-control" placeholder="User Name">
					</div>
					<%
					} else {
					%>
					<div class="form-group">
						<label for="username"><b>User Name</b></label> <input type="email"
							name="username" class="form-control" value=<%=value%>>
						<%
						}
						%>
					</div>
					<div class="form-group">
						<label for="password"><b>Password</b></label> <input
							type="password" name="password" class="form-control"
							placeholder="Password">
					</div>
					<div class="form-group">
						<span> <input type="checkbox" name="remember" id="remember" checked > 
							<label for="remember">Remember me</label>
						</span>
						<br/>
						<span> <input type="checkbox" name="forAdmin" id="forAdmin" checked > 
							<label for="forAdmin">Login for Admintation</label>
						</span>
					</div>
					<!-- <div class="form-group">
					</div> -->
					<div class="text-center">
						<p style="color:red;">
						<% String er = (String)session.getAttribute("error");
							if (er != null){
								out.println(er);
							}
						%>
						</p>
						<p>
							<a href="URLController?action=register">Create an account</a>
						</p>
						<input type="submit" class="btn btn-outline-success btn-lg" value="Login"/>
					</div>
				</form>
						<a href="URLController" >Click here to come back home page.</a>
			</div>
		</div>
	</div>
</body>
</html>