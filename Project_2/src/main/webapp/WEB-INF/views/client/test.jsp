<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
 
 <ul>
	<c:forEach var="c" items="${list}">
		<li>${c.id}</li>
		<li>${c.unitPrice}</li>
		<li>${c.quantity}</li>
		<li>${c.countShow}</li>
		<li>${c.product.id}</li>
		<li>${c.product.image}</li>
	</c:forEach>
</ul>	