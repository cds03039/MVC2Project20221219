<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<title>회원정보변경</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/profileChangePage.css">

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="bigWrapper">
		<div class="wrapper">
			<div class="title-text">
				<div class="title login">회원 정보 변경</div>
			</div>


			<form action="UserServlet" class="signup" name="signupForm" method="post">
				<input type="hidden" name="command" value="myProfileUpdate">
				<div class="field">
					<span class="textName">아이디</span> <input type="text" name="userid"
						value="${loginUser.email }" readonly="readonly">
				</div>

				<div class="field">
					<span class="textName">이름</span> <input type="text" value="${loginUser.name }"
						name="name" id="nameEvent_signup" required> <span
						class="warning" id="nameWarning_signup">*이름을 입력해주세요.</span>
				</div>
				<div class="field">
					<span class="textName">전화번호</span> <input type="text" value="${loginUser.phone }"
						name="phone" id="phoneEvent_signup" required> <span
						class="warning" id="phoneWarning_signup">*전화번호를 입력해주세요.</span>
				</div>

				<div class="field">
					<span class="textName">닉네임</span> <input type="text" value="${loginUser.nickname }"
						name="nick" id="nickEvent_signup" required> <span
						class="warning" id="nickWarning_signup">*닉네임을 입력해주세요.</span> <span
						class="warning nickNo">*이미 사용중인 닉네임 입니다.</span> <span
						class="warning nickOk">사용가능한 닉네임 입니다!</span>
				</div>
				<div class="field">
					<span class="textName">비밀번호</span> <input type="password" value=""
						name="pass" id="passEvent_signup" required> <span
						class="warning" id="passWarning_signup">*비밀번호를 입력해주세요.</span>
				</div>
				<div class="field">
					<span class="textName">비밀번호확인</span> <input type="password"
						value="" name="pwd_check" required>
				</div>

				<div class="field btn">
					<div class="btn-layer"></div>
					<input type="submit" value="정보변경" onclick="signupCheck()">
				</div>
			</form>


		</div>
	</div>

<script>
	function signupCheck() {
		if (document.signupForm.name.value.length == 0) {
			nameWarning_signup.style.display = 'block';
			signupForm.name.focus();
		} else if (document.signupForm.phone.value.length == 0) {
			phoneWarning_signup.style.display = 'block';
			signupForm.phone.focus();
		} else if (document.signupForm.nick.value.length == 0) {
			nickWarning_signup.style.display = 'block';
			signupForm.nick.focus();
		} else if (document.signupForm.pass.value.length == 0) {
			passWarning_signup.style.display = 'block';
			signupForm.pass.focus();
		}
	}
	document.getElementById('nameEvent_signup').addEventListener('focusout',
			function() {
				nameWarning_signup.style.display = 'none';
			});
	document.getElementById('nameEvent_signup').addEventListener('keydown',
			function() {
				nameWarning_signup.style.display = 'none';
			});
	document.getElementById('phoneEvent_signup').addEventListener('focusout',
			function() {
				phoneWarning_signup.style.display = 'none';
			});
	document.getElementById('phoneEvent_signup').addEventListener('keydown',
			function() {
				phoneWarning_signup.style.display = 'none';
			});
	document.getElementById('nickEvent_signup').addEventListener('focusout',
			function() {
				nickWarning_signup.style.display = 'none';
			});
	document.getElementById('nickEvent_signup').addEventListener('keydown',
			function() {
				nickWarning_signup.style.display = 'none';
			});
	document.getElementById('passEvent_signup').addEventListener('focusout',
			function() {
				passWarning_signup.style.display = 'none';
			});
	document.getElementById('passEvent_signup').addEventListener('keydown',
			function() {
				passWarning_signup.style.display = 'none';
			});
</script>

</body>
</html>