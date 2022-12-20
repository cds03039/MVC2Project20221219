<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인/회원가입</title>
<link rel="stylesheet" href="css/login.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%-- <c:if test="${result !=null }">
		<%=response.sendRedirect("index.jsp") %>
	</c:if> --%>
	
	<jsp:include page="header.jsp"></jsp:include>
	<div class="wrapper">
		<div class="title-text">
			<div class="title login">로그인</div>
			<div class="title signup">회원가입</div>
		</div>
		<div class="form-container">
			<div class="slide-controls">
				<input type="radio" name="slide" id="login" checked> <input	type="radio" name="slide" id="signup"> 
				<label for="login"	class="slide login">로그인</label> <label for="signup"class="slide signup">회원가입</label>
				<div class="slider-tab"></div>
			</div>

			<div class="form-inner">
				<form action="UserServlet" class="login" name="loginForm" method="post">
					<input type="hidden" name="command" value="loginAction">
					<div class="field">
						<input type="text" placeholder="아이디(e-mail)" name="userid"
							id="idEvent" required> <span class="warning"
							id="idWarning">*아이디를 입력해주세요.</span>
					</div>
					<div class="field">
						<input type="password" placeholder="비밀번호" name="pass"
							id="passEvent" required> <span class="warning"
							id="passWarning">*비밀번호를 입력해주세요.</span>
					</div>
					<div class="pass-link">
						<a href="UserServlet?command=pwdFindFormAction">비밀번호를 잊으셨나요?</a>
					</div>
					<br>
					<br>
					<div style="width: 100%; text-align: center;">
						${message }<br><br><br>
						<c:if test="${!empty emailCheck && emailCheck == 0}">
							<input type="button" value="인증메일 다시보내기" onclick="location.href='UserServlet?command=emailReSendAction&email=${email}'">
						</c:if>
					</div>
					<div class="field btn">
						<div class="btn-layer"></div>
						<input type="submit" value="로그인" onclick="loginCheck()">
					</div>
					<div class="signup-link">
						아직도 비회원...? <a href="">당장 회원가입</a>
					</div>
				</form>


				<form action="UserServlet" class="signup" name="signupForm" method="post">
					<input type="hidden" name="command" value="regist">
					<div class="field">
						<input type="text" placeholder="이름" name="name"
							id="nameEvent_signup" required> <span class="warning"
							id="nameWarning_signup">*이름을 입력해주세요.</span>
					</div>
					<div class="field">
						<input type="text" placeholder="전화번호" name="phone"
							id="phoneEvent_signup" required> <span class="warning"
							id="phoneWarning_signup">*전화번호를 입력해주세요.</span>
					</div>

					<div class="field">
						<input type="text" placeholder="e-mail (아이디로사용)" name="userid"
							id="idEvent_signup" required> <span class="warning"
							id="idWarning_signup">*아이디를 입력해주세요.</span>
					</div>
					<div class="field">
						<input type="text" placeholder="닉네임" name="nick"
							id="nickEvent_signup" required> <span class="warning"
							id="nickWarning_signup">*닉네임을 입력해주세요.</span> <span
							class="warning nickNo">*이미 사용중인 닉네임 입니다.</span> <span
							class="warning nickOk">사용가능한 닉네임 입니다!</span>
					</div>
					<div class="field">
						<input type="password" placeholder="비밀번호" name="pass"
							id="passEvent_signup" required> <span class="warning"
							id="passWarning_signup">*비밀번호를 입력해주세요.</span>
					</div>
					<div class="field">
						<input type="password" placeholder="비밀번호 확인" name="pwd_check" required>
					</div>
						${message }

					<div class="field btn">
						<div class="btn-layer"></div>
						<input type="submit" value="회원가입/이메일인증" onclick="signupCheck()">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
         const loginText = document.querySelector(".title-text .login");
         const loginForm = document.querySelector("form.login");
         const loginBtn = document.querySelector("label.login");
         const signupBtn = document.querySelector("label.signup");
         const signupLink = document.querySelector("form .signup-link a");
         signupBtn.onclick = (()=>{
           loginForm.style.marginLeft = "-50%";
           loginText.style.marginLeft = "-50%";
         });
         loginBtn.onclick = (()=>{
           loginForm.style.marginLeft = "0%";
           loginText.style.marginLeft = "0%";
         });
         signupLink.onclick = (()=>{
           signupBtn.click();
           return false;
         });                 
         
         function loginCheck(){
        	 if(document.loginForm.userid.value.length==0){
        		 idWarning.style.display = 'block';       		  
        		 loginForm.userid.focus();        			
        		}else if(document.loginForm.pass.value.length==0){
           		 passWarning.style.display = 'block';       		  
           		loginForm.pass.focus();        			
     			}       	       	        	 
         }         
         document.getElementById('idEvent').addEventListener('focusout', function () {
        	 idWarning.style.display = 'none';  
         });
         document.getElementById('idEvent').addEventListener('keydown', function () {
        	 idWarning.style.display = 'none';  
         });
         document.getElementById('passEvent').addEventListener('focusout', function () {
        	 passWarning.style.display = 'none';  
         });
         document.getElementById('passEvent').addEventListener('keydown', function () {
        	 passWarning.style.display = 'none';  
         });
         
         
         function signupCheck(){
        	 if(document.signupForm.name.value.length==0){
       			nameWarning_signup.style.display = 'block';       		  
       			signupForm.name.focus();        			
       		}else if(document.signupForm.phone.value.length==0){
      			phoneWarning_signup.style.display = 'block';       		  
      			signupForm.phone.focus();        			
      		}else if(document.signupForm.userid.value.length==0){
        		 	idWarning_signup.style.display = 'block';       		  
        			signupForm.userid.focus();        		 
        	}else if(document.signupForm.nick.value.length==0){
          			nickWarning_signup.style.display = 'block';       		  
          			signupForm.nick.focus();        			
          	}else if(document.signupForm.pass.value.length==0){
              		passWarning_signup.style.display = 'block';       		  
              		signupForm.pass.focus();        			
          	}   
         }
         
         
         document.getElementById('nameEvent_signup').addEventListener('focusout', function () {
        	 nameWarning_signup.style.display = 'none';          	         	 
         });
         document.getElementById('nameEvent_signup').addEventListener('keydown', function () {
        	 nameWarning_signup.style.display = 'none';          	         	 
         });
         document.getElementById('phoneEvent_signup').addEventListener('focusout', function () {
        	 phoneWarning_signup.style.display = 'none';         	     	 
         });
         document.getElementById('phoneEvent_signup').addEventListener('keydown', function () {
        	 phoneWarning_signup.style.display = 'none';         	
         });
         document.getElementById('idEvent_signup').addEventListener('focusout', function () {
        	 idWarning_signup.style.display = 'none';          	
         });
         document.getElementById('idEvent_signup').addEventListener('keydown', function () {
        	 idWarning_signup.style.display = 'none';          	
         });
         document.getElementById('nickEvent_signup').addEventListener('focusout', function () {
        	 nickWarning_signup.style.display = 'none';          	
         });
         document.getElementById('nickEvent_signup').addEventListener('keydown', function () {
        	 nickWarning_signup.style.display = 'none';          	
         });
         document.getElementById('passEvent_signup').addEventListener('focusout', function () {
        	 passWarning_signup.style.display = 'none';          	      	 
         });
         document.getElementById('passEvent_signup').addEventListener('keydown', function () {
        	 passWarning_signup.style.display = 'none';         		 
         });
      </script>
</body>
</html>