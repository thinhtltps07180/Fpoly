<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<div class="container no-padding">
	<div class="row">
		<div class="col-lg-8 post-list">
			<!-- Start single-post Area -->
			<!-- Start popular-post Area -->
			<div class="popular-post-wrap">
				<h4 class="title">New Posts</h4>
				<div class="feature-post relative">
					<div class="feature-img relative">
						<div class="overlay overlay-bg"></div>
						<img class="img-fluid" src="/static/images/${top1.thumbnail}" alt="">
					</div>
					<div class="details">
						<ul class="tags">
							<li><a href="#">${top1.categories.name}</a></li>
						</ul>
						<a href="image-post.html">
							<h3>${top1.title}</h3>
						</a>
						<ul class="meta">
							<li><a href="#"><span class="lnr lnr-user"></span>${top1.user.id}</a></li>
							<li><a href="#"><span class="lnr lnr-calendar-full"></span>${top1.createDate}</a></li>
							<li><a href="#"><span class="lnr lnr-bubble"></span>06
									Comments</a></li>
						</ul>
					</div>
				</div>
				<div class="row mt-20 medium-gutters">
					<c:forEach var="n" items="${listTop2}">
					<div class="col-lg-6 single-popular-post">
						<div class="feature-img-wrap relative">
							<div class="feature-img relative">
								<div class="overlay overlay-bg"></div>
								<img class="img-fluid" src="/static/images/${n.thumbnail}" alt="">
							</div>
							<ul class="tags">
								<li><a href="#">${n.categories.name}</a></li>
							</ul>
						</div>
						<div class="details">
							<a href="image-post.html">
								<h4>${n.title}</h4>
							</a>
							<ul class="meta">
								<li><a href="#"><span class="lnr lnr-user"></span>${n.user.id}</a></li>
								<li><a href="#"><span class="lnr lnr-calendar-full"></span>${n.createDate}</a></li>
								<li><a href="#"><span class="lnr lnr-bubble"></span>06
								</a></li>
							</ul>
							<p class="excert">${n.description}</p>
						</div>
					</div>
					 </c:forEach>
				</div>
				
			</div>
			<!-- End popular-post Area -->
			<div class="col-lg-12 ad-widget-wrap mt-30 mb-30">
				<img class="img-fluid" src="/static/images/a1-ad.jpg" alt="">
			</div>
			<div class="latest-post-wrap">

				<h4 class="cat-title">Latest News</h4>
				<c:forEach var="c" items="${listPage}">
					<div class="single-latest-post row align-items-center">
						<div class="col-lg-5 post-left">
							<div class="feature-img relative">
								<div class="overlay overlay-bg"></div>
								<a href="/home/click/${c.id}"><img class="img-fluid"
									src="/static/images/${c.thumbnail}" alt=""></a>
							</div>
							<ul class="tags">
								<li><a href="#">${c.categories.name}</a></li>
							</ul>
						</div>
						<div class="col-lg-7 post-right">
							<a href="image-post.html">
								<h4>${c.title }</h4>
							</a>
							<ul class="meta">
								<li><a href="#"><span class="lnr lnr-user"></span>${c.user.id}</a></li>
								<li><a href="#"><span class="lnr lnr-calendar-full"></span>${c.createDate}</a></li>
								<li><a href="#"><span class="lnr lnr-bubble"></span>06
										Comments</a></li>
							</ul>
							<p class="excert">${c.description}</p>
						</div>
					</div>
				</c:forEach>

			</div>
			<ul class="pager">
				<li><a href="/home/index/0">First</a></li>
				<li><a href="/home/index/${pageNo -1}">Previous</a></li>
				<li><a href="/home/index/${pageNo +1}">Next</a></li>
				<li><a href="/home/index/${lastPageNo}">Last</a></li>
			</ul>

			<div class="col-lg-12 ad-widget-wrap mt-30 mb-30">
				<img class="img-fluid" src="/static/images/banner-ad.jpg" alt="">
			</div>
			<!-- End single-post Area -->
		</div>