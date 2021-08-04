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

<style type="text/css">
.btn-ttc3 {
	margin-top: 70px;
}

.col-md-1 {
	margin: 0 23px;
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
			<p class="sub_title text-center">메뉴 추천 > 건강상태별</p>
			<br>
			<ul class="menuicon">
				
			</ul>
			<br> <br> <br>

		</div>
		<div class="text-center box1">
			<div class="box2">
				<br> <br> <br> <br>
				<p class="condition">
					"&nbsp;<span id="condition-food"></span>&nbsp;"에 좋은 음식은?
				</p>
				<div class=" text-center ">
					<a href="#">
						<button type="button" class="btn  btn-primary btn-block btn-ttc3"
							id="ran">돌리기</button>
					</a>
				</div>
			</div>
			<div id="box7">
				<br> <span id="re-recommend"> <img alt="라면"
					src="${pageContext.request.contextPath}/img/menu/noodel.jpg" width="140">
					<h1>라면</h1>
				</span> <br> <br> <span id="re-re"></span> <span
					class="menu_find_btn"> <a><button type="button"
							class="btn btn-ms btn-ttc1" id="btn-retry">&nbsp;&nbsp;재추천&nbsp;&nbsp;</button></a>					
					<a href="#" id="submit_link" class="btn btn-primary btn-ttc2 ">주변음식점찾기</a>
				</span>

			</div>
		</div>


	</div>

	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />

	<script type="text/javascript">
		$(function() {
			
			var select_item = [0, 0, 0, 0, 0];
			
			// ------------------------------------ JSON Data load --------------------------------------
			/*
			 *  JSON파일을 읽어와 각종 데이터를 세팅하는 함수 
			 */
			 
			function data_load() {
				
				// 요소 설정 setting 값 read
				$.ajax ({
					async: false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
					url :'${pageContext.request.contextPath}/assets/data/setting.json', 
					method: 'get',
					data : {},
					dataType: 'JSON',
					success: function(req) {											
						menu_txt = req.common[0].condition_txt;					
					},
					error: function() {
						alert("일시적인 오류가 발생하였습니다.");
					}
				});				
			}	
			
			$('#box7').hide();
			
			
			$(document).on('click', '#condi_btn_0', function(e){ // cold
				
				select_item.fill(0); // 0으로 배열 초기화. WHY? 컨디션은 toggle하지 않고 다른 버튼을 누르는 형식이니까! 
				select_item[0]++;
				
				$("#condi_0").addClass("select");
				$("#condi_1").removeClass("select");
				$("#condi_2").removeClass("select");
				$("#condi_3").removeClass("select");
				$("#condi_4").removeClass("select");
				$("#condition-food").html(menu_txt[0]).css("color", "#4041fe");
				
			});

			$(document).on('click', '#condi_btn_1', function(e){ // digestion
				
				select_item.fill(0); // 0으로 배열 초기화. WHY? 컨디션은 toggle하지 않고 다른 버튼을 누르는 형식이니까! 
				select_item[1]++;
								
				$("#condi_0").removeClass("select");
				$("#condi_1").addClass("select");
				$("#condi_2").removeClass("select");
				$("#condi_3").removeClass("select");
				$("#condi_4").removeClass("select");
				$("#condition-food").html(menu_txt[1]).css("color", "#4041fe");

			});

			$(document).on('click', '#condi_btn_2', function(e){ // hangover
				
				select_item.fill(0); // 0으로 배열 초기화. WHY? 컨디션은 toggle하지 않고 다른 버튼을 누르는 형식이니까! 
				select_item[2]++;				
				
				$("#condi_0").removeClass("select");
				$("#condi_1").removeClass("select");
				$("#condi_2").addClass("select");
				$("#condi_3").removeClass("select");
				$("#condi_4").removeClass("select");
				$("#condition-food").html(menu_txt[2]).css("color", "#4041fe");

			});

			$(document).on('click', '#condi_btn_3', function(e){ // energy
				
				select_item.fill(0); // 0으로 배열 초기화. WHY? 컨디션은 toggle하지 않고 다른 버튼을 누르는 형식이니까! 
				select_item[3]++;
								
				$("#condi_0").removeClass("select");
				$("#condi_1").removeClass("select");
				$("#condi_2").removeClass("select");
				$("#condi_3").addClass("select");
				$("#condi_4").removeClass("select");
				$("#condition-food").html(menu_txt[3]).css("color", "#4041fe");

			});

			$(document).on('click', '#condi_btn_4', function(e){ // diet
				
				select_item.fill(0); // 0으로 배열 초기화. WHY? 컨디션은 toggle하지 않고 다른 버튼을 누르는 형식이니까! 
				select_item[4]++;
				
				$("#condi_0").removeClass("select");
				$("#condi_1").removeClass("select");
				$("#condi_2").removeClass("select");
				$("#condi_3").removeClass("select");
				$("#condi_4").addClass("select");
				$("#condition-food").html(menu_txt[4]).css("color", "#4041fe");

			});

			$("#ran").click(function() {
				$("#box7").toggle();
				$('.box2,#ran').remove();

			}); 
			
			$("#submit_link").click(function(e) {
				e.preventDefault();  // 링크 클릭에 대한 페이지 이동 방지
				
				var sel_str = "";
				
				for(var i=0; i< select_item.length; i++){					
					sel_str += String(select_item[i]);					
				}
				
				var menu = $('#re-recommend h1').html();				
					
				var url = "${pageContext.request.contextPath}/menu/menu_condition_list.do?sel=" + sel_str + "&menu=" + menu;				
				window.location = url;
				
			});

			$("#btn-retry").click(
					function() {
						$('#re-recommend,#btn-retry').remove();

						$("#re-re").html(
								"<img src='${pageContext.request.contextPath}/img/menu/Haejangguk.jpg' height='130'>"
								+ "<br>" + "<h1>해장국</h1>" + "<br>")

			});
			
			function condi_item(count) {  
				
	        	var result="<li class='col-md-2 col-sm-3 text-center'></li>";
	        	
	        	for(var i=0; i < count; i++) {
	        		result += "<li class='col-md-1 col-sm-1 col-xs-4' id='condi_"+ i +"'><button id='condi_btn_" + i +"' class='condition-img'>"
	        		+ "<img src='${pageContext.request.contextPath}/img/menu/sick_" + i + ".png' width='70' />"
					+ "</button> <b class='condi_padding'>" + menu_txt[i] +"</b></li>";        		
	        	}
	        	
	        	result += "<li class='col-md-2 col-sm-3'></li>";	        	
	        	$(".menuicon").html(result);	       		        		
	        }
			
			data_load();
			condi_item(5);
		});
	</script>

</body>
</html>