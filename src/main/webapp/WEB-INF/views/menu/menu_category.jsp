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
				<!-- 음식DB에서 추천될 음식이 표출될 공간 -->
				<span id="re-recommend"> </span>
				
				<span class="menu_find_btn">
					<a><button type="button" class="btn btn-ms btn-ttc1" id="btn-retry">&nbsp;&nbsp;재추천&nbsp;&nbsp;</button></a>
						<a href="#" id="submit_link" class="btn btn-primary btn-ttc2" >주변음식점찾기</a>
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
			var food_list = [];
			var turn = new Array('skyblue', 'white');
			var food_Name = "";
			var food_imgName = "";
			var non_click_yn = 0;

			// 요소 숨기기
			$('#box1').hide();
			$('#box2').hide();
			$('#box3').hide();
			$('#box4').hide();
			$('#box5').hide();
			$('#box6').hide();
			$('#box7').hide();
			
			// a href='#' 클릭 무시 스크립트
		    $(document).ready(function() {		        
		        $('a[href="#"]').click(function(ignore) {
		            ignore.preventDefault();
		        });
		    }); // 출처: https://rgy0409.tistory.com/3607 [친절한효자손 취미생활]
			
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
			
			function fisherYatesShuffle(arr){
			    for(var i = arr.length - 1; i > 0; i--){
			        var j = Math.floor( Math.random() * (i + 1) ); //random index
			        [arr[i], arr[j]] = [arr[j], arr[i]]; // swap
			    }
			}
			
			function img_load(count){
				
				// 음식이미지명 DB 조회 
				$.ajax ({
					async: false,
					url :'${pageContext.request.contextPath}/menu/menu_food.img',
					method: 'get',
					data : {
						"food_name": food_list[count]						
					},
					dataType: 'JSON',
					success: function(req) {							    
						food_Name = req.food_name;
						food_imgName = req.img_name;						
						//console.log("food_imgName : " + food_imgName);						
					},
					error: function() {		
						
					}
				});	
				
				var img_src = "<img alt='"+ food_Name + "' src='${pageContext.request.contextPath}/img/menu/food/" + food_imgName 
				+ ".jpg' height='130' /><h1>" + food_Name + "</h1>";
				
				$("#re-recommend").html(img_src);
				
				console.log("축 당첨! :" + food_list[count]);
				
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

			$("#ran").click(function() { // 돌리기 버튼
				
				// 업종별 하나도 선택하지 않았을 경우 선택 alert를 표출함
				var non_click_yn = 0;
			
				for(var i=0; i<select_item.length; i++) {
					if(select_item[i] == 1) non_click_yn = 1; // 업종별 하나라도 선택한게 있다면 1로 update
				}
				
				if (non_click_yn == 0){
					alert("업종 분류를 선택해주세요.");
					return;
				}
				
				
				$("#box7").toggle();
				$('.box,#box1,#box2,#box3,#box4,#box5,#box6,#today_menu,#ran').remove();
				$('.menuicon button').prop("disabled", true); // 돌리기 버튼 누른다음엔 업종변경 클릭할 수 없게 버튼 이벤트 막음
				
				// 음식 DB 조회 
				$.ajax ({
					async: false,
					url :'${pageContext.request.contextPath}/menu/menu_list.select',
					method: 'get',
					data : {
						"select_item": select_item,
						"weather_item": "",
						"menu_txt": menu_txt,
						"flag": "cate" // 호출한 메뉴추천 카테고리 (건강상태와 업종별을 구분하기 위함)
					},
					dataType: 'JSON',
					success: function(req) {	
						    
						food_list_impl = req;
						
						//console.log(food_list);
						//console.log(Object.keys(food_list).length-2); // ajax_helper를 통해 pubDate와 rt를 붙여오므로 검색원소의 갯수를 알려면 -2를 해야한다.
						//console.log(food_list[0]);
						
						// 선택해서 가져온 배열에서 음식명만 추출한다. 
						for(var i=0; i < (Object.keys(food_list_impl).length-2); i++) {
							for(var j=0; j < food_list_impl[i].length; j++){
								food_list.push(food_list_impl[i][j].foodName);	
							}
						}						
						//console.log("before :" + food_list);
						fisherYatesShuffle(food_list);			// 음식 리스트 랜덤셔플
						
					},
					error: function() {
											
					}
				});		
				
				img_load(0);
				
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

						img_load(1);
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