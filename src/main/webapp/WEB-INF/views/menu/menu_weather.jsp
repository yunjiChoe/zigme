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

<style type="text/css">

.btn-ttc3 {
	margin-top: 10px;
}

.box7 img {
	background-color: #fff;
	border: 1px solid #000;
	margin: 4px;
}

.btn-primary {
	background-color: #4041fe;
}

.btn-primary:hover {
	background-color: #4041fe;
}

</style>

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />

</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content">
			<div>
				<p class="sub_title text-center" >메뉴 추천 > 날씨별</p><br>
				<p class=" text-center sub_text" >현재 날씨는 [<span class="csky"></span>] 입니다.</p>
				<div class="text-center box1" id="weather_food">
					<div class="box2">
						<h3>오늘의 추천 메뉴는?</h3>
						<br> <br><div id="icon"><img id="wicon" src="" alt="Weather icon" width="130"></div> <br>
						<div class=" text-center ">
							<a href="#">
								<button type="button"
									class="btn  btn-primary btn-block btn-ttc3" id="ran">돌리기</button>
							</a>
						</div>
					</div>
					<div id="box7"><br>
						<span id="re-recommend"><img alt="된장찌개"
							src="${pageContext.request.contextPath}/img/menu/doenjan.jpg" width="140">
							<h1>된장찌개</h1></span> <br><br><span id="re-re"></span> <span class="menu_find_btn">
							<a><button type="button" class="btn btn-ms btn-ttc1"
									id="btn-retry">&nbsp;&nbsp;재추천&nbsp;&nbsp;</button></a> <a
							href="${pageContext.request.contextPath}/menu/menu_weather_list"><button type="button"
									class="btn  btn-primary btn-ttc2 ">주변음식점찾기</button></a>
						</span>

					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />

	<script type="text/javascript">
		$(function() {
			var weather=[];

			//var result="";
			$('#box7').hide();

			$("#ran").click(function() {
				$("#box7").toggle();
				$('.box2,#ran').remove();

			});
			
			$("#btn-retry").click(function() {
				$('#re-recommend,#btn-retry').remove();

					$("#re-re").html("<img src='${pageContext.request.contextPath}/img/menu/ham.jpg' height='130'>"+"<br>"+"<h1>부대찌개</h1>"+"<br>")
	
				});			
			
			});
		$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat=37.56826&lon=126.977829&APPID=c689a368e2df5f6e70c8758bec4b5496&units=metric'
				,function(data){
			var $temp = data.list[0].main.temp;
			var $sky = data.list[0].weather[0].main;			
			var iconcode = data.list[0].weather[0].icon;
			var iconurl = "${pageContext.request.contextPath}/img/common/weather-icons/" + iconcode + ".png";
			
			if($sky == "Clouds")
				$sky = "흐림";
		   
			else if($sky == "Rain")
				$sky = "비";
			else if($sky == "Snow")
				$sky = "눈";
			else if($sky == "Haze")
				$sky = "대기 오염";
			else
				$sky = "맑음";
			
			$('#wicon').attr('src', iconurl);
			$('.ctemp').append($temp + "°C");			
			$('.csky').append($sky);			
		});
	
	</script>

</body>
</html>