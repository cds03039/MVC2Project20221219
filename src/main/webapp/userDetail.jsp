<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원상세보기</title>
  <link rel="stylesheet" href="css/reset.css">
  <style>
    @import url('https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
    .userDetail_wrap{
      margin:  0 auto;
      width: 1200px;
      display: flow-root;
    }
    .userDetail_wrap .userDetail_content{
      width: 980px;
      height: 100%;
      border-left: 0.5px solid lightgray;
      border-right: 0.5px solid lightgray;
      float: left;
    }
    .userDetail_wrap .userDetail_content a{
      text-decoration: none;
      color: black;
    }
    .userDetail_wrap .side_fixed_div {
      width: 200px;
      height: 100%;
      background-color: pink;
      float: right;
    }
    .userDetail_wrap .userDetail_content .header {
      position: relative;
      height: 200px;
      width: 100%;
      background-color: antiquewhite;
      margin-bottom: 20px;
      transform: tra;
    }
     .userDetail_wrap .userDetail_content .header a{
     	float: right;
     	margin-top: 10px;
     	margin-right: 10px;
     }
     .userDetail_wrap .userDetail_content .header a:hover{
     	font-size: 20px;
     	font-weight: bold;
     }
    .userDetail_wrap .userDetail_content .chart {
      margin: 0 auto;
      display: flow-root;
      width: 80%;
      margin-bottom: 20px;
    }
    .userDetail_wrap .userDetail_content .recent {
      margin: 0 auto;
      height: 500px;
      width: 80%;
      margin-bottom: 20px;
      border-top: 0.5px solid lightgray;
      padding-top: 20px;
    }
    .userDetail_wrap .userDetail_content .reply{
      margin: 0 auto;
      height: 500px;
      width: 80%;
      border-top: 0.5px solid lightgray;
      padding-top: 20px;
      margin-bottom: 50px;
    }
    .userDetail_wrap .userDetail_content .left_div{
      display: inline-block;
      width: 550px;
      height: 30px;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      font-size: 18px;
      line-height: 20px;
      
    }
    .userDetail_wrap .userDetail_content .left_div .channel{
      background-color: black;
      color: white;
      border: 1px solid black;
      border-radius: 10px;
      padding: 3px;
      font-size: 13px;
      line-height: 30px;
    }

    .userDetail_wrap .userDetail_content .date_span{
      display: inline;
      width: 200px;
      float: right;
      text-align: right;
      margin-right: 20px;
      height: 30px;
      font-size: 15px;
      line-height: 30px;
    }
    .userDetail_wrap .userDetail_content h5 +div{
      margin-top: 10px;
      height: 30px;
    }
    .userDetail_wrap .userDetail_content .content{
      height: 30px;
      line-height: 30px;
    }
    .userDetail_wrap .userDetail_content h5 {
      font-size: 20px;
    }
    .userDetail_wrap .userDetail_content .header .innerHeader{
      position: absolute;
      bottom: 0;
      left: 0;
      width: 200px;
      height: 130px;
      margin: 0 0 16px 48px;
    }
    .userDetail_wrap .userDetail_content .header .innerHeader div{
      margin-bottom: 10px;
      font-size: 60px;
    }
    .userDetail_wrap .userDetail_content .header .innerHeader h4{
      font-size: 24px;
      margin-bottom: 12px;
    }
    .userDetail_wrap .userDetail_content .chart h3 {
      font-size: 30px;
      margin-bottom: 10px;
    }

    .userDetail_wrap .userDetail_content .chart ul {
      height: 50%;
      text-align: center;
      font-size: 18px;
      line-height: 2;
      display: inline-block;
      border-right: 0.5px solid lightgray;
    }
    .userDetail_wrap .userDetail_content .chart ul:nth-last-child(1){
      border-right: 0;
    }
    .userDetail_wrap .userDetail_content .chart ul li{
      margin: 0 11px;
    }
    .userDetail_wrap .userDetail_content .chart ul li:nth-child(1){
      font-size: 20px;
    }

  </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
  <div class="userDetail_wrap">
    <div class="userDetail_content">
      <div class="header">
      	<c:if test="${loginUser.nickname eq nickname }">
        	<a href="UserServlet?command=myProfileUpdateForm&email=${loginUser.email }">정보 변경</a>
        </c:if>
        <div class="innerHeader">
          <div><i class="fa fa-user-circle" aria-hidden="true"></i></div>
          <c:if test="${nickname eq loginUser.nickname }">
	          <h4>사용자 @${loginUser.nickname }</h4>
          </c:if>
          <c:if test="${nickname ne loginUser.nickname }">
	          <h4>사용자 @${nickname }</h4>
          </c:if>
          <p>기본 정보 입니다.</p>
        </div>
      </div>
      <div class="chart">
        <h3>통계</h3>
        <ul>
          <li>전체게시글</li>
          <li>${list[0]+list[1]+list[2]+list[3]+list[4] }</li>
        </ul>
        <ul>
          <li>운동게시글</li>
          <c:if test="${list[0] == null }">
          	<li>0</li>
          </c:if>
          <c:if test="${list[0] != null }">
         	 <li>${list[0] }</li>
          </c:if>
        </ul>
        <ul>
          <li>게임게시글</li>
           <c:if test="${list[1] == null }">
          	<li>0</li>
          </c:if>
          <c:if test="${list[1] != null }">
         	 <li>${list[1] }</li>
          </c:if>
        </ul>
        <ul>
          <li>사진게시글</li>
           <c:if test="${list[2] == null }">
          	<li>0</li>
          </c:if>
          <c:if test="${list[2] != null }">
         	 <li>${list[2] }</li>
          </c:if>
        </ul>
        <ul>
          <li>영화게시글</li>
           <c:if test="${list[3] == null }">
          	<li>0</li>
          </c:if>
          <c:if test="${list[3] != null }">
         	 <li>${list[3] }</li>
          </c:if>
        </ul>
        <ul>
          <li>자유게시글</li>
           <c:if test="${list[4] == null }">
          	<li>0</li>
          </c:if>
          <c:if test="${list[4] != null }">
         	 <li>${list[4] }</li>
          </c:if>
        </ul>
      </div>
      <div class="recent">
        <h5>최근 작성글</h5>
        <c:forEach items="${userList }" var="userList">
	        <div>
	          <div class="left_div">
	          <a href="BoardServlet?command=board_view&category=${userList.category}&board_number=${userList.board_number }" class="channel"><span>${userList.category }</span></a>
	          <a href="BoardServlet?command=board_view&category=${userList.category}&board_number=${userList.board_number }" class="content"><span>${userList.board_title }</span></a>
	        </div>
	          <span class="date_span">${userList.board_date }</span>
	        </div>
        </c:forEach>
      </div>
      <div class="reply">
        <h5>최근 작성 댓글</h5>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>
        <div>
          <div class="left_div">
          <a href="" class="channel"><span>에어소프트채널</span></a>
          <a href="" class="content"><span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat, hic.123123123123123123123</span></a>
        </div>
          <span class="date_span">2022-12-08 14:49:35</span>
        </div>

      </div>
    </div>
    <div class="side_fixed_div">
    	<jsp:include page="sideBar.jsp" />
    </div>
  </div>
</body>
</html>