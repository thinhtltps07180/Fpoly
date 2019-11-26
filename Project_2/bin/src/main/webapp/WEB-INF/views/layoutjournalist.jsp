<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>BLOCKS - Bootstrap Dashboard Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Carlos Alvarez - Alvarez.is">

<link rel="stylesheet" type="text/css"
	href="/static/journalist/bootstrap/css/bootstrap.min.css" />

<link href="/static/journalist/css/main.css" rel="stylesheet">
<link href="/static/journalist/css/font-style.css" rel="stylesheet">
<link href="/static/journalist/css/flexslider.css" rel="stylesheet">

<script type="text/javascript" src="/static/journalist/js/jquery.js"></script>
<script type="text/javascript"
	src="/static/journalist/bootstrap/js/bootstrap.min.js"></script>




<link rel="stylesheet" href="style.css">
<!-- Custom styles for this template-->


<style type="text/css">
body {
	padding-top: 60px;
}

.container-fluid {
	background: white;
	padding-top: 10px;
}

img#logo {
	height: 36px;
}
</style>



<!-- Google Fonts call. Font Used Open Sans & Raleway -->
<link href="http://fonts.googleapis.com/css?family=Raleway:400,300"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet" type="text/css">

</head>
<body>


	<jsp:include page="layout/headerjournalist.jsp" />
	<tiles:insertAttribute name="body" />
	<jsp:include page="layout/footerjournalist.jsp" />






</body>
</html>