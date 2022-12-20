<%@page
	import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
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

* {
	margin: 0;
	padding: 0;
}
body{
background-color: lightgray;
}
.boardList_wrap {
	margin: 0 auto;
	width: 1200px;
	display: flow-root;
	position: relative;
}

.boardList_wrap .board_title {
	position: relative;
	width: 100%;
	height: 100px;
}

.boardList_wrap .board_title a {
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	color: black;
	font-size: 70px;
	margin-left: 20px;
	text-decoration: none;
}

.boardList_wrap .board_title span {
	margin-left: 20px;
	font-size: 40px;
}

.boardList_wrap .board_list {
	border-top: 0.5px solid lightgray;
	width: 980px;
	float: left;
	margin-bottom: 10px;
}

.boardList_wrap .side_fixed_div {
	width: 200px;
	float: right;
	height: 1000px;
}

.boardList_wrap .board_list .list table {
	width: 980px;
	table-layout: fixed;
	border-left: 0.5px dotted lightgray;
	border-right: 0.5px dotted lightgray;
	margin-bottom: 10px;
}

.boardList_wrap .board_list .list table th {
	font-weight: bold;
	border-bottom: 1px solid lightgray;
	box-sizing: border-box;
}

.boardList_wrap .board_list .list table tr {
	text-align: center;
	height: 35px;
	line-height: 35px;
	padding: 6.5px 10px;
	border-bottom: 0.5px solid lightgray;
}

.boardList_wrap .board_list .list table tr td:nth-child(2) {
	text-align: left;
}

.boardList_wrap .board_list .list table .detail:hover {
	background-color: lightgray;
}

.boardList_wrap .board_list .list table .detail {
	cursor: pointer;
}

.boardList_wrap .board_list .list table th:nth-child(1), .boardList_wrap .board_list .list table td:nth-child(1)
	{
	width: 110px;
}

.boardList_wrap .board_list .list table th:nth-child(2), .boardList_wrap .board_list .list table td:nth-child(2)
	{
	width: 330px;
}

.boardList_wrap .board_list .list table th:nth-child(3), .boardList_wrap .board_list .list table td:nth-child(3)
	{
	width: 110px;
}

.boardList_wrap .board_list .list table th:nth-child(4), .boardList_wrap .board_list .list table td:nth-child(4)
	{
	width: 120px;
}

.boardList_wrap .board_list .list table th:nth-child(5), .boardList_wrap .board_list .list table td:nth-child(5)
	{
	width: 60px;
}

.boardList_wrap .board_list .list table th:nth-child(6), .boardList_wrap .board_list .list table td:nth-child(6)
	{
	width: 60px;
}

.boardList_wrap .board_list .list table th, .boardList_wrap .board_list .list table td
	{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.boardList_wrap .board_list .list form {
	float: right;
}

.boardList_wrap .board_list .list input {
	height: 30px;
}

.boardList_wrap .board_list .list input[type="submit"] {
	width: 50px;
}

.boardList_wrap .board_list .list input[type="button"] {
	width: 70px;
}

.boardList_wrap .board_list .list select {
	height: 30px;
}

.boardList_wrap .page_div, .date_search {
	margin-top: 10px;
	width: 100%;
	height: 50px;
	border: 1px solid black;
	background-color: yellow;
	text-align: center;
}
</style>
<script>
	function dateCheck() {
		var start = document.getElementById("startDate").value;
		var end = document.getElementById("endDate").value;
		var endDate = new Date(end);
		var d = new Date(endDate.setDate(endDate.getDate() + 1));
		var end1 = d.getFullYear()
				+ "-"
				+ ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0"
						+ (d.getMonth() + 1))
				+ "-"
				+ (d.getDate() > 9 ? d.getDate().toString() : "0"
						+ d.getDate().toString());
		var category = document.getElementById("category").value;
		console.log(category);

		// console.log(d.getFullYear() + "-" + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "-" + (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString()));

		if (start <= end) {
			self.location = "BoardServlet?command=board_search&category="+category+"&searchType=dateSearch&start="
					+ start + "&end=" + end1 + "&end1=" + end;
		} else {
			alert("날짜를 올바르게 선택해주세요.");
		}
	}
	function writeAlert(){
		alert("로그인후 사용 가능 합니다.");
	}
