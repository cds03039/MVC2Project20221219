<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/reset.css">
<style>
@import
	url('https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css')
	;
.fixed_div {
	width: 180px;
	height: 300px;
	background-color: rgba(25, 0, 0, 0.1);
	position: fixed;
	top: 300px;
	padding: 10px;
	box-shadow : 1px 2px 5px 0;
	 border-radius: 5px;
}

.fixed_div p {
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}

.fixed_div li {
	margin: 5px 0;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	box-sizing: border-box;
	padding-bottom: 1px;
	
	float: none;
}

.fixed_div li a {
	text-decoration: none;
	color: black;
}

.fixed_div li a:hover {
	text-decoration: underline;
	color: black;
}
.views{
font-size: 5px;
float: right;
}
.fa-eye{
font-size: 5px;

}
</style>
</head>
<body>
	<div class="fixed_div">
		<p>최근 본 글</p>
		<ul>
			<li>
				<a href="#"> </a><p class="views"><i class="fa fa-eye" aria-hidden="true"></i></p>
			</li>
		</ul>
	</div>
</body>
</html>