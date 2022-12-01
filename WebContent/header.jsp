<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="super_container">

	<!-- Header -->

	<header class="header">

		<!-- Top Bar -->

		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						<div class="top_bar_contact_item">
							<div class="top_bar_icon">
								<img
									src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918577/phone.png"
									alt="">
							</div>
							0559 132 111
						</div>
						<div class="top_bar_contact_item">
							<div class="top_bar_icon">
								<img
									src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918597/mail.png"
									alt="">
							</div>
							<a href="mailto:spacephone@gmail.com">spacephone@gmail.com</a>
						</div>
						<div class="top_bar_content ml-auto">
							<div class="top_bar_menu">
								<ul class="standard_dropdown top_bar_dropdown">
									<li><a href="#">English<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">Vietnamese</a></li>
											<li><a href="#">Spanish</a></li>
											<li><a href="#">Japanese</a></li>
										</ul></li>
									<li><a href="#">$ US dollar<i
											class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">dong Vietnamdong</a></li>
											<li><a href="#">GBP British Pound</a></li>
											<li><a href="#">JPY Japanese Yen</a></li>
										</ul></li>
								</ul>
							</div>
							<div class="top_bar_user">
								<div class="user_icon">
									<img
										src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918647/user.svg"
										alt="">
								</div>
								<c:if test="${sessionScope.acc != null}">
									<div class="log">
										<a>${sessionScope.acc.name}</a>
									</div>
									<div class="log">
										<a href="logout">Logout</a>
									</div>
								</c:if>
								<c:if test="${sessionScope.acc == null}">
									<div class="log">
										<a href="URLController?action=login">Login</a>
									</div>
								</c:if>
								<div>
									<a href="URLController?action=register">Register</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Header Main -->

		<div class="header_main">
			<div class="container">
				<div class="row">

					<!-- Logo -->
					<div class="col-lg-2 col-sm-3 col-3 order-1">
						<div class="logo_container">
							<div class="logo">
								<a href="ListProduct"><img
									src="${pageContext.request.contextPath}/media/logo/logo-no-background.png"
									alt="rectan-logo"></a>
							</div>
						</div>
					</div>

					<!-- Search -->
					<div
						class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
						<div class="header_search">
							<div class="header_search_content">
								<div class="header_search_form_container">
									<form action="SearchController2" method="POST"
										class="header_search_form clearfix">
										<input type="search" required="required"
											class="header_search_input" name="s" value="${txt}"
											placeholder="Search for products...">
										<div class="custom_dropdown" style="display: inline-block;">
											<div class="custom_dropdown_list">
												<span class="custom_dropdown_placeholder clc">All
													Categories</span> <i class="fas fa-chevron-down"></i>
												<ul class="custom_list clc">
													<li><a class="clc" href="#">All Categories</a></li>
													<li><a class="clc" href="#">Computers</a></li>
													<li><a class="clc" href="#">Laptops</a></li>
													<li><a class="clc" href="#">Cameras</a></li>
													<li><a class="clc" href="#">Hardware</a></li>
													<li><a class="clc" href="#">Smartphones</a></li>
												</ul>
											</div>
										</div>
										<button type="submit" class="header_search_button trans_300"
											value="Submit">
											<img
												src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918770/search.png"
												alt="">
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Wishlist -->
					<div
						class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
						<div
							class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
							<div
								class="wishlist d-flex flex-row align-items-center justify-content-end">
								<div class="wishlist_icon">
									<i class="fa fa-heart fa-2x"></i>
									<div class="wishlist_count">10</div>
								</div>
								<div class="wishlist_content">
									<div class="wishlist_text">
										<a href="#">Wishlist</a>
									</div>
								</div>
							</div>

							<!-- Cart -->
							<div class="cart">
								<div
									class="cart_container d-flex flex-row align-items-center justify-content-end">
									<div class="cart_icon">
										<i class="fa fa-shopping-cart fa-2x"></i>
										<div class="cart_count">
											<span>${countP==null?0:countP}</span>
										</div>
									</div>
									<div class="cart_content">
										<div class="cart_text">
											<a href="URLController?action=cart">Cart</a>
										</div>
										<div class="cart_price">
											$
											<c:out value="${sessionScope.cart.amount}" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Main Navigation -->

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col">

						<div class="main_nav_content d-flex flex-row">

							<!-- Categories Menu -->



							<!-- Main Nav Menu -->

							<div class="main_nav_menu">
								<ul class="standard_dropdown main_nav_dropdown">
									<li><a href="ListProduct">Home<i
											class="fas fa-chevron-down"></i></a></li>
									<li class="hassubs"><a href="#">Laptop<i
											class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">Lenovo<i class="fas fa-chevron-down"></i></a>
												<ul>
													<li><a href="#">Lenovo 1<i
															class="fas fa-chevron-down"></i></a></li>
													<li><a href="#">Lenovo 3<i
															class="fas fa-chevron-down"></i></a></li>
													<li><a href="#">Lenovo 2<i
															class="fas fa-chevron-down"></i></a></li>
												</ul></li>
											<li><a href="#">DELL<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="#">APPLE<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="#">HP<i class="fas fa-chevron-down"></i></a></li>
										</ul></li>
									<li class="hassubs"><a href="#">Featured Brands<i
											class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">APPLE<i class="fas fa-chevron-down"></i></a>
												<ul>
													<li><a href="#">Laptop<i
															class="fas fa-chevron-down"></i></a></li>
													<li><a href="#">Mobiles<i
															class="fas fa-chevron-down"></i></a></li>
													<li><a href="#">Ipads<i
															class="fas fa-chevron-down"></i></a></li>
												</ul></li>
											<li><a href="#">Samsung<i
													class="fas fa-chevron-down"></i></a></li>
											<li><a href="#">Lenovo<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="#">DELL<i class="fas fa-chevron-down"></i></a></li>
										</ul></li>
									<li class="hassubs"><a href="#">Pages<i
											class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">Shop<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="#">Product<i
													class="fas fa-chevron-down"></i></a></li>
											<li><a href="blog.html">Blog<i
													class="fas fa-chevron-down"></i></a></li>
											<li><a href="blog_single.html">Blog Post<i
													class="fas fa-chevron-down"></i></a></li>
											<li><a href="regular.html">Regular Post<i
													class="fas fa-chevron-down"></i></a></li>
											<li><a href="cart.html">Cart<i
													class="fas fa-chevron-down"></i></a></li>
											<li><a href="contact.html">Contact<i
													class="fas fa-chevron-down"></i></a></li>
										</ul></li>
									<c:if test="${sessionScope.acc != null && sessionScope.acc.role == 0}">
										<li><a href="History?user=${sessionScope.acc.usr}">Purchase history<i
												class="fas fa-chevron-down"></i></a></li>
									</c:if>
									<c:if test="${sessionScope.acc != null && sessionScope.acc.role == 1}">
										<li><a href="ManagerProduct">Manage product<i
												class="fas fa-chevron-down"></i></a></li>
									</c:if>

									<li><a href="contact.html">Contact<i
											class="fas fa-chevron-down"></i></a></li>
								</ul>
							</div>

							<!-- Menu Trigger -->

							<div class="menu_trigger_container ml-auto">
								<div
									class="menu_trigger d-flex flex-row align-items-center justify-content-end">
									<div class="menu_burger">
										<div class="menu_trigger_text">menu</div>
										<div class="cat_burger menu_burger_inner">
											<span></span><span></span><span></span>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</nav>

		<!-- Menu -->

		<div class="page_menu">
			<div class="container">
				<div class="row">
					<div class="col">

						<div class="page_menu_content">

							<div class="page_menu_search">
								<form action="SearchController2" method="POST">
									<input type="search" required="required"
										class="page_menu_search_input" name="s" value="${txt}"
										placeholder="Search for products...">
								</form>
							</div>
							<ul class="page_menu_nav">
								<li class="page_menu_item has-children"><a href="#">Language<i
										class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">English<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Italian<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Spanish<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Japanese<i class="fa fa-angle-down"></i></a></li>
									</ul></li>
								<li class="page_menu_item has-children"><a href="#">Currency<i
										class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">US Dollar<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">EUR Euro<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">GBP British Pound<i
												class="fa fa-angle-down"></i></a></li>
										<li><a href="#">JPY Japanese Yen<i
												class="fa fa-angle-down"></i></a></li>
									</ul></li>
								<li class="page_menu_item"><a href="ListProduct">Home<i
										class="fa fa-angle-down"></i></a></li>
								<li class="page_menu_item has-children"><a href="#">Super
										Deals<i class="fa fa-angle-down"></i>
								</a>
									<ul class="page_menu_selection">
										<li><a href="#">Super Deals<i
												class="fa fa-angle-down"></i></a></li>
										<li class="page_menu_item has-children"><a href="#">Menu
												Item<i class="fa fa-angle-down"></i>
										</a>
											<ul class="page_menu_selection">
												<li><a href="#">Menu Item<i
														class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fa fa-angle-down"></i></a></li>
											</ul></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul></li>
								<li class="page_menu_item has-children"><a href="#">Featured
										Brands<i class="fa fa-angle-down"></i>
								</a>
									<ul class="page_menu_selection">
										<li><a href="#">Featured Brands<i
												class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul></li>
								<li class="page_menu_item has-children"><a href="#">Trending
										Styles<i class="fa fa-angle-down"></i>
								</a>
									<ul class="page_menu_selection">
										<li><a href="#">Trending Styles<i
												class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul></li>
								<c:if test="${sessionScope.acc != null && sessionScope.acc.role == 0}">
										<li><a href="History?user=${sessionScope.acc.usr}">Purchase history<i
												class="fas fa-chevron-down"></i></a></li>
									</c:if>
									<c:if test="${sessionScope.acc != null && sessionScope.acc.role == 1}">
										<li><a href="ManagerProduct">Manage product<i
												class="fas fa-chevron-down"></i></a></li>
									</c:if>
								<li class="page_menu_item"><a href="contact.html">contact<i
										class="fa fa-angle-down"></i></a></li>
							</ul>

							<div class="menu_contact">
								<div class="menu_contact_item">
									<div class="menu_contact_icon">
										<img
											src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918577/phone.png"
											alt="">
									</div>
									0559 132 111
								</div>
								<div class="menu_contact_item">
									<div class="menu_contact_icon">
										<img
											src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918597/mail.png"
											alt="">
									</div>
									<a href="mailto:spacephone@gmail.com">spacephone@gmail.com</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

</div>