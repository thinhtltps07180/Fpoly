<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!DOCTYPE html>
<script>
	var openFile = function(field) {
		var fieldId = field.getAttribute("data-input-id");
		var reader = new FileReader();
		reader.onload = function() {
			var img = new Image(350, 200);
			img.onload = function() {
				console.log('img: ', img)
				 if(parseInt(fieldId) === 1){
					 var img1 = document.getElementById("1");
					 img1.innerHTML = '';
					 img1.appendChild(img);
				 }
			 	 if(parseInt(fieldId) === 2){
					 document.getElementById("2").appendChild(img);	
					 console.log(x2) 
				 }
			 	if(parseInt(fieldId) === 3){
					 document.getElementById("3").appendChild(img);	
					 console.log(x2) 
				 }
  
					
			}
			img.src = reader.result;
		};
		reader.readAsDataURL(field.files[0]);
	};
</script>



<h1>
	<jsp:include page="../client/info.jsp" />
</h1>

${message }

<hr />
<div class="row">
	<c:forEach var="lct" varStatus="loopCounter" items="${listLct}">
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
		
			<div class="thumbnail">
				<a href="#"><img src="/static/images/${lct.image}"
					class="img-thumbnail " alt=""></a>
				<div class="caption">
					<h3>Name : ${lct.name}</h3>
					<p>UnitPrice : ${lct.unitPrice}</p>
					<form:form enctype="multipart/form-data" action="/client/addBanner"
						modelAttribute="add" method="Post">
						<h2 class="form-title">Chon banner</h2>
						<div class="form-group">
							<form:input path="unitPrice" type="hidden"
								value="${lct.unitPrice}" />
						</div>
						<div class="form-group">
							<form:input path="quantity" type="hidden" value="1" />
						</div>
						<div class="form-group">
							<form:input path="countShow" type="hidden" value="100" />
						</div>
					

						<div class="form-group">
							<input data-input-id="${loopCounter.count}" type="file" class="form-input" name="up_photo"
								onchange="openFile(this)" class="form-control"
								placeholder="Photo">
							<div class="anh" id="${loopCounter.count}"></div>
						</div>
						<div class="form-group">
							<form:select path="location.id">
							
								<form:options items="${listLct}" itemValue="id" itemLabel="name" />
						
							</form:select>
						

						</div>
						<div class="form-group">
							<button class="btn btn-primary" type="submit">Order</button>
						</div>

					</form:form>

			
				</div>


			</div>
			
		</div>
	</c:forEach>
</div>




