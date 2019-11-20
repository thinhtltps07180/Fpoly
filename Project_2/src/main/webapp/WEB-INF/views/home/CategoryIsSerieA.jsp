<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<div class="container no-padding">
	<div class="row">
		<div class="col-lg-8 post-list">
		
			<div class="latest-post-wrap">

				<h4 class="cat-title">Latest News</h4>
				<c:forEach var="c" items="${listSRA}">
					<div class="single-latest-post row align-items-center">
						<div class="col-lg-5 post-left">
							<div class="feature-img relative">
								<div class="overlay overlay-bg"></div>
								<a href="/home/click/${c.id}"><img class="img-fluid"
									src="/static/images/${c.thumbnail}" alt=""></a>
							</div>
							<ul class="tags">
								<li><a href="#">Lifestyle</a></li>
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