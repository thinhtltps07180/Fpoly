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
						<th>ID</th>
						<th>OrderDate</th>
						<th>Amount</th>
						<th>Description</th>
						<th>OrderBy</th>
						<th>OrderDetails</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="c" items="${list}">
						<tr>
							<td>${c.id}</td>
							<td>${c.orderDate}</td>
							<td>${c.amount}</td>
							<td>${c.description}</td>
							<td>${c.user.id}</td>
							<td>
							<a href="/client/detail/${c.id}">Detail</a>
							<button type="button" class="btn btn-info btn-lg"
									data-toggle="modal" data-target="#myModal">Open Order
									Detail</button> <!-- Modal -->
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">OrderDetail</h4>
											</div>
											<div class="modal-body">
												<p>This is order detail.</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div></td>



						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<div class="card-footer small text-muted">Updated yesterday at
		11:59 PM</div>
</div>
