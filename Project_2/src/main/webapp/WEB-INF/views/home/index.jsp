<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
img#bannera3 {
    height: 90px;
    width: 728px;
}
img#top2 {
    height: 192px;
}
</style>
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
						<a href="/home/click/${top1.id}"><img class="img-fluid" src="/static/images/news/${top1.thumbnail}" alt=""></a>
					</div>
					<div class="details">
						<ul class="tags">
							<li><a href="#">${top1.categories.name}</a></li>
						</ul>
						<a href="/home/click/${top1.id}">
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
								<a href="/home/click/${n.id}"><img id ="top2" class="img-fluid" src="/static/images/news/${n.thumbnail}" alt=""></a>
							</div>
							<ul class="tags">
								<li><a href="#">${n.categories.name}</a></li>
							</ul>
						</div>
						<div class="details">
							<a  href="/home/click/${n.id}">
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
			<div  class="a3">
			<c:set var="img" value="${listPuta3.image}" />
			<c:choose>

				<c:when test="${img != null}">
					<c:set var="img" value="${listPuta3.image}" />
				</c:when>

				<c:when test="${img == null}">
					<c:set var="img" value="a1.jpg" />
				</c:when>

				<c:otherwise>
			            No comment sir...
			         </c:otherwise>
			</c:choose>
			<img class="img-fluid" id="bannera3"
				src="/static/images/banner/<c:out value = "${img}"/>"> <img>
		</div>
			<!-- End popular-post Area -->
		
			<div class="latest-post-wrap">
				<h4 class="cat-title">Latest News</h4>
				<c:forEach var="c" items="${listPage}">
					<div class="single-latest-post row align-items-center">
						<div class="col-lg-5 post-left">
							<div class="feature-img relative">
								<div class="overlay overlay-bg"></div>
								<a href="/home/click/${c.id}"><img class="img-fluid"
									src="/static/images/news/${c.thumbnail}" alt=""></a>
							</div>
							<ul class="tags">
								<li><a href="#">${c.categories.name}</a></li>
							</ul>
						</div>
						<div class="col-lg-7 post-right">
							<a href="/home/click/${c.id}	">
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
				<li><a href="/home/index/${lastPageCount}">Last</a></li>
			</ul>

			<div class="col-lg-12 ad-widget-wrap mt-30 mb-30">
				<img class="img-fluid" src="/static/images/news/banner-ad.jpg" alt="">
			</div>
			<!-- End single-post Area -->
		</div>