<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>

<body>
<%
	response.sendRedirect("UserServlet?command=mainFormAction");
%>
</body>
</html>