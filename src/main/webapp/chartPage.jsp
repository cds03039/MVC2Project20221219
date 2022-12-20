<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>

<%@page import="com.project.dao.ChartDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-차트</title>
<script src="../js/jquery-3.3.1.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://www.gstatic.com/charts/loader.js"></script>
<%
ChartDAO memberDao = ChartDAO.getInstance();

JSONArray jsonArray = memberDao.getCountAddress();
%>



</head>

<link rel="stylesheet" href="css/chartPage.css">
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="bigWrapper">
		<div class="side_fixed_div">
			<jsp:include page="sideBar.jsp" />
		</div>
		<div class="adminMain">

			<select id="chartCombo" onchange="selectOption()">
				<option> 선택하세요
				<option value="countStatus">게시글 통계
				<option value="signUpStatus" id="signUpStatus">회원가입 현황
			</select>


			<div id="chart1">
				<div>
					<h2>게시판 게시글 카테고리별 현황</h2>
					<div id="column_chart_div2" style="width: 980px; height: 500px;"></div>
				</div>
			</div>


			<div id="chart2">
				<div>
					<h2>회원가입 현황</h2>
					<div id="column_chart_div1" style="width: 980px; height: 500px;"></div>
				</div>
			</div>

		</div>
	</div>
</body>

<script>
	//구글 시각화 API를 로딩하는 메소드

	google.charts.load('current', {
		packages : [ 'corechart' ]
	});

	// 구글 시각화 API가 로딩이 완료되면,

	// 인자로 전달된 콜백함수를 내부적으로 호출하여 차트를 그리는 메소드

	// 화면이 실행될때 함께 실행된다.

	//google.charts.setOnLoadCallback(drawChart);

	//30초마다 재갱신

	//google.charts.setOnLoadCallback(function(){

	//setInterval(columnChart1(),2000);

	//}); 

	// 묶은 세로 막대형 차트 1
	function columnChart1(arrayList) {
		// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
		var dataTable = google.visualization.arrayToDataTable(arrayList);
		// 옵션객체 준비
		var options = {
			title : '',
			hAxis : {
				title : '',
				titleTextStyle : {
					color : 'black'
				}
			}
		};
		// 차트를 그릴 영역인 div 객체를 가져옴
		var objDiv = document.getElementById('column_chart_div1');
		// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환
		var LineChart = new google.visualization.LineChart(objDiv);
		//PieChart
		// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드
		LineChart.draw(dataTable, options);
	} // drawColumnChart1()의 끝

	// 버튼 동작
	$(document).ready(function() {
		$('#chartCombo').on('change', function() {
			console.log("1111");
			$.ajax({
				url : 'columnChart1.jsp',
				success : function(result) {
					console.log(result);
					columnChart1(result);
				}
			});
		});
	});

	//도넛차트

	google.charts.load('current', {
		packages : [ 'corechart2' ]
	});

	function columnChart2(arrayList2) {

		var dataTable2 = google.visualization.arrayToDataTable(arrayList2);

		var options2 = {
			title : '',
			hAxis : {
				title : '회원가입 일자별 현황',
				titleTextStyle : {
					color : 'black'
				}
			}
		};

		var objDiv2 = document.getElementById('column_chart_div2');

		var LineChart2 = new google.visualization.PieChart(objDiv2);

		LineChart2.draw(dataTable2, options2);
	}

	$(document).ready(function() {
		$('#chartCombo').on('change', function() {
			$.ajax({
				url : 'columnChart2.jsp',
				success : function(result) {
					console.log(result);
					columnChart2(result);
				}
			});
		});
	});

	function selectOption() {
		var selectOption = document.getElementById("chartCombo");
		selectOption = selectOption.options[selectOption.selectedIndex].value;
		if (selectOption == "countStatus") {
			chart1.style.display = 'block';
			chart2.style.display = 'none';

		}
		if (selectOption == "signUpStatus") {
			chart2.style.display = 'block';
			chart1.style.display = 'none';
		}
	}
</script>



</html>