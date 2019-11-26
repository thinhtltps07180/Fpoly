
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<header>

	<div class="header-top">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 col-md-6 col-sm-6 col-6 header-top-left no-padding">
					<ul>
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
						<li><a href="#"><i>Register</i></a></li>
						<li><a href="/home/login">
						<%if(session.getAttribute("user") == null) { 
						out.print("Login"); 
						} 
						 %>
						</a>
						<li><a href="/home/edit">${user.id}</a></li>
						</li>
						<li><a href="/home/logout">
						<%if(session.getAttribute("user") != null) { 
						out.print("Logout"); 
						} 
						 %>
						</a>
						</li>
					
				</div>
				<div
					class="col-lg-6 col-md-6 col-sm-6 col-6 header-top-right no-padding">
					<ul>
						<li><a href="tel:+440 012 3654 896"><span
								class="lnr lnr-phone-handset"></span><span>+84 337039857</span></a></li>
						<li><a href="mailto:support@colorlib.com"><span
								class="lnr lnr-envelope"></span><span>tranlethanhthinh@gmail.com</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="logo-wrap">
		<div class="container">

			<%-- <c:forEach var="c" items="${listPut}"> --%>
			<div class="row justify-content-between align-items-center">
				<div class="col-lg-4 col-md-4 col-sm-12 logo-left no-padding">
					<a href="index.html"> <img class="img-fluid"
						src="/static/images/Poly.png" alt="">
					</a>
				</div>
				<div
					class="col-lg-8 col-md-8 col-sm-12 logo-right no-padding ads-banner">
					<img class="img-fluid" src="/static/images/${listPut.product.image}" alt="">
					<p>Banner Order By : ${listPut.order.user.id	}</p>
				</div>
				
			</div>
			<%-- </c:forEach> --%>
		</div>
	</div>
	<div class="container main-menu" id="main-menu">
		<div class="row align-items-center justify-content-between">
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="/home/index">Home</a></li>
					<li class="menu-has-children"><a href="">Category</a>
						<ul>
							<li><a href="/home/CategoryIsUEFAChampionsLeague">UEFA Champions League</a></li>
							<li><a href="/home/CategoryIsPremierLeague">Premier League</a></li>
							<li><a href="/home/CategoryIsBundesLiga">BundesLiga</a></li>
							<li><a href="/home/CategoryIsSerieA">Serie A</a></li>
							<li><a href="image-post.html">La Liga</a></li>
							<li><a href="CategoryIsVietnamesefootball">Vietnamese football</a></li>
						</ul></li>
					<li><a href="/home/about">About</a></li>
					<li><a href="/home/contact">Contact</a></li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
			<div class="navbar-right">
				<form class="Search">
					<input type="text" class="form-control Search-box"
						name="Search-box" id="Search-box" placeholder="Search"> <label
						for="Search-box" class="Search-box-label"> <span
						class="lnr lnr-magnifier"></span>
					</label> <span class="Search-close"> <span class="lnr lnr-cross"></span>
					</span>
				</form>
			</div>
		</div>
	</div>
</header>