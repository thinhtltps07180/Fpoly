<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script type="text/javascript" src="/static/ckeditor/ckeditor.js"></script>

<style>
.form-group.area {
    width: 908px;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

span[id*=errors] {
	color: red;
	font-style: italic;
	background-image: url("/static/images/anifire.gif");
	background-repeat: no-repeat;
	padding-left: 25px;
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
			var img = new Image(300,200);
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
		action="/journalist/update">


		<form:input path="id" type="hidden" id="fname" name="id"
			placeholder="Your id.." />
		<form:errors path="id" />


		<form:input type="hidden" path="createDate" id="fname" />


		<form:input type="hidden" path="status" id="fname" />


		<form:input type="hidden" path="countViewer" id="fname" />
		<div class="form-group">
			<label for="fname">Title</label>
			<form:input path="title" type="text" id="fname" name="firstname" />
			<form:errors path="title" />
		</div>
		<div class="form-group">
			<label for="fname">Description</label>
			<form:input path="description" type="text" id="fname"
				name="description" placeholder="description.." />
			<form:errors path="description" />
		</div>
		<div class="form-group">
			<label for="fname">Thumbnail</label> <input type="file"
				class="form-input" name="up_photo" onchange="openFile(this)"
				class="form-control" placeholder="Photo">
			<form:hidden path="thumbnail" />
			<div id="anh"></div>
		</div>
		<div class="form-group">
			<label for="country">Categories</label>
			<form:select path="categories.id">
				<form:options items="${list}" itemValue="id" itemLabel="name" />
			</form:select>
			<form:errors path="categories.id" />
		</div>
		<div class="form-group">
			<label for="fname">Content</label>
			<form:textarea path="content" style= " height: 200px;" id="content" />
			<form:errors path="content" />
		</div>


		<div>
			<button class="btn btn-default" formaction="/journalist/update">Update</button>
			<button class="btn btn-default" formaction="/journalist/delete">Delete</button>
			<button class="btn btn-default" formaction="/journalist/addNewPost">Reset</button>
		</div>
	</form:form>

</div>

	<script type="text/javascript">
	var editor = '';
	$( document ).ready(function() {
		editor = CKEDITOR.replace('content');
	});
</script>

<!-- <script type="text/javascript"
	src="http://js.nicedit.com/nicEdit-latest.js"></script>
<script type="text/javascript">
	//<![CDATA[
	bkLib.onDomLoaded(function() {
		nicEditors.allTextAreas()
	});
	//]]>
</script> -->