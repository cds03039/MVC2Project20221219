<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고/건의 작성</title>
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
<form name="frm" method="post" enctype="multipart/form-data" action="BoardServlet?command=report_write">	
	<div class="bigWrapper">
		<div class="side_fixed_div">
			<jsp:include page="sideBar.jsp" />
		</div>
		<div class="writingMain">
			<div class="writingHeader">
				<h3>신고 종류 : 
				<select name="report">
						<option value="cuss">욕설
						<option value="spam">도배
						<option value="complain">건의
						<option value="etc">기타
					</select>
				</h3>

				<div class="title">
								제목 : <input type="text" placeholder="제목 입력" class="titleText"
									name="board_title">
				</div>
				<div class="profile">
					<span>${board.nickname }</span>
				</div>
			
						</div>
			<br>
			<div class="content">
				<div class="wrap">
					<div class="editor-menu">
						<button id="btn-bold" type="button">
							<b><i class="ri-bold"></i></b>
						</button>
						<button id="btn-italic" type="button">
							<i><i class="ri-italic"></i> </i>
						</button>
						<button id="btn-underline" type="button">
							<i class="ri-underline"></i>
						</button>
						<button id="btn-strike" type="button">
							<i class="ri-strikethrough"></i>
						</button>
						<button id="btn-ordered-list" type="button">
							<i class="ri-list-ordered"></i>
						</button>
						<button id="btn-unordered-list" type="button">
							<i class="ri-list-unordered"></i>
						</button>
						<button id="btn-image" type="button">
							<i class="ri-image-add-line"></i>
						</button>
					</div>
					<div id="editor" contenteditable="true">
					
					</div>
					<input id="img-selector" type="file" accept="image/*" type="button" name="pictureUrl">
				</div>
			</div>
			<input type="hidden" name = "board_content" value="">
			<br>
			<hr style="border: solid 1px lightgray;">
			<br>
			<div class="Box">
				<img src="<%=request.getContextPath() %>/captcha" id="captchaImg"
					alt="captcha img"> <input type="text"
					placeholder="보안문자 입력후 글쓰기 가능" name="captcha" class="captchaText">
				<a id="refreshBtn" onclick="imgRefresh()" class="refresh">새로고침</a> 
				<input type="submit" value="글쓰기" class="enter" onclick="passOnContent()">
			</div>
			<br>
			<br>
			<br>
			<br>

		</div>
	</div>
	</form>




	<script>
	
	
	
function imgRefresh(){
    $("#captchaImg").attr("src","/project2/captcha?id="+Math.random()); 
    
}
function passOnContent(){
	$('input[name=board_content]').attr('value',$('#editor').text());
	alert("접수 완료되었습니다.");
	
}




const btnImage = document.getElementById('btn-image');
const imageSelector = document.getElementById('img-selector');