</script>
</head>
<body>
	
	<jsp:include page="header.jsp" />
	<div class="boardList_wrap">
	<div class="board_title">
      <c:if test="${param.category eq 'sports'}">
         <a href="#"><i class="fa fa-futbol-o" aria-hidden="true"></i><span>${param.category}</span></a>
         </c:if>
         <c:if test="${param.category eq 'photo'}">
      	   <a href="#"><i class="fa fa-camera" aria-hidden="true"></i><span>${param.category}</span></a>
         </c:if>
         <c:if test="${param.category eq 'game'}">
        	 <a href="#"><i class="fa fa-gamepad" aria-hidden="true"></i><span>${param.category}</span></a>
         </c:if>
         <c:if test="${param.category eq 'himedia'}">
        	 <a href="#"><i class="fa fa-eercast" aria-hidden="true"></i><span>${param.category}</span></a>
         </c:if>
         <c:if test="${param.category eq 'movie'}">
        	 <a href="#"><i class="fa fa-video-camera" aria-hidden="true"></i><span>${param.category}</span></a>
         </c:if>
      </div>
		<div class="board_list">
			<div class="list">
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>추천</th>
					</tr>
					<c:forEach var="board" items="${boardList }">
						<tr
							onclick="location.href='BoardServlet?command=board_view&category=${param.category}&board_number=${board.board_number }'" class="detail">
							<td>${board.board_number }</td>
							<td>${board.board_title }</td>
							<td>${board.nickname }</td>
							<td><fmt:formatDate value="${board.board_date }" /></td>
							<td>${board.board_views }</td>
							<td>${board.board_recommend }</td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${!empty loginUser }">
					<input type="button" value="글쓰기" id="searchBtn" onclick="location.href='BoardServlet?command=board_write_form&category=${param.category}'">
				</c:if>
				<c:if test="${empty loginUser }">
					<input type="button" value="글쓰기" id="searchBtn" onclick="writeAlert();">
				</c:if>
				<form action="BoardServlet" method="get">
					<input type="hidden" name="command" value="board_search">
					<input type="hidden" name="category" value="${param.category }"> 
					<select	name="searchType" id="search">
						<c:if test="${search eq 'all' }">
							<option value="all" selected>전체</option>
							<option value="titleAndcontent">제목/내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="nickname">글쓴이</option>
							<option value="">댓글</option>
						</c:if>

						<c:if test="${search eq 'titleAndcontent'}">
							<option value="all">전체</option>
							<option value="titleAndcontent" selected>제목/내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="nickname">글쓴이</option>
							<option value="">댓글</option>
						</c:if>

						<c:if test="${search eq 'title'}">
							<option value="all">전체</option>
							<option value="titleAndcontent">제목/내용</option>
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
							<option value="nickname">글쓴이</option>
							<option value="">댓글</option>
						</c:if>

						<c:if test="${search eq 'content'}">
							<option value="all">전체</option>
							<option value="titleAndcontent">제목/내용</option>
							<option value="title">제목</option>
							<option value="content" selected>내용</option>
							<option value="nickname">글쓴이</option>
							<option value="">댓글</option>
						</c:if>

						<c:if test="${search eq 'nickname'}">
							<option value="all">전체</option>
							<option value="titleAndcontent">제목/내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="nickname" selected>글쓴이</option>
							<option value="">댓글</option>
						</c:if>
						<c:if test="${!empty search && search eq 'dateSearch'}">
							<option value="all" selected>전체</option>
							<option value="titleAndcontent">제목/내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="nickname" >글쓴이</option>
							<option value="">댓글</option>
						</c:if>
						<c:if test="${empty search}">
							<option value="all" selected>전체</option>
							<option value="titleAndcontent">제목/내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="nickname">글쓴이</option>
							<option value="">댓글</option>
						</c:if>
					</select> <input type="text" name="keyword"> <input type="submit"
						value="검색">
				</form>
			</div>
			<div class="page_div">페이징 처리영역</div>

			<div class="date_search">
				<c:if test="${search eq 'dateSearch'}">
					<input type="date" id="startDate" value="${start }"> ~ 
        			  <input type="date" id="endDate" value="${end1 }">
				</c:if>
				<c:if test="${!empty search && !(search eq 'dateSearch')}">
					<input type="date" id="startDate"> ~ 
        			  <input type="date" id="endDate">
				</c:if>
				<c:if test="${empty search}">
					<input type="date" id="startDate"> ~ 
        			  <input type="date" id="endDate">
				</c:if>
				<input type="button" value="검색" onclick="dateCheck()">
				<input type="hidden" name="category" value="${param.category }" id="category">
			</div>
		</div>
		<div class="side_fixed_div">
			<jsp:include page="sideBar.jsp" />
		</div>
	</div>

</body>
</html>