<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>

	
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
	


