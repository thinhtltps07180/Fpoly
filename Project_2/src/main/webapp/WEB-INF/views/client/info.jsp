<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
${sessionScope['scopedTarget.clientService'].count} items
x
${sessionScope['scopedTarget.clientService'].amount} USD

<a href="/client/view">View Cart</a>
