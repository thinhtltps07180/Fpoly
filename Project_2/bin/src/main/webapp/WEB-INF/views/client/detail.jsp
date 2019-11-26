<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<h1>Product Detail</h1>
<ul>
	<c:forEach var="c" items="${list}">
		<li>Id: ${c.id}</li>
		<li>unitPrice :${c.unitPrice}</li>
		<li>quantity :${c.quantity}</li>
		<li>countShow :${c.countShow}</li>
		<li>countShow :${c.product.name}</li>
	</c:forEach>
</ul>
