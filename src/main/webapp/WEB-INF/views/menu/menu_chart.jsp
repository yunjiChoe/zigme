<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- 메뉴 style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/menu.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />
<style type="text/css">
.nav>li>a {
	font-size: 16px;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus
	{
	color: #ffffff;
	background-color: #3cf;
}

.nav-tabs>li>a {
	color: #ffffff;
	background-color: #037;
}

.form-control {
	padding: 0px;
	font-size: 13px;
}

#parent.form-control {
	font-family: none;
	margin-bottom: 6px;
}

option {
	font-family: none;
}

.tab-pane>p {
	font-size: 15px;
	color: #000000;
	margin: 3px 30px 0 0;
}

button {
	margin-left: 10px;
	color: #000000;
}

</style>
</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content">
			<p class="sub_title">선호 음식 순위</p>
			<form class="form-inline pull-right">
				<div class="form-group">
					<select id="parent" class="form-control">
						<option value="">--- 선택하세요 ---</option>
						<option value="202010">2020년 10월</option>
						<option value="202011">2020년 11월</option>
						<option value="202012">2020년 12월</option>
					</select>
				</div>
				<span class="between"> &nbsp;<strong>~</strong>&nbsp;
				</span>
				<div class="form-group">
					<select id="parent" class="form-control">
						<option value="">--- 선택하세요 ---</option>
						<option value="202106">2021년 6월</option>
						<option value="202107">2021년 7월</option>
						<option value="202108">2021년 8월</option>
					</select>
				</div>
				<button type="button" class="btn btn-default view">
					<b>조회</b>
				</button>
			</form>
			<!-- 탭 메뉴 시작 -->
			<ul id="myTab" class="nav nav-tabs">
				<li class="active"><a href="#gna" data-toggle="tab">성별/연령별</a></li>
				<li><a href="#weather" data-toggle="tab">날씨별</a></li>
			</ul>
			<!-- 탭 메뉴 끝 -->

			<!-- 탭 화면 시작 -->
			<div class="tab-content">
				<div class="tab-pane fade in active" id="gna">
					<br />

					<p class="pull-left">
						<strong>&nbsp;<span id="none">l</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성별
						</strong>
					</p>
					<div class="btn-group" data-toggle="buttons">
						<button type="button" class="pull-left btn btn-sm" id="men">
							&nbsp;&nbsp;&nbsp;<b>남성</b>&nbsp;&nbsp;&nbsp;
						</button>
						<button type="button" class="pull-left btn btn-sm" id="women">
							&nbsp;&nbsp;&nbsp;<b>여성</b>&nbsp;&nbsp;&nbsp;
						</button>
					</div>

					<br /> <br />

					<p class="pull-left">
						<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연령별</strong>
					</p>
					<div class="btn-group" data-toggle="buttons">
						<button type="button" class="pull-left btn btn-sm btn-success"
							id="twenties">
							&nbsp;&nbsp;&nbsp;<b>20대</b>&nbsp;&nbsp;&nbsp;
						</button>
						<button type="button" class="pull-left btn btn-sm btn-info"
							id="thirties">
							&nbsp;&nbsp;&nbsp;<b>30대</b>&nbsp;&nbsp;&nbsp;
						</button>
						<button type="button" class="pull-left btn btn-sm btn-warning"
							id="fourties">
							&nbsp;&nbsp;&nbsp;<b>40대</b>&nbsp;&nbsp;&nbsp;
						</button>
						<button type="button" class="pull-left btn btn-sm btn-primary"
							id="fifties">
							<b>50대 이상</b>
						</button>
					</div>

					<div class="chart1">
						<br />
						<p class="type1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;방문횟수</p>
						<div class="axis clearfix">
							<div class="pull-left">
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br>
							</div>
							<div class="pull-left">
								<br><br><br>
								<div id="male" class="off">남성 데이터 가져오기 / 다중선택 가능 (Python)</div>
								<br>
								<div id="female" class="off">여성 데이터 가져오기 / 다중선택 가능 (Python)</div>
								<br>
								<div id="zg" class="off">20대 데이터 가져오기 / 다중선택 가능 (Python)</div>
								<br>
								<div id="yg" class="off">30대 데이터 가져오기 / 다중선택 가능 (Python)</div>
								<br>
								<div id="xg" class="off">40대 데이터 가져오기 / 다중선택 가능 (Python)</div>
								<br>
								<div id="old" class="off">50대 데이터 가져오기 / 다중선택 가능 (Python)</div>
							</div>
						</div>
						<p class="type2">업종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
						<p class="category">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							한식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							분식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							양식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 그
							외&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							일식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							중식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
					</div>
				</div>

				<div class="tab-pane fade" id="weather">
					<br />

					<div class="btn-group">
						<button type="button" class="pull-left btn btn-lg btn-default"
							id="sunny">
							<img src="${pageContext.request.contextPath}/img/common/weather-icons/002-sunny.png" width="55"><b>
								맑음</b>
						</button>
						<button type="button" class="pull-left btn btn-lg btn-default"
							id="cloudy">
							<img src="${pageContext.request.contextPath}/img/common/weather-icons/005-cloudy.png" width="55"><b>
								흐림</b>
						</button>
						<button type="button" class="pull-left btn btn-lg btn-default"
							id="rainy">
							<img src="${pageContext.request.contextPath}/img/common/weather-icons/012-rainy.png" width="60"><b> 비</b>
						</button>
						<button type="button" class="pull-left btn btn-lg btn-default"
							id="snowy">
							<img src="${pageContext.request.contextPath}/img/common/weather-icons/008-snowy.png" width="60"><b> 눈</b>
						</button>
					</div>

					<div class="chart2">
						<br />
						<p class="topfive">
							<strong>"&nbsp;<span id="day"></span>&nbsp;" 날 선호 음식 Top 5</strong>
						</p>
						<div class="show clearfix">
							<div class="pull-left">
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br>
							</div>
							<div class="pull-left">
								<div id="food"></div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- 탭 화면 끝 -->
		</div>
	</div>
	<!-- //container 종료 -->


	<!-- include :: Javascript 파일 포함 
      <script src="../assets/js/jquery.min.js"></script>
      <script src="../assets/js/bootstrap.min.js"></script>
      
      </body> 바로 위에 위치해야합니다. 
    -->
	<c:import url="../inc/footer.jsp" />
	<script type="text/javascript">
		$(function() {
			$("#men").click(function() {
				$("#male").toggleClass("on off");
			});

			$("#women").click(function() {
				$("#female").toggleClass("on off");
			});

			$("#twenties").click(function() {
				$("#zg").toggleClass("on off");
			});

			$("#thirties").click(function() {
				$("#yg").toggleClass("on off");
			});

			$("#fourties").click(function() {
				$("#xg").toggleClass("on off");
			});

			$("#fifties").click(function() {
				$("#old").toggleClass("on off");
			});

			$("#sunny").click(function() {
				$("#day").html("맑은");
				$("#food").html("<img src='${pageContext.request.contextPath}/img/menu/topsunny.png' width='840' style='margin: 8px 0 0 20px;'>")
			});

			$("#cloudy").click(function() {
				$("#day").html("흐린");
				$("#food").html("<img src='${pageContext.request.contextPath}/img/menu/topcloudy.png' width='825'>")
			});

			$("#rainy").click(function() {
				$("#day").html("비 오는");
				$("#food").html("<img src='${pageContext.request.contextPath}/img/menu/toprainy.png' width='825'>")
			});

			$("#snowy").click(function() {
				$("#day").html("눈 오는");
				$("#food").html("<img src='${pageContext.request.contextPath}/img/menu/topsnowy.png' width='835' style='margin: 10px 0 0 8px;'>")
			});
		});
	</script>
</body>
</html>