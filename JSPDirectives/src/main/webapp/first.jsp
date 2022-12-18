<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.Random" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First Page</title>
</head>
<body>
	<h1>The Random number is: <%
		Random r = new Random();
		int n = r.nextInt(100);
	%>
	<%= n %>
	<%@include file="second.jsp" %>
	</h1>
	<c:set var="name" value="Prem Bansod"></c:set>
	<c:out value="${name}"></c:out>
	<c:if test="${3>2 }">
		<h2>3>2 is true.</h2>
	</c:if>
</body>
</html>