<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/static/images/fav.png">
<!-- Author Meta -->
<meta name="author" content="colorlib">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Magazine</title>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/static/images/fav.png">
<!-- Author Meta -->
<meta name="author" content="colorlib">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Magazine</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
		CSS
		============================================= -->
<link rel="stylesheet" href="/static/css/linearicons.css">
<link rel="stylesheet" href="/static/css/font-awesome.min.css">
<link rel="stylesheet" href="/static/css/bootstrap.css">
<link rel="stylesheet" href="/static/css/magnific-popup.css">
<link rel="stylesheet" href="/static/css/nice-select.css">
<link rel="stylesheet" href="/static/css/animate.min.css">
<link rel="stylesheet" href="/static/css/owl.carousel.css">
<link rel="stylesheet" href="/static/css/jquery-ui.css">
<link rel="stylesheet" href="/static/css/main.css">
</head>
<body>

	<jsp:include page="layout/headerhome.jsp" />
	<!-- Start latest-post Area -->
	<section class="latest-post-area pb-120">
		<tiles:insertAttribute name="body"/>
		<jsp:include page="layout/sidehome.jsp" />
	</section>
	<!-- End latest-post Area -->
	</div>
	<jsp:include page="layout/foothome.jsp" />






	<script src="/static/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="/static/js/vendor/bootstrap.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="/static/js/easing.min.js"></script>
	<script src="/static/js/hoverIntent.js"></script>
	<script src="/static/js/superfish.min.js"></script>
	<script src="/static/js/jquery.ajaxchimp.min.js"></script>
	<script src="/static/js/jquery.magnific-popup.min.js"></script>
	<script src="/static/js/mn-accordion.js"></script>
	<script src="/static/js/jquery-ui.js"></script>
	<script src="/static/js/jquery.nice-select.min.js"></script>
	<script src="/static/js/owl.carousel.min.js"></script>
	<script src="/static/js/mail-script.js"></script>
	<script src="/static/js/main.js"></script>
</body>

</body>
</html>