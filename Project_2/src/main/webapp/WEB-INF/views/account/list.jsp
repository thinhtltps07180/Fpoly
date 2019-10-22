<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>List users</title>
</head>
<body>
	<c:forEach var="c" items="${list}">
		<ul>
			<li>${c.id}</li>
			<li>${c.email}</li>
			<li><a href="/account/edit/${c.id}">Edit</a></li>
		</ul>
	</c:forEach>
</body>
</html>