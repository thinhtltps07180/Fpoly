<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>



${message}

<div class="container no-padding">
	<div class="row">
		<div class="col-lg-8 post-list">
			<div class="card card-login mx-auto mt-5">
				<div class="card-header">Login</div>
				<div class="card-body">
					<form method="post" action="/home/login">
						<div class="form-group">
							<div class="form-label-group">
								<input id="inputUsername" name="id" class="form-control"
									placeholder="Your Id" required="required" autofocus="autofocus">
								<label for="inputUsername">UserName</label>
							</div>
						</div>
						<div class="form-group">
							<div class="form-label-group">
								<input type="password" id="inputPassword" name="password"
									class="form-control" placeholder="Password" required="required">
								<label for="inputPassword">Password</label>
							</div>
						</div>
						<div class="form-group">
							<div class="checkbox">
								<label> <input type="checkbox" value="remember-me">
									Remember Password
								</label>
							</div>
						</div>

						<button class="btn btn-primary btn-block">Login</button>
					</form>
					<div class="text-center">
						<a class="d-block small mt-3" href="register.html">Register an
							Account</a> <a class="d-block small" href="forgot-password.html">Forgot
							Password?</a>
					</div>
				</div>
		
		</div>
	</div>





	<!-- Bootstrap core JavaScript-->
	<script src="/static/admin/vendor/jquery/jquery.min.js"></script>
	<script src="/static/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/static/admin/vendor/jquery-easing/jquery.easing.min.js"></script>