btnImage.addEventListener('click', function () {
    imageSelector.click();
});
imageSelector.addEventListener('change', function (e) {
    const files = e.target.files;
    if (!!files) {
        insertImageDate(files[0]);
    }
});
function insertImageDate(file) {
    const reader = new FileReader();
    reader.addEventListener('load', function (e) {
        focusEditor();
        console.log(reader.result);
        document.execCommand('insertImage', false, reader.result);
    });
    reader.readAsDataURL(file);
};

    const editor = document.getElementById('editor');
    const btnBold = document.getElementById('btn-bold');
    const btnItalic = document.getElementById('btn-italic');
    const btnUnderline = document.getElementById('btn-underline');
    const btnStrike = document.getElementById('btn-strike');
    const btnOrderedList = document.getElementById('btn-ordered-list');
    const btnUnorderedList = document.getElementById('btn-unordered-list');

    btnBold.addEventListener('mousedown', function () {
        setStyle('bold');
    });

    btnItalic.addEventListener('mousedown', function () {
        setStyle('italic');
    });

    btnUnderline.addEventListener('mousedown', function () {
        setStyle('underline');
    });

    btnStrike.addEventListener('mousedown', function () {
        setStyle('strikeThrough')
    });

    btnOrderedList.addEventListener('mousedown', function () {
        setStyle('insertOrderedList');
    });

    btnUnorderedList.addEventListener('mousedown', function () {
        setStyle('insertUnorderedList');
    });

    function setStyle(style) {
        document.execCommand(style);
        focusEditor();
    }

    // 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
    function focusEditor() {
        editor.focus({preventScroll: true});
    }
    
    editor.addEventListener('keydown', function () {
        checkStyle();
    });

    editor.addEventListener('mousedown', function () {
        checkStyle();
    });
    
    function setStyle(style) {
        document.execCommand(style);
        focusEditor();
        checkStyle();
    }
    
    function checkStyle() {
        if (isStyle('bold')) {
            btnBold.classList.add('a');
        } else {
            btnBold.classList.remove('a');
        }
        if (isStyle('italic')) {
            btnItalic.classList.add('a');
        } else {
            btnItalic.classList.remove('a');
        }
        if (isStyle('underline')) {
            btnUnderline.classList.add('a');
        } else {
            btnUnderline.classList.remove('a');
        }
        if (isStyle('strikeThrough')) {
            btnStrike.classList.add('a');
        } else {
            btnStrike.classList.remove('a');
        }
        if (isStyle('insertOrderedList')) {
            btnOrderedList.classList.add('a');
        } else {
            btnOrderedList.classList.remove('a');
        }
        if (isStyle('insertUnorderedList')) {
            btnUnorderedList.classList.add('a');
        } else {
            btnUnorderedList.classList.remove('a');
        }
    }

    function isStyle(style) {
        return document.queryCommandState(style);
    }
    
</script>
</body>
<style>

*{
  margin: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
.bigWrapper{
	width: 1200px;
  	height: 100%;
  	margin: 0 auto;
  	
}
.side_fixed_div{
	width: 200px;
	height: 100vh;
	float: right;
	
}
.writingMain{
	width:980px;
	height: 100%;
	
}
.writingHeader{
	padding: 40px 30px;	
	width:1200px;
	background: lightgray;
}
h3{
		margin : 30px 30px;
}
.title{
	margin : 20px 30px;
	font-size: 20px;
	font-weight: bold;
}
.titleText{
width:825px;
	height: 30px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}

.profile{
	margin-top: 20px;
	margin-left:30px;
}

.content{
	width:900px;
	min-height: 500px;
	
	margin: 0 auto;
}

.Box{
	position: relative;
	width:900px;
	height: 200px;
	padding-top : 20px;
	margin: 0 auto;
	text-align: center;
	background: red;
}
.captchaText{
	position: absolute;
	top : 90px;
	left: 50%;
	width:220px;
	transform : translateX(-50%);
}
.refresh{
	position: absolute;
	top : 120px;
	left: 50%;
	left: 50%;
	transform : translateX(-130%);
	}
.enter{
	position: absolute;
	top : 120px;
	left: 50%;
	transform : translateX(70%);
}
.centerBtn{
	margin-left : 30px;
}
.rightBtn{
	margin-right : 10px;
	float: right;
}

   button.a {
        background-color: gray;
        color: #FFF;
    }
 #editor img {
    	max-width: 100%;
    }
    
    
 #img-selector {
        display: none;
    }
    
.wrap{
	margin: 0 auto;
	width:900px;
	min-height: 500px;
	border: 1px solid black;
	border-radius: 4px;
}   
    
div#editor {
		width:898px;
		min-height: 400px;
    	padding: 16px 24px;
        border-top: 1px solid black;       
        outline:none;
    }
    
.editor-menu{
    height: 50px;
    width:900px;
   	display: table-cell;
    vertical-align: middle;
   background-color: rgba(0, 0, 0, 0.06);
}
.editor-menu button{
 margin-left: 8px;
 font-size: 25px;
	 height: 41px;
	 width:35px;
 text-align: center;
border: none;
border-radius: 4px;
}
.editor-menu button:hover{
   background-color: rgba(0, 0, 0, 0.1);
transition: all 0.35s;
}
   button.a:hover{
    background-color: gray;
        color: #FFF;
   }
.editor-menu button i{
display: flex;

}
</style>
</html>