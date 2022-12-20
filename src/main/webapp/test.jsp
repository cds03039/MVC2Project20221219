<%@page import="com.project.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	UsersDAO dao = UsersDAO.getInstance();
	dao.selectAll();
%>
<body>

</body>
</html>