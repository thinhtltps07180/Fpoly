<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<style>
<!--
img#bannera2 {
    height: 250px;
    width: 300px;
}
img#post-lists {
	height: 80px;
	width: 100px;
}

h6.title {
	font-size: 14px;
	font-weight: 600;
}
-->
</style>
<div class="col-lg-4">
	<div class="sidebars-area ">
		<div class="single-sidebar-widget editors-pick-widget">
			<h6 class="title">Top Viewer</h6>
			<div class="editors-pick-post">
				<div class="feature-img-wrap relative">
					<div class="feature-img relative">
						<div class="overlay overlay-bg"></div>
						<a href="/home/click/${top1Viewer.id}"><img class="img-fluid"
							src="/static/images/news/${top1Viewer.thumbnail}" alt=""></a>
					</div>
					<ul class="tags">
						<li><a href="#">${top1Viewer.categories.name}</a></li>
					</ul>
				</div>
				<div class="details">
					<a href="/home/click/${top1Viewer.id}">
						<h4 class="mt-20">${top1Viewer.title}</h4>
					</a>
					<ul class="meta">
						<li><a href="#"><span class="lnr lnr-user"></span>${top1Viewer.user.id}</a></li>
						<li><a href="#"><span class="lnr lnr-calendar-full"></span>${top1Viewer.createDate}</a></li>
						<li><a href="#"><span class="fa fa-eye"
								aria-hidden="true"></span> ${top1Viewer.countViewer}</a></li>
					</ul>
					<p class="excert">${top1Viewer.description}</p>
				</div>
				<div class="post-lists">
					<c:forEach var="n" items="${listCountV}">
						<div class="single-post d-flex flex-row">
							<div class="thumb">
								<img id="post-lists" src="/static/images/news/${n.thumbnail}"
									alt="">
							</div>
							<div class="detail">
								<a href="/home/click/${n.id}"><h6>${n.title}</h6></a>
								<ul class="meta">
									<li><a href="#"><span class="lnr lnr-calendar-full"></span>${n.user.id}</a></li>
									<li><a href="#"><span class="fa fa-eye"
											aria-hidden="true"></span> ${n.countViewer}</a></li>
								</ul>
							</div>

						</div>
					</c:forEach>

				</div>
			</div>
		</div>
		<div  class="single-sidebar-widget ads-widget">
			<c:set var="img" value="${listPuta2.image}" />
			<c:choose>

				<c:when test="${img != null}">
					<c:set var="img" value="${listPuta2.image}" />
				</c:when>

				<c:when test="${img == null}">
					<c:set var="img" value="a2.jpg" />
				</c:when>

				<c:otherwise>
			            No comment sir...
			         </c:otherwise>
			</c:choose>
			<img class="img-fluid" id="bannera2"
				src="/static/images/banner/<c:out value = "${img}"/>"> <img>
		</div>
		<div class="single-sidebar-widget newsletter-widget">
			<h6 class="title">Newsletter</h6>
			<p>Here, I focus on a range of items andfeatures that we use in
				life without giving them a second thought.</p>
			<div class="form-group d-flex flex-row">
				<div class="col-autos">
					<div class="input-group">
						<input class="form-control" placeholder="Email Address"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Email Address'" type="text">
					</div>
				</div>
				<a href="#" class="bbtns">Subcribe</a>
			</div>
			<p>You can unsubscribe us at any time</p>
		</div>

		<div class="single-sidebar-widget social-network-widget">
			<h6 class="title">Social Networks</h6>
			<ul class="social-list">
				<li class="d-flex justify-content-between align-items-center fb">
					<div class="icons d-flex flex-row align-items-center">
						<i class="fa fa-facebook" aria-hidden="true"></i>
						<p>983 Likes</p>
					</div> <a href="#">Like our page</a>
				</li>
				<li class="d-flex justify-content-between align-items-center tw">
					<div class="icons d-flex flex-row align-items-center">
						<i class="fa fa-twitter" aria-hidden="true"></i>
						<p>983 Followers</p>
					</div> <a href="#">Follow Us</a>
				</li>
				<li class="d-flex justify-content-between align-items-center yt">
					<div class="icons d-flex flex-row align-items-center">
						<i class="fa fa-youtube-play" aria-hidden="true"></i>
						<p>983 Subscriber</p>
					</div> <a href="#">Subscribe</a>
				</li>
				<li class="d-flex justify-content-between align-items-center rs">
					<div class="icons d-flex flex-row align-items-center">
						<i class="fa fa-rss" aria-hidden="true"></i>
						<p>983 Subscribe</p>
					</div> <a href="#">Subscribe</a>
				</li>
			</ul>
		</div>
	</div>
</div>
</div>
</div>