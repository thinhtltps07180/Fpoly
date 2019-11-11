<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">Edit User</div>
				<div class="card-body">
					<form:form modelAttribute="userEdit" enctype="multipart/form-data" action="/admin/update">
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
</div>