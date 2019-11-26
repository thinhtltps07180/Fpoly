<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<
<style>
<!--
.row.justify-content-center {
	padding: 10px 10px 10px 10px;
}

footer.sticky-footer {
	padding-top: 10px;
}

.row.justify-content-center {
	padding-top: 43px;
}

.card {
	width: 50%;
}

.card-header {
	background-color: darkseagreen;
}
-->
</style>
<script>
	function myFunction() {
		Swal.fire({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, update it!'
			}).then((result) => {
			  if (result.value) {
			    Swal.fire(
			      'Update!',
			      'Your file has been update.',
			      'success'
			    ).then(function() {
					$("#form").submit()
				})
			  }
			})
	
	}


</script>

${message }
<div class="container">
	<div class="row justify-content-center">
		<div class="card">
			<div class="card-header">Edit User</div>
			<div class="card-body">
				<form id="form" action="/admin/update" method="post">
					<div class="form-group">
						<label>Username</label> <input name="id" value="${userEdit.id}"
							class="form-control" />

					</div>
					<div class="form-group">
						<label>Password</label> <input name="password"
							value="${userEdit.password}" class="form-control" />

					</div>
					<div class="form-group">
						<label>Email</label> <input name="email" value="${userEdit.email}"
							class="form-control" />
					</div>

					<div class="form-group">

						<input type="hidden" name="photo" value="${userEdit.photo}"
							class="form-control" />
					</div>
					<div class="form-group">
						<label>Role</label> <select name="roles.id">
						<option value="">--Please choose an option--</option>
							<c:forEach var="c" items="${listRole}">		
								<option value="${c.id}">${c.name}</option>
							</c:forEach>
						</select>
					</div>

					<div>
						<button class="btn btn-success" type="button"
							onclick="myFunction()">Update</button>
					</div>
				</form>
			</div>
		</div>