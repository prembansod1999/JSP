<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page 2</title>
</head>
<body>
	<h1>This is Page Two</h1>
	<%
		response.sendRedirect("page3.jsp");
		//response.sendRedirect("https://www.google.com");
	%>
</body>
</html>