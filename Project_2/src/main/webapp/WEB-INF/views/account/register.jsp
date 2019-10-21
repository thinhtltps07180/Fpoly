<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
<style>
span[id*=errors] {
	color: red;
	font-style: italic;
	background-image: url("/static/images/anifire.gif");
	background-repeat: no-repeat;
	padding-left: 25px;
}
</style>
<script>
	var openFile = function(field) {
		var reader = new FileReader();
		reader.onload = function() {
			console.log(reader.result);
			var img = new Image();
			img.onload = function(){
				document.getElementById("anh").appendChild(img);
			}
			img.src = reader.result;
		};
		reader.readAsDataURL(field.files[0]);
	};
</script>

</head>
<body class="container">
	${message}
	<form:form enctype="multipart/form-data" action="/account/register"
		modelAttribute="form">
		<div class="form-group">
			<label>Username</label>
			<form:input path="id" class="form-control" />
			<form:errors path="id" />
		</div>
		<div class="form-group">
			<label>Password</label>
			<form:input path="password" class="form-control" />
			<form:errors path="password" />
		</div>
		<div class="form-group">
			<label>Fullname</label>
			<form:input path="fullname" class="form-control" />
			<form:errors path="fullname" />
		</div>
		<div class="form-group">
			<label>Email</label>
			<form:input path="email" class="form-control" />
			<form:errors path="email" />
		</div>
		<div class="form-group">
			<label>Photo</label> 
			<input type="file" name="up_photo" onchange="openFile(this)"
				class="form-control">
			<form:hidden path="photo" />
		</div>
		<div>
			<button class="btn btn-success">Register</button>
		</div>
	</form:form>
	<div id="anh"></div>
</body>
</html>