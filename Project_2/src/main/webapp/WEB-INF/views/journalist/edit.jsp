<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<style>
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
	width: 100%;
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




<div class="container box">

	<h3>Edit Form</h3>
	<h1>${message}</h1>
	<form:form modelAttribute="form" enctype="multipart/form-data"
		action="/journalist/addNewPost">

		<label for="fname">Id</label>
		<form:input path="id" type="text" id="fname" name="id"
			placeholder="Your id.." />
		<form:errors path="id" />

		<label for="fname">Title</label>
		<form:input path="title" type="text" id="fname" name="firstname"
			placeholder="Your name.." />
		<form:errors path="title" />

		<label for="fname">Description</label>
		<form:input path="description" type="text" id="fname"
			name="description" placeholder="description.." />
		<form:errors path="description" />


		<label for="fname">Thumbnail</label>
		<input type="file" class="form-input" name="up_photo"
			onchange="openFile(this)" class="form-control" placeholder="Photo">
		<form:hidden path="thumbnail" />
		<div id="anh"></div>


		<label for="country">Categories</label>
		<form:select path="categories.id">
			<form:options items="${list}" itemValue="id" itemLabel="name" />
		</form:select>
		<form:errors path="categories.id" />

		<label for="fname">Content</label>
		<form:textarea path="content" style="width: 100%; height: 200px;" />



		<div>
			<button class="btn btn-default" formaction="/journalist/update">Update</button>
			<button class="btn btn-default" formaction="/journalist/delete">Delete</button>
			<button class="btn btn-default" formaction="/journalist/addNewPost">Reset</button>
		</div>
	</form:form>

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
