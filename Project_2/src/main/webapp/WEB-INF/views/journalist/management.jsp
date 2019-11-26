<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<link href="/static/journalist/css/table.css" rel="stylesheet">
<div class="container">
	<!-- CONTENT -->
	<div class="row">
		<h4>
			<strong>Data Table</strong>
		</h4>

		<table class="display" id="dt1">
			<thead>
				<tr>

					<th>Title</th>
					<th>Description</th>
					<th>Thumbnail</th>
					<th>Content</th>
					<th>CreateDate</th>
					<th>Categories</th>
					<th>Edit</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${list}">
					<tr class="gradeC">

						<td>${n.title} ${n.user.id}</td>
						<td>${n.description}</td>
						<td><img src="/static/images/news/${n.thumbnail}"  class="img-thumbnail"></td>
						<td>${n.content}</td>
						<td>${n.createDate}</td>
						<td>${n.categories.name}</td>
						<td><a href="/journalist/edit/${n.id}">Edit</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<!--/END SECOND TABLE -->

	</div>
	<!--/span12 -->
</div>
<!-- /row -->
</div>
<!-- /container -->
<br>



<script type="text/javascript"
	src="/static/journalist/js/datatables/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#dt1').dataTable();
	});
</script>
