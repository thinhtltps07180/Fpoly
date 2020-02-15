<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
img#us {
    width: 206px;
    height: 100px;
}

</style>

	

	<div class="container">

		<!-- FIRST ROW OF BLOCKS -->
		<div class="row">

			<!-- USER PROFILE BLOCK -->
			<div class="col-sm-4 col-lg-4">
				<div class="dash-unit">
					<dtitle>User Profile</dtitle>
					<hr>
					<div class="thumbnail">
						<img id="us" src="/static/images/users/${user.photo}"  class="img-circle">
					</div><!-- /thumbnail -->
					<h1>${user.id}</h1>
					<h3>${user.email}</h3>
					<br>
					<div class="info-user">
						<span aria-hidden="true" class="li_user fs1"></span>
						<span aria-hidden="true" class="li_settings fs1"></span>
						<span aria-hidden="true" class="li_mail fs1"></span>
						<span aria-hidden="true" class="li_key fs1"></span>
					</div>
				</div>
			</div>

			<!-- Row -->
			<div class="col-sm-4 col-lg-4">
				<div class="dash-unit">
					<dtitle>statistical all article</dtitle>
					<hr>
					<div class="thumbnail">
						<a href="/journalist/management"><img src="/static/journalist/images/statistical.png" alt="Marcel Newman"
								class="img-circle plus"></a>
						<h1>statistical all news	</h1>
					</div><!-- /thumbnail -->
					<br>
				</div>
			</div>
			<!--/row -->
			<!-- Row -->
			<div class="col-sm-4 col-lg-4">
				<div class="dash-unit">
					<dtitle>Add new article</dtitle>
					<hr>
					<div class="thumbnail">
						<a href="/journalist/addNewPost"><img src="/static/journalist/images/plus.png" alt="Marcel Newman" class="img-circle plus"></a>
						<h1>Add news post</h1>
					</div><!-- /thumbnail -->
					<br>
				</div>
			</div>
		</div> <!-- /container -->
		