<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<script src="/static/admin/vendor/jquery/jquery.min.js"></script>
	<script src="/static/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/static/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
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



${message}

<div class="container no-padding">
	<div class="row">
		<div class="col-lg-8 post-list">
			<div class="row justify-content-center">
			<div class="card">
				<div class="card-header">Edit User</div>
				<div class="card-body">
					<form:form modelAttribute="userEdit" enctype="multipart/form-data" action="/home/update">
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
							<label>Email</label>
							<form:input path="email" class="form-control" />
							<form:errors path="email" />
						</div>
						<div class="form-group">
							<label>Photo</label> <input type="file" name="up_photo"
								onchange="openFile(this)" class="form-control">
							<form:hidden path="photo" />
							<div id="anh" ></div>
							<img alt="" src="/static/images/${userEdit.photo }">
						</div>
						<div class="form-group">
							<form:select path="roles.id">
								<form:options items="${listRole}" itemValue="id"
									itemLabel="name" />
							</form:select>
							<form:errors path="roles.id" />
						</div>
						<div>
							<button class="btn btn-success">Register</button>
						</div>
					</form:form>
				</div>

			</div>
		</div>
	</div>








