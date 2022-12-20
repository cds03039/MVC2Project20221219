<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-회원리스트</title>
<link rel="stylesheet" href="css/chartPage.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="bigWrapper">
<div class="side_fixed_div">
	<jsp:include page="sideBar.jsp" />
</div>
<div class="adminMain">

<select id="memberCombo" onchange="selectOption()">
  <option value="memberList">회원리스트
  <option value="report">신고/건의
</select>
		<form action="" id="memberListForm">
			<div class="memberSerch">
				<select>
					<option>아이디
					<option>닉네임
					<option>회원상태
				</select> <input type="text" placeholder="검색"> <input type="button"
					value="검색">
			</div>
			<table class="memberList">
				<tr class="htr">
					<th>아이디</th>
					<th>이름</th>					
					<th>닉네임</th>
					<th>전화번호</th>
					<th>가입날짜</th>
					<th>회원상태</th>					
				</tr>
				<c:forEach items="${memberList }" var="member">
				<tr>
					<td><a href="#">${member.email }</a></td>
					<td>${member.name }</td>
					<td>${member.nickname }</td>
					<td>${member.phone }</td>
					<td>${member.joinDate }</td>
					<td>
					<c:if test="${member.grade eq '0'}">
					<select id="gradeSelect" name="grade">
							<option value="b">블랙리스트 
							<option value="sa" selected>수퍼 관리자 
							<option value="a">부 관리자 
							<option value="m">일반회원
					</select>
					</c:if>
					<c:if test="${member.grade eq '1'}">
					<select id="gradeSelect" name="grade">
							<option>블랙리스트
							<option>수퍼 관리자
							<option selected>부 관리자
							<option>일반회원
					</select>
					</c:if>
					<c:if test="${member.grade eq '2'}">
					<select id="gradeSelect" name="grade">
							<option>블랙리스트 
							<option>수퍼 관리자 
							<option>부 관리자 
							<option selected>일반회원 
					</select>
					</c:if>
					<c:if test="${member.grade eq '3'}">
					<select id="gradeSelect" name="grade">
							<option selected>블랙리스트 
							<option>수퍼 관리자 
							<option>부 관리자 
							<option>일반회원 
					</select>
					</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
			<input type="submit" value="저장" class="save">
		</form>

		<form action="" id="reportForm">
			<div class="memberSerch">
				<select>
					<option>아이디
					<option>닉네임	
					<option>종류								
				</select> 
				<input type="text" placeholder="검색"> <input type="button" value="검색">
			</div>
				<table class="reportList">
				<tr class="htr">
					<th>선택</th>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>종류</th>					
				</tr>
				<c:forEach items="${reportList }" var="report" varStatus="status">
					<tr class="htr">					
						<td>
						<input type="checkbox">
						</td>
						<td>${report.board_number }</td>
						<td><a href="#" onclick="location.href='BoardServlet?command=board_view&board_number=${report.board_number }'" class="detail">${report.board_title }</a></td>
						<td>${memberList[status.index].nickname}</td>
						<td>${report.board_date }</td>
						<c:if test="${report.category  eq 'cuss'}">
							<td>욕설</td>
						</c:if>					
					</tr>
				</c:forEach>
				
				</table>
				<input type="submit" value="삭제" class="delete">
		</form>

	</div>
	</div>




<script>
function selectOption() {
   	var selectOption = document.getElementById("memberCombo");
   	selectOption = selectOption.options[selectOption.selectedIndex].value;
   	if(selectOption == "memberList"){
   		memberListForm.style.display = 'block'; 
   		reportForm.style.display = 'none';  			
   	}
   	if(selectOption == "report"){
   		reportForm.style.display = 'block'; 
   		memberListForm.style.display = 'none';   		 	
   	}  	 		        		  	
}


</script>
</body>
</html>