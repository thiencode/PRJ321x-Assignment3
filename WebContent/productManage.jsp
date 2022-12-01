<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Product</title>
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
<body class="d-flex flex-column min-vh-100">
	<c:import url="header.jsp" />

	<%-- Body page --%>
	<div class="container mt-4">
		<div class="table-wrapper">
			<div class="table-title bg-secondary pt-3 pl-3 text-white">
				<div class="row mb-1">
					<div class="col-sm-6">
						<h2>
							Manage Product
						</h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success align-middle"
							data-toggle="modal"><i class="material-icons align-middle">&#xE147;</i> <span>Add
								New Product</span></a> 
								<!-- <a href="#deleteEmployeeModal"
							class="btn btn-danger" data-toggle="modal"><i
							class="material-icons">&#xE15C;</i> <span>Delete</span></a> -->
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th>ID</th>
						<th>Name</th>
						<th>Image</th>
						<th>Price</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listA}" var="p">
						<tr class="align-middle">
							<td class="align-middle"><span class="custom-checkbox"> <input
									type="checkbox" id="checkbox1" name="options[]" value="1">
									<label for="checkbox1"></label>
							</span></td>
							<td class="align-middle">${p.id}</td>
							<td class="align-middle">${fn:substring(fn:toUpperCase(p.name),0,1)}${fn:substring((p.name),1,-1)}</td>
							<td><img
								src="${p.src}" width="50px">
							</td>
							<td class="align-middle">$ ${p.price }</td>
							<td class="align-middle">
							<!--  data-target="#editEmployeeModal" -->
								<a href="EditController?action=load&idP=${p.id}" class="edit"><i class="material-icons" title="Edit">&#xE254;</i></a> 
									<a href="ManagerProduct?action=delete&idP=${p.id}&index=${tag}" class="delete" ><i
									class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clearfix mb-4">
				<div class="hint-text float-left">
					Showing <b>8</b> out of <b>${co}</b> entries
				</div>
				<ul class="pagination float-right">
					<li class='page-item ${tag==1?"disabled":""}'><a href="ManagerProduct?index=${tag-1}" class="page-link">Previous</a></li>
					<c:forEach begin="1" end="${endP}" var="i">
						<li class='page-item ${tag==i?"active":"" }'><a href="ManagerProduct?index=${i}" class='page-link'>${i}</a></li>
					</c:forEach>
					<li class='page-item ${tag==endP?"disabled":""}'><a href="ManagerProduct?index=${tag+1}" class="page-link">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- ADD Product HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="add" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Add Product</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Name</label> <input name="name" type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Description</label>
							<textarea name="description" class="form-control" required></textarea>
						</div>
						<div class="form-group">
							<label>Price</label> <input name="price" type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Image</label> <input name="image" type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Type</label>
							<input name="type" type="text" class="form-control" required></input>
						</div>
						<div class="form-group">
							<label>Brand</label>
							<input name="brand" type="text" class="form-control" required></input>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> 
							<input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div> 
	<c:import url="footer.jsp" />
</body>
</html>