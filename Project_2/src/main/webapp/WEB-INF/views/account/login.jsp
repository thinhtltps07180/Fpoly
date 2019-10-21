<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
</head>
<body>
	${message}
	<form method="post" action="/account/login">
		<div>
			<label>Username</label>
			<input name="id">
		</div>
		<div>
			<label>Password</label>
			<input name="password">
		</div>
		<div>
			<button>Login</button>
		</div>
	</form>
</body>
</html>