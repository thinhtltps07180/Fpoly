<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> Data Table Orders</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						
						<th>OrderDate</th>
						<th>Amount</th>
						<th>OrderBy</th>
						
						<th>OrderDetails</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="ldt" items="${listDetailByUser}">
						<tr>
							
							<td>${ldt.orderDate}</td>
							<td>${ldt.amount}</td>
							<td>${ldt.user.id}</td>
							
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
