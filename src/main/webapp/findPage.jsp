<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/login.css">
<meta charset="UTF-8">
<title>아디 비번찾기</title>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="wrapper">
	<input type="hidden" value="${code }" id="codeHidden">
	<input type="hidden" value="${email }" id="emailHidden">
	<input type="hidden" value="${password }" id="passHidden">
		<div class="title-text">
			<div class="title login">아이디 찾기</div>
			<div class="title signup">비밀번호 찾기</div>
		</div>
		<div class="form-container">
			<div class="slide-controls">
				<c:if test="${status ==null }">
					<input type="radio" name="slide" id="login" value="1" checked>
					<input type="radio" name="slide" id="signup"  value="2">
				</c:if>
				<c:if test="${status !=null }">
					<input type="radio" name="slide" id="login" value="1">
					<input type="radio" name="slide" id="signup"  value="2" checked>
				</c:if>
				<label for="login" class="slide login">아이디 찾기</label> 
				<label for="signup" class="slide signup">비밀번호 찾기</label>
				<div class="slider-tab"></div>
			</div>

			<div class="form-inner">
				<form action="#" class="login" name="findIdForm">
				<input type="hidden" name="command" value="emailFindAction">
					<div class="field">
						<input type="text" placeholder="이름" name="find_name" id="idEvent"
							required> <span class="warning" id="idWarning">*이름을
							입력해주세요.</span>
					</div>
					<div class="field">
						<input type="text" placeholder="전화번호를" name="find_phone"
							id="find_phoneEvent" required> <span class="warning"
							id="phoneWarning">*전화번호를 입력해주세요.</span>
					</div>
					<div class="signup-link answer">
						<%-- <a>홍길동님 아이디 : \${id값 }</a> <a class="noneIdPass">입력한 정보의 아이디가
							없습니다.</a> --%>
							${message }
					</div>
					<div class="field btn">
						<div class="btn-layer"></div>
						<input type="submit" value="찾기" onclick="loginCheck()">
					</div>
					<div class="signup-link">
						아이디를 못찾겠다면...?<a href="">당장 회원가입</a>
					</div>
				</form>


				<form action="UserServlet" class="signup" name="findPassForm"
					method="post">
					<input type="hidden" name="command" value="pwdFindAction">
					<div class="field">
						<input type="text" placeholder="이름" name="find_name"
							id="nameEvent_signup" required> <span class="warning"
							id="nameWarning_signup">*이름을 입력해주세요.</span>
					</div>
					<div class="field">
						<input type="text" placeholder="전화번호" name="find_phone"
							id="phoneEvent_signup" required> <span class="warning"
							id="phoneWarning_signup">*전화번호를 입력해주세요.</span>
					</div>

					<div class="field">
						<input type="text" placeholder="e-mail" name="find_userid" id="idEvent_signup" required> 
						<span class="warning" id="idWarning_signup">*아이디를 입력해주세요.</span>
					</div>
					<div class="signup-link answer" id="codedivdiv">
						<c:choose>
							<c:when test="${status == 1 }">
								인증코드가 ${email }로 발송 되었습니다.<br>
								인종코드를 입력해 주세요
								<input type="text" name="codeInput" id="codeTxt">
								<input type="button" onclick="codeCheck()" name="codeBtn" value="인증">
							</c:when>
							<c:when test="${status == 0 }">
								사용자 정보가 없습니다.
							</c:when>
							<c:when test="${status == -1 }">
								메일 발송이 실패했습니다.
							</c:when>
						</c:choose>
					
					</div>
					<div class="field btn">
						<div class="btn-layer"></div>
						<input type="submit" value="비밀번호 찾기" onclick="signupCheck()">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	window.onload=function(){
		var selected = document.querySelector('input[type=radio][name=slide]:checked');
	    if(selected.value == 2){
	    	document.querySelector("form.login").style.marginLeft = "-50%";
	    	document.querySelector(".title-text .login").style.marginLeft = "-50%";
	    }
	}
/* 	function open_win(url, name){
		window.open(url,name, "width=500, height = 230, resizable=no");
	} */
	count = 0;
	function codeCheck(){
		var code1 = document.getElementById("codeTxt").value;
		var code2 = document.getElementById("codeHidden").value;
		var email = document.getElementById("emailHidden").value;
		var element = document.getElementById('codedivdiv');
		var pass = document.getElementById("passHidden").value;
		

		
		if(code1===code2){
			element.innerHTML = '<div style="color:blue">비밀 번호는 "'+pass+'"  입니다 <div>';
		}else{
			if(count <1)
				element.innerHTML += '<div style="color:blue">인증번호가 올바르지 않습니다.<div>';
			count ++;
		}
		console.log(count);
	}
	
 function loginCheck(){
	 if(document.findIdForm.find_name.value.length==0){
		 idWarning.style.display = 'block';       		  
		 findIdForm.find_name.focus();        			
		}else if(document.findForm.find_phone.value.length==0){
   		phoneWarning.style.display = 'block';       		  
   		findIdForm.find_phone.focus();        			
			}       	       	        	 
 } 
 document.getElementById('idEvent').addEventListener('focusout', function () {
	 idWarning.style.display = 'none';  
 });
 document.getElementById('idEvent').addEventListener('keydown', function () {
	 idWarning.style.display = 'none';  
 });
 document.getElementById('find_phoneEvent').addEventListener('focusout', function () {
	 find_phoneWarning.style.display = 'none';  
 });
 document.getElementById('find_phoneEvent').addEventListener('keydown', function () {
	 find_phoneWarning.style.display = 'none';  
 });
 
 function signupCheck(){
	 if(document.findPassForm.find_name.value.length==0){
			nameWarning_signup.style.display = 'block';       		  
			findPassForm.find_name.focus();        			
		}else if(document.findPassForm.find_phone.value.length==0){
			phoneWarning_signup.style.display = 'block';       		  
			findPassForm.find_phone.focus();        			
		}else if(document.findPassForm.find_userid.value.length==0){
		 	idWarning_signup.style.display = 'block';       		  
		 	findPassForm.find_userid.focus();        		 
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
 </script>
</body>
</html>