<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.2.3/firebase.js"></script>
<script>
	// Your web app's Firebase configuration
	var firebaseConfig = {
		apiKey : "AIzaSyDB411qvOhcf7qNgYkTorWcSiqKdEbJWiE",
		authDomain : "project2-3b884.firebaseapp.com",
		databaseURL : "https://project2-3b884.firebaseio.com",
		projectId : "project2-3b884",
		storageBucket : "project2-3b884.appspot.com",
		messagingSenderId : "651041813286",
		appId : "1:651041813286:web:9da62be3f621508f4b07e7",
		measurementId : "G-GE3J6R6ZD3"
	};
	// Initialize Firebase
	firebase.initializeApp(firebaseConfig);
</script>


<style>
.card-inner {
	margin-left: 4rem;
}

.comment {
	min-height: 200px;
	border: 1px dotted red;
	border-radius: 5px;
	margin: 5px;
	padding: 5px;
}

li.ng-binding {
	text-align: left;
	padding: 5px;
}
</style>
<div class="container no-padding">
	<div class="row">
		<div class="col-lg-8 post-list">
			<!-- Start single-post Area -->
			<div class="single-post-wrap">
				<div class="content-wrap">
					<ul class="tags">
						<li><a href="#">${news.categories.name}</a></li>
					</ul>
					<a href="#">
						<h3>${news.title}</h3>
					</a>
					<ul class="meta pb-20">
						<li><a href="#"><span class="lnr lnr-user"></span>${news.user.id}</a></li>
						<li><a href="#"><span class="lnr lnr-calendar-full"></span>${news.createDate}</a></li>
						<li><a href="#"><span class="lnr lnr-bubble"></span>06</a></li>
					</ul>
					<p>${news.description}</p>

					<blockquote>${news.content}</blockquote>

					<div class="navigation-wrap justify-content-between d-flex">
						<a class="prev" href="#"><span class="lnr lnr-arrow-left"></span>Prev
							Post</a> <a class="next" href="#">Next Post<span
							class="lnr lnr-arrow-right"></span></a>
					</div>
				</div>


				<div class="comment-form">
					<div ng-app="app" ng-controller="ctrl">
						<h4>Post Comment</h4>
						<div class="comment">
							<ul>
								<li ng-repeat="(key , value) in messages">

									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-md-2">
													<img src="https://image.ibb.co/jw55Ex/def_face.jpg"
														class="img img-rounded img-fluid" />
													<p class="text-secondary text-center">{{value.posted|date}}</p>
												</div>
												<div class="col-md-10">
													<p>
														<a class="float-left"
															href="https://maniruzzaman-akash.blogspot.com/p/contact.html"><strong>{{value.author}}</strong></a>
														<span class="float-right"><i
															class="text-warning fa fa-star"></i></span> <span
															class="float-right"><i
															class="text-warning fa fa-star"></i></span> <span
															class="float-right"><i
															class="text-warning fa fa-star"></i></span> <span
															class="float-right"><i
															class="text-warning fa fa-star"></i></span>

													</p>
													<div class="clearfix"></div>
													<p class="float-left">{{value.text}}.</p>
													<p>
														<a ng-click="reply(key)" href=""
															class="float-right btn btn-outline-primary ml-2"> <i
															class="fa fa-reply"></i> Reply
														</a>
													</p>
												</div>
											</div>

										</div>

										<ul>
											<li ng-repeat="(key , value) in value.replies">
												<div class="card card-inner">
													<div class="card-body">
														<div class="row">
															<div class="col-md-2">
																<img src="https://image.ibb.co/jw55Ex/def_face.jpg"
																	class="img img-rounded img-fluid" />
																<p class="text-secondary text-center">{{value.replied|date}}</p>
															</div>
															<div class="col-md-10">
																<p>
																	<a class="float-left"
																		href="https://maniruzzaman-akash.blogspot.com/p/contact.html"><strong>{{value.authorrep}}</strong></a>
																</p>
																<div class="clearfix"></div>
													<p class="float-left">{{value.text}}.</p>
															
															</div>
														</div>
													</div>
												</div>

											</li>
										</ul>
								</li>




							</ul>
						</div>
						<input ng-model="message" class="form-control"
							placeholder="Comments" />
						<button class="primary-btn text-uppercase" ng-click="send()">Send</button>
					</div>
				</div>
			</div>
			<!--  -->









			<!-- End single-post Area -->
		</div>

		<script>
			app = angular.module("app", []);
			app.controller("ctrl", function($scope) {
				$db = firebase.database();
				$scope.reply = function(key) {
					var text = prompt("Nhap reply");
					var path = 'comments/${news.id}/' + key + '/replies/'
							+ Date.now();
					$db.ref(path).update({
						text : text,
						replied : Date.now(),
						authorrep : '${user.id}'
					});
				}
				var path = "comments/${news.id}/" + Date.now();
				$scope.send = function() {

					$db.ref(path).update({
						text : $scope.message,
						posted : Date.now(),
						author : '${user.id}'
					}, function(error) {
						if (error) {
							alert("Error")
						}
					})

				}

				var path2 = 'comments/${news.id}/';
				$db.ref(path2).on('value', function(response) {
					$scope.messages = response.val();
					$scope.$digest();
				})
			})
		</script>