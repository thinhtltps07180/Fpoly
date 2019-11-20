<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<div id="content-wrapper">

	<div class="container-fluid">

		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
			<li class="breadcrumb-item active">Tables</li>
		</ol>

		<!-- DataTables Example -->
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
								<th>Id</th>
								<th>Email</th>
								<th>Role</th>
								<th>Edit</th>
							

							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Email</th>
								<th>Role</th>
								<th>Edit</th>
							
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="c" items="${list}">
								<tr>

									<td>${c.id}</td>
									<td>${c.email}</td>
									<td>${c.roles.name}</td>
									<td><a href="/admin/edit/${c.id}">Edit</a></td>
<%-- 									<td><select>
											<c:forEach var="r" items="${listRole}">
												<option>${r.name}</option>
											</c:forEach>
									</select></td>
									<td><a class="btn btn-primary" href="/admin/update/${c.id}">Update</a></td>
								</tr> --%>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card-footer small text-muted">Updated yesterday at
				11:59 PM</div>
		</div>

		<p class="small text-center text-muted my-5">
			<em>More table examples coming soon...</em>
		</p>

	</div>
	<!-- /.container-fluid -->

	<!-- Sticky Footer -->
	<footer class="sticky-footer">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright © Your Website 2019</span>
			</div>
		</div>
	</footer>

</div>
<!-- /.content-wrapper -->


<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>
