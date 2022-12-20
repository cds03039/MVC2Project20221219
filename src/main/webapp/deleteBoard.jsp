<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시물 삭제</title>
  <link rel="stylesheet" href="css/reset.css">
  <style>
    
    .delete_wrap {
      margin: 0 auto;
      width: 1200px;
      height: 100vh;
    }
    .delete_wrap .delete_left{
      float: left;
      width: 980px;
      height: 100%;
    }
    .delete_wrap .side_fixed_div {
      width: 200px;
      height: 100%;
      float: right;
    }
    .delete_wrap .delete_left .inner_delete{
      margin: 30px auto 0;
      width: 80%;
      height: 300px;
      padding: 16px;
      border: 0.5px solid lightslategray;
      border-radius: 20px;
    }
    .delete_wrap .delete_left .inner_delete h4{
      font-size: 50px;
      margin-bottom: 50px;
    }
    .delete_wrap .delete_left .inner_delete h6{
      margin-top: 20px;
      font-size: 16px;
    }
    .delete_wrap .delete_left .inner_delete form{
      margin-top: 20px;
      height: 50px;
    }
    .delete_wrap .delete_left .inner_delete label {
      font-size: 30px;
      margin-right: 50px;
      line-height: 3;
    }
    .delete_wrap .delete_left .inner_delete input[type="password"]{
      width: 570px;
      height: 3em;
      margin: 0;
      padding: 0;
      margin-right: 20px;
    }
    .delete_wrap .delete_left .inner_delete input[type="submit"]{
      background-color: red;
      width: 100px;
      font-size: 23px;
      color: white;
      line-height: 50px;
      display: block;
      float: right;
      margin-right: 40px;
      border: none;
    }
    .delete_wrap .delete_left .inner_delete input[type="submit"]:hover{
      cursor: pointer;
      background-color: darkred;
    }
  </style>
</head>
<body>
    <div class="delete_wrap">
      <div class="delete_left">
        <div class="inner_delete">
          <h4>게시물 삭제</h4>
          <h6>삭제된 글은 복구할 수 없습니다.</h6>
          <form action="">
          <label for="delete_pwd">패스워드</label>
          <input type="password" id="delete_pwd">
          <input type="submit" value="삭제">
        </form>
        </div>
      </div>
      <div class="side_fixed_div">
      	<jsp:include page="sideBar.jsp" />
      </div>
    </div>
</body>
</html>