<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background: lightgray;
}
.emailWrap{
	width: 1200px;
	margin: 0 auto;
	height: 100vh;
	background: white;
	
}
.side_fixed_div{
	width: 200px;
	float: right;
	height: 1000px;
}
.span{
font-size:50px;
padding-top:100px;
text-align: center;
}
.span2{
font-size:30px;
margin-top:50px;
color:red;
text-align: center;
}
</style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="emailWrap">
<div class="side_fixed_div">
<jsp:include page="sideBar.jsp" />
</div>
	<div class="span">이메일이 전송 되었습니다.</div>
	<div class="span2">*이메일인증후 게시판 정상이용가능</div>
</div>
	<jsp:include page="footer.jsp" />
</body>
</html>