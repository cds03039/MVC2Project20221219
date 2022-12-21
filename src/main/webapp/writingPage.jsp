<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script type="text/javascript">
function passOnContent(){
	$('input[name=board_content]').attr('value',$('#editor').text());
	
	var v = grecaptcha.getResponse();
	board_title = $("#board_title").val();
	content = ('value',$('#editor').text());
		
	if(board_title == ""){
		alert ("제목을 입력해주세요.");
		return false;
	}else if(content == ""){
		alert ("내용을 입력해주세요.");
		return false;
	}else if (v.length == 0) {
		alert ("'로봇이 아닙니다.'를 체크해주세요.");
		
		return false;
	} else {
		location.reload();
		return true;
	}
	
	
}


</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
<form name="frm" method="post" enctype="multipart/form-data" action="BoardServlet?command=board_write&category=${category }">	
	<%-- <input type="hidden" name="category" value="${category }"> --%>
	<input type="hidden" name="nickname" value="${loginUser.nickname }">
	
	<div class="bigWrapper">
		<div class="side_fixed_div">
			<jsp:include page="sideBar.jsp" />
		</div>
		<div class="writingMain">
			<div class="writingHeader">
				<h3>게시판 : ${category }</h3>

				<div class="title">
					제목 : <input type="text" placeholder="제목 입력" class="titleText" name="board_title" id="board_title">
				</div>
				<div class="profile">
					<span>작성자 : ${loginUser.nickname }</span>
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
			<input type="hidden" name = "board_content" value="" id="board_content">
			<br>
			<hr style="border: solid 1px lightgray;">
			<br>
			<div class="Box">
				<div class="g-recaptcha" data-sitekey="6LfkL5IjAAAAANhGsB5MpwXkvsmMaXUzUbTWqcdx" data-callback="recaptcha"></div>
					
					
				 <input type="submit" value="글쓰기" class="enter" onclick="return passOnContent()" >
			</div>
			<br>
			<br>
			<br>
			<br>

		</div>
	</div>
	</form>




	<script>
	
	
	



	



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
.writingMain{
	width:980px;
	height: 100%;
	
}
.writingHeader{
	padding: 40px 30px;	
	width:1200px;
	background: lightgray;
	background: white;
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
	height: 40px;
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
	transform : translateX(-50%);
	
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
.g-recaptcha{
	position: absolute;
	left: 50%;
    transform: translateX(-50%);
}
</style>
</html>