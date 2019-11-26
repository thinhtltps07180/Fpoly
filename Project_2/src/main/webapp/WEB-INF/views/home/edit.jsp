<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="/static/admin/vendor/jquery/jquery.min.js"></script>
<script src="/static/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/static/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
<style>
p#old-photo {
    font-weight: bold;
    color: red;
}

label#lb {
    font-weight: bold;
    color: black;
}
.card-header {
    font-size: 20px;
    font-weight: bold;
    color: black;
}
img#anh-cu {
	width: 150px;
	height: 100px;
}
.card {
    width: 745px;
}
</style>

<script>
	var openFile = function(field) {
		var reader = new FileReader();
		reader.onload = function() {
			console.log(reader.result);
			var img = new Image(150, 100);
			img.onload = function() {
				 var img1 = document.getElementById("anh");
				 img1.innerHTML = '';
				 img1.appendChild(img);
			}
			img.src = reader.result;
		};
		reader.readAsDataURL(field.files[0]);
	};
</script>





<div class="container no-padding">
	<div class="row">
		<div class="col-lg-8 post-list">
		<h1 id="ms">${message}</h1>
			<div class="row justify-content-center">
				<div class="card">
					<div class="card-header">Edit User</div>
					<div class="card-body">
						<form:form modelAttribute="userEdit" enctype="multipart/form-data"
							action="/home/update">
							<div class="form-group">
								
								<form:input type="hidden" path="id" class="form-control" />
								<form:errors path="id" />
							</div>
							<div class="form-group">
								<label id="lb">Password</label>
								<form:input  path="password" class="form-control" />
								<form:errors path="password" />
							</div>
							<div class="form-group">
								<label id="lb">Email</label>
								<form:input path="email" class="form-control" />
								<form:errors path="email" />
							</div>
							<img id="anh-cu" alt="" src="/static/images/users/${userEdit.photo }">
								<p id="old-photo">Old your photo</p>
							<div class="form-group">
								<label id="lb">Chose your new Photo</label> <input type="file" name="up_photo"
									onchange="openFile(this)" class="form-control">
								<form:hidden path="photo" />
								<div id="anh">
								
								</div>
								
								
							</div>
					
							<div>
								<button class="btn btn-success">Update</button>
							</div>
						</form:form>
					</div>

				</div>
			</div>
		</div>