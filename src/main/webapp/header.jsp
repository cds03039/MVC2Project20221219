<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="css/reset.css">
<style>
@import
	url('https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css')
	;

* {
	margin: 0;
}

#header_container {
	height: 100px;
	background: linear-gradient(45deg, Violet, #729BFF);
}

#header_container #header_inner {
	width: 1200px;
	height: 100%;
	
	margin: 0 auto;
	position: relative;
	
	
}

#header_container #header_inner input[id="menuicon"] {
	display: none;
}

#header_container #header_inner input[id="menuicon"]+label {
	display: block;
	width: 30px;
	height: 25px;
	position: relative;
	cursor: pointer;
	transform: translateY(45px) translateX(20px);
}

#header_container #header_inner input[id="menuicon"]+label span {
	display: block;
	position: absolute;
	width: 100%;
	height: 3px;
	border-radius: 30px;
	background-color: #222;
	transition: all 0.35s;
}

#header_container #header_inner input[id="menuicon"]+label span:nth-child(1)
	{
	top: 0;
}

#header_container #header_inner input[id="menuicon"]+label span:nth-child(2)
	{
	top: 50%;
	transform: translateY(-50%);
}

#header_container #header_inner input[id="menuicon"]+label span:nth-child(3)
	{
	bottom: 0;
}

#header_container #header_inner input[id="menuicon"]:checked+label {
	z-index: 2;
}

#header_container #header_inner input[id="menuicon"]:checked+label span
	{
	background-color: #fff;
}

#header_container #header_inner input[id="menuicon"]:checked+label span:nth-child(1)
	{
	top: 50%;
	transform: translateY(-50%) rotate(45deg);
}

#header_container #header_inner input[id="menuicon"]:checked+label span:nth-child(2)
	{
	opacity: 0;
}

#header_container #header_inner input[id="menuicon"]:checked+label span:nth-child(3)
	{
	bottom: 50%;
	transform: translateY(50%) rotate(-45deg);
}

#header_container #header_inner .sidebar {
	width: 300px;
	height: 800px;
	background: linear-gradient(135deg, Violet, #729BFF);
	
	position: absolute;
	top: 100px;
	left: -300px;
	opacity: 0;
	z-index: 1;
	transition: all 0.35s;
	border-bottom-right-radius: 2em;
}

#header_container #header_inner input[id="menuicon"]:checked+label+.sidebar
	{
	left: 0;
	opacity: 0.9;
	z-index: 99;
}

#header_container #header_inner input[id="loginOrJoin"] {
	display: none;
}

#header_container #header_inner input[id="loginOrJoin"]+label {
	position: absolute;
	top: 50%;
	right: 0px;
	transform: translateY(-50%);
	font-size: 40px;
	margin-right: 20px;
	color: black;
	cursor: pointer;
}

#header_container #header_inner input[id="loginOrJoin"]:checked+label+.hidden
	{
	display: block;
	z-index: 2;
}

#header_container #header_inner .hidden {
	width: 300px;
	height: 120px;
	background-color: white;
	border: 1px solid black;
	border-radius: 5px;
	position: absolute;
	right: 0;
	top: 80px;
	display: none;
}

#header_container #header_inner .hidden div {
	margin: 0 auto;
	height: 30px;
	margin-top: 20px;
	text-align: center;
	position: relative;
	line-height: 30px;
	font-size: 20px;
}

#header_container #header_inner .hidden div a {
	text-decoration: none;
	color: black;
	background-color: yellow;
	padding: 5px;
}

#header_container #header_inner .searchForm {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	right: 100px;
	border-bottom: 2px solid white;
}

#header_container #header_inner .searchForm input[type="text"] {
	height: 40px;
	width: 50px;
	color: white;
	text-align: center;
	border: none;
	background: transparent;
	font-size: 17px;
	transition: all 0.3s;
}

#header_container #header_inner .searchForm input[type="text"]:focus {
	outline: none;
	width: 150px;
	background-color: rgba(0, 0, 0, 0.1);
	border-radius: 2px;
}

#header_container #header_inner .searchForm input[type="text"]::placeholder
	{
	color: white;
}

#header_container #header_inner .sidebar li {
	text-align: center;
	line-height: 2.5;
	margin: 30px auto;
	font-size: 20px;
	height: 50px;
	width: 250px;
	border-radius: 10px;
}

#header_container #header_inner .sidebar li a {
	text-decoration: none;
	color: white;
	font-weight : bold;
	display: inline-block;
	width: 250px;
}

#header_container #header_inner .sidebar li:hover {
	background-color: rgba(0, 0, 0, 0.3);
	transition: all 0.2s;
	color: white;
}

#header_container #header_inner .logo {
	font-size: 80px;
	color: black;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
<script>
	function searchData() {

	}
</script>
</head>
<body>

	<div id="header_container">
		<div id="header_inner">
			<input type="checkbox" id="menuicon"> <label for="menuicon">
				<span></span> <span></span> <span></span>
			</label>
		
			<div class="sidebar">
				<ul>
					<li><a href="index.jsp">전체글보기</a></li>
					<li><a href="BoardServlet?command=board_list&category=sports">운동게시판</a></li>
					<li><a href="BoardServlet?command=board_list&category=photo">사진게시판</a></li>
					<li><a href="BoardServlet?command=board_list&category=game">게임게시판</a></li>
					<li><a href="BoardServlet?command=board_list&category=himedia">하이미디어학원게시판</a></li>
					<li><a href="BoardServlet?command=board_list&category=movie">영화게시판</a></li>
					<c:if test="${loginUser.grade == 0 || loginUser.grade == 1 }">
					<li><a href="BoardServlet?command=member_list">회원관리/건의</a></li>
					<li><a href="BoardServlet?command=chart_form">통계</a></li>
					</c:if>
				</ul>
			</div>
			
			<a href="index.jsp" class="logo"> <img src="images/logo.png" alt="My Image"></a>
			<form action="" class="searchForm">
				<div>
					<span><i class="fa fa-search" aria-hidden="true"></i></span> <input
						type="text" placeholder="검색" onfocus="this.placeholder=''"
						onblur="this.placeholder='검색'"
						onkeypress="if( event.keyCode == 13 ){searchData();}">
				</div>
			</form>
			<input type="checkbox" id="loginOrJoin"> <label
				for="loginOrJoin"> <img src="images/user.png" alt="My Image">
			</label>
			<div class="hidden">

				<div>
					<c:if test="${loginUser!=null }">
						<a href="UserServlet?command=logoutAction">로그아웃</a>
					</c:if>
					<c:if test="${loginUser==null }">
						<a href="UserServlet?command=loginFormAction">로그인</a>
					</c:if>
				</div>
					<c:if test="${loginUser.grade == 0 || loginUser.grade == 1 || loginUser.grade == 2 }">
						<div>
							<a href="UserServlet?command=myPageForm&email=${loginUser.email }">마이페이지</a>
						</div>
					</c:if>
				<c:if test="${loginUser.grade != 0 && loginUser.grade != 1 && loginUser.grade != 2 }">
					<div>
						<a href="UserServlet?command=loginFormAction">회원가입</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>