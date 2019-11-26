<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> Data Table Example
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						
						<th>Location</th>
						<th>UnitPrice</th>
						<th>Quantity</th>
						<th>Total</th>
						<th>OrderDate</th>
						<th>CountShow</th>
						<th>Status</th>
						
					</tr>
				</thead>

				<tbody>
					<c:forEach var="ldt" items="${listDetail}">
						<tr>
							
							<td>${ldt.product.location.name}</td>
							<td>${ldt.product.location.unitPrice}</td>
							<td>${ldt.quantity}</td>
							<td>${ldt.unitPrice}</td>
							<td>${ldt.order.orderDate}</td>
							<td>${ldt.countShow}</td>
							<td>${ldt.status}</td>
							
							<td>
							<a href="/client/detail/${ldt.id}">Detail</a>
							



						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<div class="card-footer small text-muted">Updated yesterday at
		11:59 PM</div>
</div>
