<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product ID = ${pro.id}</title>
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
<body>
	<c:import url="header.jsp" />

	<%-- Body page --%>
	<div id="editEmployeeModal" class="">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="EditController?action=edit&idP=${pro.id}" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Edit Product ID = ${pro.id}</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Name</label> <input name="name" type="text" value="${pro.name}"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Description</label>
							<textarea name="description" class="form-control" required>${pro.description}</textarea>
						</div>
						<div class="form-group">
							<label>Price</label> <input name="price" type="text" value="${pro.price}"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Image</label> <input name="image" type="text" value="${pro.src}"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Type</label>
							<input name="type" value="${pro.type}" type="text" class="form-control" required></input>
						</div>
						<div class="form-group">
							<label>Brand</label>
							<input name="brand" value="${pro.brand}" type="text" class="form-control" required></input>
						</div>
					</div>
					<div class="modal-footer">
						<a href="ManagerProduct"><input type="button" class="btn btn-default" value="Cancel"></a>
						<input type="submit" class="btn btn-info" value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:import url="footer.jsp" />
</body>
</html>