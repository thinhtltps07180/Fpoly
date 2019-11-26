<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<style>
div#buttons {
    padding-top: 10px;
    padding-bottom: 22px;
}
</style>
<h1>Shopping Cart</h1>
<form action="/client/update" method="post">
	<table class="table">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Amount</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p"
				items="${sessionScope['scopedTarget.clientService'].items}">
				<tr>
					<td>${p.id}</td>
					<td>${p.location.name}</td>
					<td>${p.unitPrice}</td>
					<td><input name="${p.id}" value="${p.quantity}" type="number"
						min="1"></td>
					<td>${p.unitPrice*p.quantity}</td>
					<td><a class="btn btn-primary" href="/client/remove/${p.id}">Remove</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div id="buttons">
		<a class="btn btn-primary" href="/client/clear">Clear</a>
	<button class="btn btn-primary">Update</button>
	<a class="btn btn-primary" href="/client/accept">Accept</a>
	</div>

</form>