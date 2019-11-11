<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Small Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="/static/client/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/static/client/css/small-business.css" rel="stylesheet">


<!------ Include the above in your HEAD tag ---------->

<style type="text/css">
img.img-thumbnail {
	height: 200px;
}
</style>

</head>
<body class="container">

	<jsp:include page="layout/headerclient.jsp" />
	<tiles:insertAttribute name="body" />
	<jsp:include page="layout/footerclient.jsp" />


	<!-- Bootstrap core JavaScript -->
	<script src="/static/client/vendor/jquery/jquery.min.js"></script>
	<script
		src="/static/client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>