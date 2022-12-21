<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세보기</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="bigWrapper">
<div class="side_fixed_div">
	<jsp:include page="sideBar.jsp" />
</div>
<div class="postViewMain">
	<div class="postHeader">
	<c:if test="${board.category eq 'sports'}">
	<h3><i class="fa fa-futbol-o" aria-hidden="true"></i>운동게시판</h3><h2>글 제목 : ${board.board_title }</h2>
	</c:if>
	<c:if test="${board.category eq 'photo'}">
	<h3><i class="fa fa-camera" aria-hidden="true"></i>사진게시판</h3><h2>글 제목 : ${board.board_title }</h2>
	</c:if>
	<c:if test="${board.category eq 'game'}">
	<h3><i class="fa fa-gamepad" aria-hidden="true"></i>게임게시판</h3><h2>글 제목 : ${board.board_title }</h2>
	</c:if>
	<c:if test="${board.category eq 'himedia'}">
	<h3><i class="fa fa-eercast" aria-hidden="true"></i>하이미디어게시판</h3><h2>글 제목 : ${board.board_title }</h2>
	</c:if>
	<c:if test="${board.category eq 'movie'}">
	<h3><i class="fa fa-video-camera" aria-hidden="true"></i>영화게시판</h3><h2>글 제목 : ${board.board_title }</h2>
	</c:if>
	</div>
	<div class="profile"><a href="UserServlet?command=myPageForm&nickname=${board.nickname }"><span><i class="fa fa-user" aria-hidden="true"></i> ${board.nickname }</span></a><span><i class="fa fa-eye" aria-hidden="true"></i> ${board.board_views }</span><span><i class="fa fa-thumbs-up" aria-hidden="true"></i> ${board.board_recommend }</span>
	<span class="siren">
		<c:if test="${empty loginUser }">
			<a href="#" onclick="writeAlert();"><img src="images/siren.png" alt="My Image" style="width:23px; height:23px;"></a>
		</c:if>
		<c:if test="${!empty loginUser }">
			<a href="BoardServlet?command=report_action"><img src="images/siren.png" alt="My Image" style="width:23px; height:23px;"></a>
		</c:if>
	</span></div>
	<br><br><br>
	<hr style="border: solid 1px lightgray;">
	<br><br><br>
	<div class="content">
	<pre>${board.board_content }</pre>
	<img src="upload/${board.pictureUrl}" alt="" class="imgBox">
	</div>
	<br>
	<hr style="border: solid 1px lightgray;">
	<br>
	<div class="btnBox">	
	<input type="button" value="추천" class="centerBtn">
	<input type="button" value="비추" class="centerBtn">
	<c:if test="${loginUser.nickname eq board.nickname}">
		<input type="button" value="글수정" class="rightBtn" onclick="location.href='BoardServlet?command=board_update_form&board_number=${board.board_number}'">
		<input type="button" value="글삭제" class="rightBtn" onclick="location.href='BoardServlet?command=board_delete&board_number=${board.board_number}'">
	</c:if>
	<input type="button" value="목록" class="rightBtn" onclick="location.href='BoardServlet?command=board_list&category=${param.category}'">
	<input type="button" value="글쓰기" class="rightBtn">
	
	</div>
	<br><br>
	
	<div class="commentBox">
	<h4>댓글</h4>
</div>	
</div>
</div>



</body>



<style>
@import
	url('https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css')
	;
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
body{
background: lightgray;

}
.bigWrapper{
	width: 1200px;
  	height: 100%;
  	margin: 0 auto;
  		background: white;
 
  	
}
.side_fixed_div{
	width: 200px;
	height: 100vh;
	float: right;
	
}
.postViewMain{
	width:980px;
	height: 100%;
	
}
.postHeader{
	padding: 40px 30px;	
	width:980px;
	
}
h2{
	height: 40px;
	background-color: rgb(233, 233, 233);
	margin-top: 50px;
	padding-left:30px;
	border-radius: 15px;
	line-height: 2.5;
	font-weight:bold;
}
h3{
font-size: 30px;
font-weight:bold;
}
h4{
 	font-size:30px;
	padding: 20px 50px;
}
.profile{
	margin-top: 50px;
	margin-left:50px;
	
}
.profile span{
margin-right:50px;
}
.siren{
	margin-right:50px;
	float: right;
}
.content{
	width:900px;
	min-height: 700px;
	
	margin: 0 auto;
}
.btnBox{
	width:900px;
	margin: 0 auto;
	text-align: center;
	
}
.centerBtn{
	margin-left : 30px;
}
.rightBtn{
	margin-right : 10px;
	float: right;
}
.commentBox{
	width:900px;
	min-height: 700px;
	
	margin: 0 auto;
}
.imgBox{
	max-height: 900px;
	max-width: 800px;
}
</style>
<script type="text/javascript">
function writeAlert(){
	alert("로그인후 사용 가능 합니다.");
}
</script>
</html>