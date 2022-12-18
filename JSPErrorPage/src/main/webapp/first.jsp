<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
	<%!
		int a = 10;
		int b = 0;
	%>
	<%
		int div = a/b;
	%>
	<h1>Division = <%= div %></h1>
</body>
</html>