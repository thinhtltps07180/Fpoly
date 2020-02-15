<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<script type="text/javascript" src="/static/ckeditor/ckeditor.js"></script>


<style>
.form-group.area {
    width: 908px;
}

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
			var img = new Image(300,200);
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
		<form:form enctype="multipart/form-data" action="/journalist/addNewPost"
			modelAttribute="add" name="myform">
			<h2 class="form-title">Create New Post</h2>
			<div class="form-group">
				<label for="fname">Title</label>
				<form:input path="title" type="text" id="fname" name="firstname"
					placeholder="Your name.." />
				<form:errors path="title" />
			</div>
			<div class="form-group">
				<label for="fname">Description</label>
				<form:input path="description" type="text" id="fname" name="description"
					placeholder="description.." />
				<form:errors path="description" />
			</div>
			<div class="form-group">
				<input type="file" class="form-input" name="up_photo"
					onchange="openFile(this)" class="form-control" placeholder="Photo">
				<form:hidden path="thumbnail" />
				<div id="anh"></div>
			</div>
			<div class="form-group">	
				<form:select path="categories.id"  >
				<form:option value=""  label="--Please Select" ></form:option>
				<!-- <option selected="selected" value="">--Please Select</option> -->
				<form:options items="${list}" itemValue="id" itemLabel="name"  />
				</form:select>
				
				<form:errors path="categories.id" />
			</div>
			<div class="form-group area">
				<form:textarea path="content" style= " height: 200px;" id="content" />
				<form:errors path="content" />
			</div>
			<div class="form-group">
				<input type="submit" name="submit" id="submit" class="form-submit"
					value="Post" />
			</div>

		</form:form>


	</div>

	</div>
	
	<script type="text/javascript">
	var editor = '';
	$( document ).ready(function() {
		editor = CKEDITOR.replace('content');
	});
</script>




<!-- 	<script type="text/javascript"
		src="http://js.nicedit.com/nicEdit-latest.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		bkLib.onDomLoaded(function() {
			nicEditors.allTextAreas()
		});
		//]]>
	</script> -->
