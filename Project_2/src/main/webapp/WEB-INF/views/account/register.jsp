<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<style>
span[id*=errors] {
	color: red;
	font-style: italic;
	background-image: url("/static/images/anifire.gif");
	background-repeat: no-repeat;
	padding-left: 25px;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

input#fname {
	background-color: white;
}

input[type=text], select, textarea {
	width: 80%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container.box {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
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

<div class="container box">
	${message}

	<div class="container">
		<form:form enctype="multipart/form-data" action="/account/register"
			modelAttribute="form">
			<h2 class="form-title">Create New Post</h2>
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
				<form:input path="email" type="password" id="fname" name="email"
					placeholder="Email.." />
				<form:errors path="email" />
			</div>
			<div class="form-group">
				<input type="file" class="form-input" name="up_photo"
					onchange="openFile(this)" class="form-control" placeholder="Photo">
				<form:hidden path="photo" />
				<div id="anh"></div>
			</div>
			<div class="form-group">

<%-- 				<form:select path="roles.id">

					<form:options items="${listRole}" itemValue="id" itemLabel="name" />
				</form:select>
				<form:errors path="roles.id" />
			</div> --%>
			<div class="form-group">
				<input type="submit" name="submit" id="submit" class="form-submit"
					value="Post" />
			</div>

		</form:form>


	</div>

</div>




<script type="text/javascript"
	src="http://js.nicedit.com/nicEdit-latest.js"></script>
<script type="text/javascript">
	//<![CDATA[
	bkLib.onDomLoaded(function() {
		nicEditors.allTextAreas()
	});
	//]]>
</script>