<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    

    <!-- Font Icon -->
    <link rel="stylesheet" href="/static/register/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/static/register/css/style.css">
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
			img.onload = function() {
				document.getElementById("anh").appendChild(img);
			}
			img.src = reader.result;
		};
		reader.readAsDataURL(field.files[0]);
	};
</script>

</head>

<body >
	${message}
	<div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form:form id="signup-form" class="signup-form" enctype="multipart/form-data" action="/account/register"
					modelAttribute="form">
                        <h2 class="form-title">Create account</h2>
                        <div class="form-group">         
							<form:input path="id" type="text" class="form-input" name="name" id="name" placeholder="Username" />
							<form:errors path="id" />
                        </div>
                         <div class="form-group">
						<form:input path="password" type="password" class="form-input" name="password" id="password" placeholder="Password" />
						<span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
						<form:errors path="password" />
                        </div>
                         <div class="form-group">         
							<form:input path="email" type="text" class="form-input" name="email" id="email" placeholder="Email" />
							<form:errors path="id" />
                        </div>
                          <div class="form-group">         						
							<input type="file" class="form-input" name="up_photo"
							onchange="openFile(this)" class="form-control" placeholder="Photo">
						<form:hidden path="photo" />
						<div id="anh"></div>
                        </div>            
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Sign up"/>
                        </div>
                    </form:form>
                    <p class="loginhere">
                        Have already an account ? <a href="#" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>







	<script src="/static/register/vendor/jquery/jquery.min.js"></script>
    <script src="/static/register/js/main.js"></script>
</body>

</html>