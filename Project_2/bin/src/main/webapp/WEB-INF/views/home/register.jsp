<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
}

input[type=text]:focus, input[type=password]:focus {
	outline: none;
}

hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

/* Extra styles for the cancel button */
.cancelbtn {
	padding: 14px 20px;
	background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
	float: left;
	width: 50%;
}

/* Add padding to container elements */
.container id {
	padding: 16px;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
	.cancelbtn, .signupbtn {
		width: 100%;
	}
}

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

<div class="container no-padding">
	<div class="row">
		<div class="col-lg-8 post-list">
			<!-- Start single-post Area -->
			<form:form enctype="multipart/form-data" action="/home/register"
				modelAttribute="form">
				<div class="container id">
					<h1>Sign Up</h1>
					<p>${message}</p>
					<hr>
					<div class="form-group">
						<label for="fname">UserName</label>
						<form:input path="id" type="text" id="fname" name="id"
							placeholder="Your id.." />
						<form:errors path="id" />
					</div>
					<div class="form-group">
						<label for="fname">Password</label>
						<form:input path="password" type="password" id="fname"
							name="password" placeholder="password.." />
						<form:errors path="password" />
					</div>
					<div class="form-group">
						<label for="fname">Email</label>
						<form:input path="email" type="text" id="fname" name="email"
							placeholder="Email.." />
						<form:errors path="email" />
					</div>
					<div class="form-group">
						<input type="file" class="form-input" name="up_photo"
							onchange="openFile(this)" class="form-control"
							placeholder="Photo">
						<form:hidden path="photo" />
						<div id="anh"></div>
					</div>
					<%-- <div class="form-group">

						<form:select path="roles.id">

							<form:options items="${listRole}" itemValue="id" itemLabel="name" />
						</form:select>
						<form:errors path="roles.id" />
					</div>
 --%>
					<p>
						By creating an account you agree to our <a href="#"
							style="color: dodgerblue">Terms & Privacy</a>.
					</p>

					<div class="clearfix">
						<button type="button" class="cancelbtn">Cancel</button>
						<button type="submit" class="signupbtn">Register</button>
						
					</div>
				</div>



			</form:form>
			<!-- End single-post Area -->
		</div>