<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First JSP</title>
</head>
<body>
	<%!
		int a = 50;
		int b = 20;
		String name = "Prem Bansod";
		public int doSum(){
			return a+b;
		}
		public String reverse(){
			StringBuilder str = new StringBuilder(name);
			return str.reverse().toString();
		}
	%>
	<%
		out.println(a);
		out.println("<br>");
		out.println("Sum = " + doSum());
	%>
	<h1>Sum is = <%= doSum()%></h1>
	<h1>Reverse is = <%= reverse()%></h1>
</body>
</html>