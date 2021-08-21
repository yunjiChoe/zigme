<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- 메뉴 style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/menu.css" />

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

#box7 {
	margin-top: 50px;
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
				<p class="sub_title text-center">메뉴 추천 > 날씨별</p>
				<br>
				<p class=" text-center sub_text">
					현재 날씨는 [<span class="csky"></span>] 입니다.
				</p>
				<input type="hidden"   id="loc_xy" name="loc_xy"  value="${zigme_user.loc_xy}"/>
			</div>
		</div>
		<div class="text-center box1" id="weather_food">
			<div class="box2">
				<h3>오늘의 추천 메뉴는?</h3>
				<br> <br>
				<div id="icon">
					<img id="wicon" src="" alt="Weather icon" width="130">
				</div>
				<br>

			</div>

			<div id="box7">
				<!-- 음식DB에서 추천될 음식이 표출될 공간 -->
				<span id="re-recommend"> </span> <span class="menu_find_btn">
					<a><button type="button" class="btn btn-ms btn-ttc1"
							id="btn-retry">&nbsp;&nbsp;재추천&nbsp;&nbsp;</button></a> <a href="#"
					id="submit_link" class="btn btn-primary btn-ttc2">주변음식점찾기</a>
				</span>
			</div>
			<div class=" text-center">
				<a href="#">
					<button type="button" class="btn  btn-primary btn-block btn-ttc3"
						id="ran">돌리기</button>
				</a>
			</div>
		</div>
	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />

	<script type="text/javascript">
		$(function() {

			var weather = [];
			var food_list = [];
			var food_Name = "";
			var food_imgName = "";

			// a href='#' 클릭 무시 스크립트
			$(document).ready(function() {
				$('a[href="#"]').click(function(ignore) {
					ignore.preventDefault();
				});
			}); // 출처: https://rgy0409.tistory.com/3607 [친절한효자손 취미생활]

			// ------------------------------------ JSON Data load --------------------------------------
			/*
			 *  JSON파일을 읽어와 각종 데이터를 세팅하는 함수 
			 */			

			function fisherYatesShuffle(arr) {
				for (var i = arr.length - 1; i > 0; i--) {
					var j = Math.floor(Math.random() * (i + 1)); //random index
					[ arr[i], arr[j] ] = [ arr[j], arr[i] ]; // swap
				}
			}

			function img_load(count) {

				// 음식이미지명 DB 조회 
				$.ajax({
					async : false,
					url : '${pageContext.request.contextPath}/menu/menu_food.img',
					method : 'get',
					data : {
						"food_name" : food_list[count]
					},
					dataType : 'JSON',
					success : function(req) {
						food_Name = req.food_name;
						food_imgName = req.img_name;
						//console.log("food_imgName : " + food_imgName);						
					},
					error : function() {
	
					}
				});

				var img_src = "<img alt='"+ food_Name + "' src='${pageContext.request.contextPath}/img/menu/food/" + food_imgName 
				+ ".jpg' height='130' /><h1>"
						+ food_Name + "</h1>";

				$("#re-recommend").html(img_src);

				console.log("축 당첨! :" + food_list[count]);

			}

			$("#ran").click(function() {				
				
				$("#box7").toggle();
				$('.box2,#ran').remove();				
				
				var weather_item = $(".csky").html();
				
				console.log("weather_item >>> " + weather_item);
					
				// 음식 DB 조회 
				$.ajax ({
					async: false,
					url :'${pageContext.request.contextPath}/menu/menu_list.select',
					method: 'get',
					data : {
						"select_item": "",
						"weather_item": weather_item,
						"menu_txt": "NONE",
						"flag": "weather" // 호출한 메뉴추천 카테고리 (건강상태와 업종별을 구분하기 위함)
					},
					dataType: 'JSON',
					success: function(req) {	
						    
						food_list_impl = req;						
						
						// 선택해서 가져온 배열에서 음식명만 추출한다. 
						for(var i=0; i < (Object.keys(food_list_impl).length-2); i++) {
							for(var j=0; j < food_list_impl[i].length; j++){
								food_list.push(food_list_impl[i][j].foodName);	
							}
						}						
						
						fisherYatesShuffle(food_list);			// 음식 리스트 랜덤셔플
						
					},
					error: function() {
						
					}
				});		
				
				img_load(0);

			}); 
			
			$("#submit_link").click(function(e) {
				e.preventDefault();  // 링크 클릭에 대한 페이지 이동 방지
				
				var menu = $('#re-recommend h1').html();				
					
				var url = "${pageContext.request.contextPath}/menu/menu_weather_list?menu=" + menu;				
				window.location = url;
				
			});

			$("#btn-retry").click(function() {
				$('#btn-retry').remove();

				img_load(1);
			});		
		
			
			
			var  x = document.getElementById("loc_xy").value;
			console.log(x);
			
			var loc_xy = x.split(", ");
			console.log(loc_xy[0]);
			console.log(loc_xy[1]);

			
		$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat='+ loc_xy[1] +"&lon="+ loc_xy[0] +'&APPID=c689a368e2df5f6e70c8758bec4b5496&units=metric',
		function(data) {
			var $temp = data.list[0].main.temp;
			var $sky = data.list[0].weather[0].main;
			var iconcode = data.list[0].weather[0].icon;

			//API에서 저녁에오는 XXn 의 값도 낮의 이미지로 출력해주기 위해 n(ight) -> d(ay)로 변경함 
			//console.log("iconcode" + iconcode);
			if (iconcode.substring(2, 3) == 'n') {
				iconcode = iconcode.substring(0, 2) + 'd';
			}

			switch (iconcode) {
			case '50d':
				iconname = "007-windy";
				break;
			case '13d':
				iconname = "008-snowy";
				break;
			case '11d':
			case '10d':
			case '09d':
				iconname = "009-rainy";
				break;
			case '04d':
			case '03d':
			case '02d':
				iconname = "005-cloudy";
				break;
			case '01d':
				iconname = "002-sunny";
				break;
			}

			var iconurl = "${pageContext.request.contextPath}/img/common/weather-icons/"
					+ iconname + ".png";

			if ($sky == "Clouds")
				$sky = "흐림";
			else if ($sky == "Rain")
				$sky = "비";
			else if ($sky == "Snow")
				$sky = "눈";
			else if ($sky == "Haze")
				$sky = "대기오염";
			else
				$sky = "맑음";

			$('#wicon').attr('src', iconurl);
			$('.ctemp').append($temp + "°C");
			$('.csky').append($sky);

		});
		
		$('#box7').hide();
		
	});
	</script>

</body>
</html>