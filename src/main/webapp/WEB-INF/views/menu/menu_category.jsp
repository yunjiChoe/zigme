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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- 메뉴 style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/menu.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />

</head>

<style type="text/css">
.btn-primary {
	background-color: #4041fe;
}

.btn-primary:hover {
	background-color: #4041fe;
}

#box7 {
	margin-top: -140px;
}
</style>


<body>
	<div class="container" id="menu-container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<!--  body 시작 -->
		<div class="content">
			<p class="sub_title text-center">메뉴 추천 > 업종별</p>
			<br>
			<ul class="menuicon">
							
			</ul>
			
		</div>
		<div class="box1 text-center">
			<br> <br>
			<h3 id="today_menu">오늘의 추천 메뉴는?</h3>
			<br>
			<!-- 토글로 보여주는 곳 -->
			<div class="clearfix">
				<div class="pull-left">
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				</div>
				<div class="imgbox">
					<div id="box1" class="menu-kor " 
						style="width: 60px; height: 60px;">
						<br> <br> <br> <span>한식</span>
					</div>
					<div id="box2" class="menu-yangsik "
						style="width: 60px; height: 60px;">
						<br> <br> <br> <span>양식</span>
					</div>
					<div id="box3" class="menu-jan " 
						style="width: 60px; height: 60px;">
						<br> <br> <br> <span>일식</span>
					</div>
					<div id="box4" class="menu-china "
						style="width: 60px; height: 60px;">
						<br> <br> <br> <span>중식</span>
					</div>
					<div id="box5" class="menu-boonsik "
						style="width: 60px; height: 60px;">
						<br> <br> <br> <span>분식</span>
					</div>
					<div id="box6" class="menu-other"
						style="width: 60px; height: 60px;">
						<br> <br> <br> <span>그 외</span>
					</div>
				</div>
			</div>
			<div id="box7">
				<span id="re-recommend"> <img alt="짜장면" src="${pageContext.request.contextPath}/img/menu/review/210622_001.jpg" height="130">
					<h1>짜장면</h1>
				</span><span class="menu_find_btn">
					<a><button type="button" class="btn btn-ms btn-ttc1" id="btn-retry">&nbsp;&nbsp;재추천&nbsp;&nbsp;</button></a>
						<a href="#" id="submit_link" class="btn btn-primary btn-ttc2 ">주변음식점찾기</a>
				</span>

			</div>
			<div class=" text-center ">
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

			var select_item = [0, 0, 0, 0, 0, 0];									
			var turn = new Array('skyblue', 'white');

			// 요소 숨기기
			$('#box1').hide();
			$('#box2').hide();
			$('#box3').hide();
			$('#box4').hide();
			$('#box5').hide();
			$('#box6').hide();
			$('#box7').hide();
			
			function data_load() {
				
				// 그냥 파일읽기로 가져와도 되는데 그러면 json 파일에 오류가 생기므로 ajax를 이용하여 가져오기로 했다. 
				// 요소 설정 setting 값 read
				$.ajax ({
					async: false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
					url :'${pageContext.request.contextPath}/assets/data/setting.json', 
					method: 'get',
					data : {},
					dataType: 'JSON',
					success: function(req) {											
						menu_txt = req.common[0].menu_txt;					
					},
					error: function() {
						alert("일시적인 오류가 발생하였습니다.");
					}
				});				
			}

			// 토글로 요소를 보여주고 사라지게한다.
			$(document).on('click', '#menu_btn_0', function(e){ // 한식		
				$("#box1").fadeToggle(); 
				
				var imp = select_item[0];
				var result = turn[imp];
				
				$('#menu_btn_0').css("background", result);
				select_item[0]++;				
				
				if (select_item[0] == 2) {
					select_item[0] = 0;
				}

			});
			
			
			$(document).on('click', '#menu_btn_1', function(e){ // 양식
				$("#box2").fadeToggle();

				var imp = select_item[1];
				var result = turn[imp];
				
				$('#menu_btn_1').css("background", result);
				select_item[1]++;
				
				if (select_item[1] == 2) {
					select_item[1] = 0;
				}
				
			});
			
			$(document).on('click', '#menu_btn_2', function(e){ // 일식			
				$("#box3").fadeToggle();
				
				var imp = select_item[2];
				var result = turn[imp];
				
				$('#menu_btn_2').css("background", result);
				select_item[2]++;
				
				if (select_item[2] == 2) {
					select_item[2] = 0;
				}
				
			});

			$(document).on('click', '#menu_btn_3', function(e){ // 중식
				$("#box4").fadeToggle();

				var imp = select_item[3];
				var result = turn[imp];
				
				$('#menu_btn_3').css("background", result);
				select_item[3]++;
				
				if (select_item[3] == 2) {
					select_item[3] = 0;
				}

			});

			$(document).on('click', '#menu_btn_4', function(e){ // 분식
				$("#box5").fadeToggle();

				var imp = select_item[4];
				var result = turn[imp];
				
				$('#menu_btn_4').css("background", result);
				select_item[4]++;
				
				if (select_item[4] == 2) {
					select_item[4] = 0;
				}

			});

			$(document).on('click', '#menu_btn_5', function(e){ // 그외
				$("#box6").fadeToggle();

				var imp = select_item[5];
				var result = turn[imp];
				
				$('#menu_btn_5').css("background", result);
				select_item[5]++;
				
				if (select_item[5] == 2) {
					select_item[5] = 0;
				}

			});

			$("#ran").click(function() {
				$("#box7").toggle();
				$('.box,#box1,#box2,#box3,#box4,#box5,#box6,#today_menu,#ran').remove();
		
			});

			$("#submit_link").click(function(e) {
				e.preventDefault();  // 링크 클릭에 대한 페이지 이동 방지
				
				var sel_str = "";
				
				for(var i=0; i< select_item.length; i++){					
					sel_str += String(select_item[i]);					
				}
				
				var menu = $('#re-recommend h1').html();				
					
				var url = "${pageContext.request.contextPath}/menu/menu_category_list?sel=" + sel_str + "&menu=" + menu;				
				window.location = url;
				
			});
			
			$("#btn-retry").click(function() {
						$('#btn-retry').remove();

						$("#re-recommend").html(
								"<img src='${pageContext.request.contextPath}/img/menu/jjamppong.jpg' height='130'>"
								+ "<h1>짬뽕</h1>");
			});
						
			function cate_item(count) {  
				
	        	var result="<li class='col-md-2 col-sm-3 text-center'></li>";
	        	
	        	for(var i=0; i < count; i++) {
	        		result += "<li class='col-md-1 col-sm-1 col-xs-4' id='menu_"+ i +"'><button id='menu_btn_" + i +"' class='menu-img'>"
	        		+ "<img src='${pageContext.request.contextPath}/img/menu/menu_" + i + ".png' width='70' />"
					+ "</button> <b class='menu_padding'>" + menu_txt[i] +"</b></li>";        		
	        	}
	        	
	        	result += "<li class='col-md-2 col-sm-3'></li>";	        	
	        	$(".menuicon").html(result);	       		        		
	        }
			
			data_load();
			cate_item(6);
						
		});
	</script>

</body>
</html>