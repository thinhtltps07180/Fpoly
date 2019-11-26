<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<!-- <script>
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
</script> -->


	
	<h1>
		<jsp:include page="../client/info.jsp"/>
	</h1>
	<hr/>
	<div class="row">
	<c:forEach var="c" items="${list}">
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
			<div class="thumbnail">
				<a href="#"><img src="/static/images/${c.image}" class="img-thumbnail " alt=""></a>
				<div class="caption">
					<h3>Name : ${c.name}</h3>
					<p>UnitPrice :  ${c.unitPrice} </p>
				
					<p>
					
						<a href="/client/add/${c.id}" class="btn btn-primary">BUY</a>
					</p>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	


