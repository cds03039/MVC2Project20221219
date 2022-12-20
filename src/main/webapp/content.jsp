<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/reset.css">
<title>Document</title>
<style>
@import	url('https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');

* {
	padding: 0;
	margin: 0;
}
body{
	background-color: lightgray;
}

a {
	text-decoration: none;
	color: black;
}

.content_wrap {
	width: 1200px;
	display: flow-root;
	margin: 0 auto;
	position: relative;
	
}

.content_wrap .content {
	width: 980px;
	float: left;
	
	
}

.content_wrap .content_form {
	width: 490px;
	height: 333px;
	background-color: white;
	float: left;
	border-bottom: 1px dotted black;
	box-sizing: border-box;
	padding: 10px;

}

.content_form:nth-last-child(1), .content_form:nth-last-child(2) {
	border-bottom: 0px;
}

.content_wrap .content_form:nth-child(odd) {
	border-right: 1px dotted black;
}

.content_wrap .content_form .list_title {
	display: block;
	font-size: 20px;
	margin-bottom: 5px;
}

.content_wrap .content_form .list_title span {
	border-bottom: 1px solid lightgray;
}

.content_wrap .content_form .list_title span:nth-child(2) {
	float: right;
	font-size: 20px;
	border: none;
}

.content_wrap .content_form .title {
	display: block;
	box-sizing: border-box;
	font-size: 14px;
	width: 100%;
	margin: 12px 0;
	padding-bottom: 1px;
}

.content_wrap .content_form .title:hover span:nth-child(1) {
	font-weight: bold;
}

.content_wrap .content_form .title span:nth-child(1) {
	width: 200px;
	height: 14px;
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.content_wrap .content_form .title span:nth-child(2) {
	float: right;
	border: 1px solid black;
	box-sizing: border-box;
	border-radius: 5px;
	padding: 1px 5px;
	font-size: 11px;
	background-color: black;
	color: white;
	height: 100%;
}

.content_wrap .side_fixed_div {
	width: 200px;
	float: right;
	height: 1000px;
}
</style>
</head>
<body>

	<div class="content_wrap">
		<div class="content">
			<div class="content_form">
				<a href="BoardServlet?command=board_list" class="list_title"> 
				<span>베스트 게시판</span><span><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
				</a>
				<div>
					<a href="#" class="title"><span>123123123123123123123123123123123123123123</span>
						<span>2022-12-07 18:09:55</span></a>
				</div>
			</div>
			<div class="content_form">
				<a href="BoardServlet?command=board_list&category=sports" class="list_title"> <span>운동게시판</span>
				<span><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
				</a>
				<div>
					<c:forEach items="${sportsList }" var="sport">
						<a href="BoardServlet?command=board_view&board_number=${sport.board_number }&category=sports" class="title"><span>${sport.board_title }</span><span>${sport.board_date }</span></a> 
					</c:forEach>
				</div>
			</div>
			<div class="content_form">
				<a href="BoardServlet?command=board_list&category=photo" class="list_title"> <span>사진게시판</span><span><i
						class="fa fa-chevron-right" aria-hidden="true"></i></span>
				</a>
				<div>
					<c:forEach items="${photoList }" var="photo">
						<a href="BoardServlet?command=board_view&board_number=${photo.board_number }&category=photo" class="title"><span>${photo.board_title }</span><span>${photo.board_date }</span></a> 
					</c:forEach>
				</div>
			</div>
			<div class="content_form">
				<a href="BoardServlet?command=board_list&category=game" class="list_title"> <span>게임게시판</span><span><i
						class="fa fa-chevron-right" aria-hidden="true"></i></span>
				</a>
				<div>
					<c:forEach items="${gameList }" var="game">
						<a href="BoardServlet?command=board_view&board_number=${game.board_number }&category=game" class="title"><span>${game.board_title }</span><span>${game.board_date }</span></a> 
					</c:forEach>
				</div>
			</div>
			<div class="content_form">
				<a href="BoardServlet?command=board_list&category=himedia" class="list_title"> <span>하이미디어학원게시판</span><span><i
						class="fa fa-chevron-right" aria-hidden="true"></i></span>
				</a>
				<div>
					<c:forEach items="${himediaList }" var="himedia">
						<a href="BoardServlet?command=board_view&board_number=${himedia.board_number }&category=himedia" class="title"><span>${himedia.board_title }</span><span>${himedia.board_date }</span></a> 
					</c:forEach>
				</div>
			</div>
			<div class="content_form">
				<a href="BoardServlet?command=board_list&category=movie" class="list_title"> <span>영화게시판</span><span><i
						class="fa fa-chevron-right" aria-hidden="true"></i></span>
				</a>
				<div>
					<c:forEach items="${movieList }" var="movie">
						<a href="BoardServlet?command=board_view&board_number=${movie.board_number }&category=movie" class="title"><span>${movie.board_title }</span><span>${movie.board_date }</span></a> 
					</c:forEach>
				</div>
			</div>

		</div>
		<div class="side_fixed_div">
			<jsp:include page="sideBar.jsp" />
		</div>
	</div>
</body>
</html>