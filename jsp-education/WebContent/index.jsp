<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/index.css">
	<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";	
	%>
</head>
<body>
	<%@include file="static/header.jsp" %>
	<%@include file="static/nav.jsp" %>
	
	<%
		switch(section) {
		case "insert" : %> <%@include file="page/insert.jsp" %> <%
				break;
		case "insert_sales" : %> <%@include file="page/insert_sales.jsp" %> <%
				break;
		case "insert_shop" : %> <%@include file="page/insert_shop.jsp" %> <%
				break;
		case "select" : %> <%@include file="page/select.jsp" %> <%
				break;
		case "select_sales" : %> <%@include file="page/select_sales.jsp" %> <%
				break;
		case "select_sale_by_shop" : %> <%@include file="page/select_sale_by_shop.jsp" %> <%
				break;
		case "select_sale_by_pizza" : %> <%@include file="page/select_sale_by_pizza.jsp" %> <%
				break;
		default : %> <%@include file="static/index.jsp" %>
	<%	
		}
	%>
	
	<%@include file="static/footer.jsp" %>
</body>
</html>