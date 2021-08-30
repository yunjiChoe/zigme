<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  
  <!-- bootstrap -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugin/lightbox/css/lightbox.min.css" />
  
  <c:import url="../inc/header.jsp" />
  
  <!-- 메뉴 style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/menu.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  
  <%-- <sec:csrfMetaTags /> 또는 --%>
  <!-- <meta name="_csrf_header" content="${_csrf.headerName}" />
  <meta name="_csrf" content="${_csrf.token}" />  -->
  
	<script type="text/javascript">
	
	function report(reviewNo, userNickname, content, date) {
		
		//console.log("reviewNo :" + reviewNo);
		//console.log("userNickname :" + userNickname);
		//console.log("content :" + content);
		//console.log("date :" + date);
		
		$("#report_no").attr("value", reviewNo);
		$("#report_id").attr("value", userNickname);
		$("#report_content").attr("value", content);
		$("#report_date").attr("value", date);
		
		window.open('${pageContext.request.contextPath}/report_popup', '', 'width=400, height=450, scrollbars=no, toolbar=no, menubar=no, status=no, location=no');
	}
		
	</script>
		
	<style type="text/css">
	
	b {
			font-family: 'S-CoreDream-6Bold';
	}
	
	.modal-body div {
			font-size: 24px;
			color: #fff;
			vertical-align: middle;
    }
    
    textarea {
			margin: 20px auto 5px auto;
			padding: 8px;
	}
	
	#upfile, #fileis {
	border: none;
	color: #4041fe;
	font-size: 12px;
	font-family: 'S-CoreDream-5Medium';
	display: inline;
	margin: 0 0 30px 0;
	padding: 1px 2px;
}
	
	
	
	</style>
</head>
<body>
	<div class="container">
	<!--  include :: container 바로 아래에 있어야합니다 -->
	<c:import url="../inc/navbar.jsp" />
	
	<!-- body 시작  -->
	<div class="body col-lg-7"> 
	 <span class="sub_title">메뉴 추천 > 업종별</span>
	 
	 <!-- 아이콘 목록 -->
	 <div class="sel_item"> 
	    <ul id="menuicon_list"></ul>		    	    
	 </div> <!-- //sel_item 종료 -->
		 
	 <!-- 지도 div -->
	 <div id="menu_map"> 
	 	<span id="listname"></span><div id="map" style="width: 420px; height: 420px; margin: auto;">
	 		<img id="loading_img" src="${pageContext.request.contextPath}/plugin/ajax/loading2.gif" />
	 	</div>
	 </div>
	 <input type="hidden"  id="loc_xy" name="loc_xy"  value="${zigme_user.loc_xy}"/>
	 
	
	</div> <!-- //body 종료  -->
		
		
		
	<!-- 음식점 목록 -->
	<div>
		<div id="list_side" class="col-lg-5">		 	
		</div><!-- //list_side 종료  -->
		
		<div>&nbsp;</div>
		<div id="review_btnarea">		
		<a id="open_modal_btn" class="btn btn-success pull-right hidden_btn"><span class="glyphicon glyphicon-plus"></span></a>			
		&nbsp; <a id="review_prev" class="btn btn-default pull-right hidden_btn"><span class="glyphicon glyphicon-arrow-left"></span></a>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-custom">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">리뷰 쓰기</h4>
			</div>
			<div class="modal-body">
				<form action="upload" id="uploadForm" method="post" enctype="multipart/form-data">
						<!--  display: none으로 변경하여 버튼 커스텀  -->
					<input type="file" id="fileInput" name="file" accept=".jpg, .gif, .png" style="display: none"/>
						<!-- 커스텀 버튼 추가 코드 -->
						<div class="addfile" onclick="onclick=document.all.file.click()">
							<div class="add_receipt_btn">영수증 첨부</div>
						</div>
				</form>
					
					<!-- 파일 이름 표기 -->
					<div class="file_name">
					<div id="fileis"></div>
						<span>
							<input type="text" name="upfile" id="upfile" value="" readonly>
						</span>
					</div>
						<!-- // 파일 이름 표기 -->
					<div class="filemsg">
						<p>당일 방문하신 식당의 영수증을 첨부해주세요!</p>
						<p>신뢰성 높은 리뷰를 위해 방문 확인 후 리뷰 쓰기가 가능합니다.</p>
						<p>리뷰 남겨주시는 그대, 진정한 메이트!</p>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- //Modal -->
	
	</div> <!-- //container 종료 -->	
	

    <c:import url="../inc/footer.jsp" />
    
    <script src="${pageContext.request.contextPath}/plugin/ajax/ajax_helper.js"></script>
    
    <!--  lightbox 플러그인 -->
    <script src="${pageContext.request.contextPath}/plugin/lightbox/js/lightbox.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ca67f5e7cd2510c89ae719dacc5c926"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.star-rating-svg.js"></script>
    
    <script type="text/javascript">
    $(function() {  	
    	// get으로 넘겨받은 URL
    	// http://localhost:8080/Zigme/menu/menu_category_list?sel=001010&menu=라면
		var local_url = decodeURIComponent(location.href);
		
		// 앞 페이지에서 URL로 넘긴 파라미터를 param_str배열에 나눠 담는다. sel = 앞에서 선택한 컨디션이 무엇인지 / menu = 추천된 음식
		var param_str = local_url.substring(local_url.indexOf('?')+1).split('&');
	
		var sel_cate_list = param_str[0].substring(param_str[0].indexOf('=')+1).split(''); // sel 파라미터의 문자열을 split('')를 이용하여 하나씩 배열에 넣는다. 
		var menu_param = param_str[1].substring(param_str[1].indexOf('=')+1); // menu		
		var sel_array = [];		
		
		for (var i=0; i<sel_cate_list.length; i++){
			if(sel_cate_list[i] == '1') sel_array.push(String(i));
		}
		
		/*
		for (var i=0; i<sel_array.length; i++){
			console.log(sel_array[i]);	
		}
		*/
    	
		var label = [""];						 
		var icon_size = [""];
		var menu_list = [""];		
		var menu_txt = [""];
		var review_list = [""];
		var review_count = [""];		
		
		var MARKER_WIDTH, // 기본, 클릭 마커의 너비
		MARKER_HEIGHT, // 기본, 클릭 마커의 높이
		OFFSET_X, // 기본, 클릭 마커의 기준 X좌표
		// OFFSET_Y = MARKER_HEIGHT,  // 기본, 클릭 마커의 기준 Y좌표
		OVER_MARKER_WIDTH, // 오버 마커의 너비
		OVER_MARKER_HEIGHT, // 오버 마커의 높이
		OVER_OFFSET_X, // 오버 마커의 기준 X좌표
		// OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
		SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
		SPRITE_WIDTH, // 스프라이트 이미지 너비
		SPRITE_HEIGHT, // 스프라이트 이미지 높이
		SPRITE_GAP; // 스프라이트 이미지에서 마커간 간격
		
		var markerSize, // 기본, 클릭 마커의 크기
		markerOffset, // 기본, 클릭 마커의 기준좌표
		overMarkerSize, // 오버 마커의 크기
		overMarkerOffset, // 오버 마커의 기준 좌표
		spriteImageSize; // 스프라이트 이미지의 크기
		
		var positions = []; // 마커의 위치 (키워드로 장소검색 API에서 y, x 받아오기)			
		var selectedMarker = null; // 클릭한 마커를 담을 변수
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div
		var map;
		
		var now_click_placeId = "";
    	
		
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
				
					icon_size[0] = req.common[0].icon_size_width;
					icon_size[1] = req.common[0].icon_size_height;
					label = req.common[0].label;
					menu_txt = req.common[0].menu_txt;
					
					// map api variable
					
					MARKER_WIDTH = req.menu[0].MARKER_WIDTH;
					MARKER_HEIGHT = req.menu[0].MARKER_HEIGHT;
					OFFSET_X = req.menu[0].OFFSET_X;
					OFFSET_Y = MARKER_HEIGHT;
					OVER_MARKER_WIDTH = req.menu[0].OVER_MARKER_WIDTH;
					OVER_MARKER_HEIGHT = req.menu[0].OVER_MARKER_HEIGHT;
					OVER_OFFSET_X = req.menu[0].OVER_OFFSET_X;
					OVER_OFFSET_Y = OVER_MARKER_HEIGHT;
					SPRITE_MARKER_URL = '${pageContext.request.contextPath}' + req.menu[0].SPRITE_MARKER_URL;
					SPRITE_WIDTH = req.menu[0].SPRITE_WIDTH;
					SPRITE_HEIGHT = req.menu[0].SPRITE_HEIGHT;
					SPRITE_GAP = req.menu[0].SPRITE_GAP;	
					
					//userComp_arr = req.common[1].loc_xy.split(",");					
					
					var userComp_arr_impl = document.getElementById("loc_xy").value;					
					userComp_arr = userComp_arr_impl.split(", ");
					
					//console.log("userComp_arr " + userComp_arr);
					
					userCompX = userComp_arr[0];
					userCompY = userComp_arr[1];
					
					Search_radius = req.menu[0].Search_radius;
					Search_size =  req.menu[0].Serach_size;
					
					//console.log(userCompX + "," + userCompY);
					
				},
				error: function() {
					alert("일시적인 오류가 발생하였습니다.");
				}
			});
			
			// 음식점 목록 read
			$.ajax ({
				async: false,
				url : "https://dapi.kakao.com/v2/local/search/keyword.json?y=" + userCompY + "&x=" + userCompX + "&radius=" + Search_radius
						+ "&query=" + menu_param + "&size=" + Search_size + "&category_group_code=FD6", 
				method: 'get',
				beforeSend: function (xhr) {			            
		            xhr.setRequestHeader("Authorization","KakaoAK 357888b843d98f32e260abf0e81dfd2a");
		        },
				data : {},
				dataType: 'JSON',
				success: function(req) {				
					menu_list = req.documents;					
				},
				error: function() {
					alert("일시적인 오류가 발생하였습니다.");
				}
			});
			
			for(var i=0; i < menu_list.length; i++) {
				
				// 음식점이 아닌 검색결과는 빼버림
				if(menu_list[i].category_group_code != "FD6")
	    		{
	    			menu_list.pop(menu_list[i]);
	    			i -= 1;
	    			continue;
	    		}
				
				// 리뷰 목록 read
				$.ajax ({
					async: false,
					url :'${pageContext.request.contextPath}/menu/menu_list.review',
					method: 'get',
					data : {
						"reviewPlaceId": menu_list[i].id
					},
					dataType: 'JSON',
					success: function(req) {	
						
						review_list[menu_list[i].id] = req.list;
						review_count[i] = req.count;
						
						 //console.log(review_list);
						// review_data[menu_list[i].id] 각 음식점에 대한 리뷰를 array로 가지고 있음. 
											
					},
					error: function() {
						// 리뷰데이터가 없는 경우 
											
						review_list[menu_list[i].id] = "NOREVIEW";
						review_count[i] = 0;
											
					}
				});
				
				}
				//console.log(review_list[926603562][1].reviewContent);
		}
		
		// review data insert
		function review_insert() {
			var file_name = "";
			var file_no = "";
			var file_yn =  $("#uploadreViewImg").val();
			
			// 첨부한 파일 유무 확인
			if(file_yn) { 
				// 파일 업로드. enctype 때문에 다른 String과 함께 전송이 안되는 것 같음. 
				$.ajax({
	    			async: false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
	    			// 결과를 읽어올 URL
	    			url: '${pageContext.request.contextPath}/upload.review',
	    			// 웹 프로그램에게 데이터를 전송하는 방식.(생략할 경우 get)
	    			method: 'POST',
	   			    enctype: 'multipart/form-data',
	    			processData : false,
	                contentType : false,
	    			// 전달할 조건값은 JSON형식으로 구성
	    			data: new FormData($("#uploadForm")[0]), 
	    			// 읽어올 내용의 형식(생략할 경우 Json)
	    			dataType: 'json',
	    			//beforeSend: function(xhr){
	    			//	xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
	    			//},
	    			// 읽어온 내용을 처리하기 위한 함수
	    			success: function(req) {  
	    				
	    				file_name = req.review_item.userImgPath;
	    				file_no = req.review_item.userImgNo;
	    				//console.log("파일명 " + file_name);
	    				
	    			}
	    		}); // end $.ajax    		
			}			
			else {				
				console.log("첨부파일없음!");
				file_name = "";
				file_no = 0;
			}
    		var mydate = new Date();    		
    		var reviewRegdate = mydate.getFullYear() + "-" + (mydate.getMonth()+1) + "-" + mydate.getDate() + " " + mydate.getHours() + 
    		":" + mydate.getMinutes() + ":" + mydate.getSeconds();
    		    		
    		// form data 전송 
    		$.ajax({
    			async: false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
    			// 결과를 읽어올 URL
    			url: '${pageContext.request.contextPath}/menu/review.write',
    			// 웹 프로그램에게 데이터를 전송하는 방식.(생략할 경우 get)
    			method: 'post',
    			// 전달할 조건값은 JSON형식으로 구성
    			data: {
    				   "reviewContent": $('#review_content').val(),
    				   "reviewScope": $('.user_rating').html(),
    				   "reviewRegdate": reviewRegdate,
    				   "reviewPlaceId": now_click_placeId,
    				   "userNo": ${zigme_user.userNo},
    				   "userImgNo": file_no
    			},
    			// 읽어올 내용의 형식(생략할 경우 Json)
    			dataType: 'json',
    			// 읽어온 내용을 처리하기 위한 함수
    			success: function(req) {
    				
    				location.reload(); // sche-id가 캘린더 플러그인의 값으로 자동등록되기 때문에 
    				//console.log("통신완료" + req.item.scheNo);
    				
    			}
    		}); // end $.ajax
		}
		// ------------------------------------ Modal start ------------------------------------
		
		/* 영수증인증 작업시에 다시 코드 살리는 걸로 dasom_modify 
		$("#open_modal_btn").click(function(e){
			// 스크립트를 사용하여 특정 modal 강제로 열기
			$("#myModal").modal('show');
			// 아래는 창을 강제로 닫기 처리
			//$("#myModal").modal('hide');
			
		});	
		*/

		// 파일명 textbox에 띄우기 --------------------------------------------------------------------------
		// input 요소 중에 name이 file 인 요소의 값이 바뀌었을때 
		$("#uploadreViewImg").on("change", function() {	
			
			$('#review_img').val('');              									// 파일 이름 추출 전 초기화
			
			if(window.FileReader) {
				var filename = $(this)[0].files[0].name;							// 최근 브라우저의 파일명 추출			
			} else { 
				var filename = $(this).val().split('/').pop().split('\\').pop(); 	// 구 브라우저 파일명 추출
			}
			
			// 파일 크기 확인
			if (filename != ''){
				var size = 5;  
				var fileSize = document.getElementById("uploadreViewImg").files[0].size;	// 파일 사이즈 get
				var maxSize = size * 1024 * 1024 // 5MB
				
				if (fileSize > maxSize) {
					alert("첨부파일 사이즈는 " + size + "MB 이내로 등록 가능합니다.");
					$('#uploadreViewImg').val('');
					return;
				}
			}

			 // 추출한 파일명 삽입
			$("#review_img").val(filename);			
			
			$(".modal-header").empty();
			$(".modal-body").empty();
			
			var modal_tag = "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button><h4 class='modal-title'>방문 확인</h4></div>";
			$(".modal-header").html(modal_tag);
			
			modal_tag = "<div class='receiptimg'><img src='${pageContext.request.contextPath}/img/menu/receiptimage_sample.png'></div>"
			+ "<span class='visit_dayandloc'>2021-06-25 <b>메이탄 강남점</b></span><span>방문확인 <img src='${pageContext.request.contextPath}/img/menu/checked.png'>"
			+ "</span><div id='modal_review'><span class='write_review_wrapper'>리뷰 쓰기</span></div>";
			
			$(".modal-body").html(modal_tag);
		
		});
		
		$("#fileInput").on("change", function() {	
			
			$('#uploaded').val(''); 											// 파일 이름 추출 전 초기화
			
			if(window.FileReader) { 								
				var filename = $(this)[0].files[0].name;						// 최근 브라우저의 파일명 추출			
			} else { // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 구 브라우저 파일명 추출
			}
			
			// 파일 확장자 확인 -----------------------------------------------------------------------------
			var ext = filename.split('.').pop().toLowerCase();
			
			// 업로드 가능한 확장자 배열처리, 이 외의 확장자에 대해 알람 창 띄우기
			if($.inArray(ext, ['jpg', 'jpeg', 'gif', 'png']) == -1) {
				alert('jpg, gif, png 파일만 등록이 가능합니다.');
				$('#fileInput').val('');
				return;
			}
			
			// 파일 크기 확인
			if (filename != ''){
				var size = 5;  
				var fileSize = document.getElementById("fileInput").files[0].size;	// 파일 사이즈 get
				var maxSize = size * 1024 * 1024 // 5MB
				
				if (fileSize > maxSize) {
					alert("첨부파일 사이즈는 " + size + "MB 이내로 등록 가능합니다.");
					$('#fileInput').val('');
					return;
				}
			}
			
			// 추출한 파일명 삽입
			$("#uploaded").val(filename);	
			$("#uploaded").ready(function() {
				// $(".fileis").html("첨부된 파일: "); 
				
			});
			
			$(".modal-header").empty();
			$(".modal-body").empty();
			
			var modal_tag = "<button type='button' class='close' data-dismiss='moda' aria-label='Close'><span aria-hidden='true'>&times;</span></button><h4 class='modal-title'>방문 확인</h4></div>";
			$(".modal-header").html(modal_tag);
			
			modal_tag = "<div class='receiptimg'><img src='${pageContext.request.contextPath}/img/menu/receiptimage_sample.png'></div><span class='visit_dayandloc'>2021-06-25 <b>메이탄 강남점</b></span><span>방문확인 <img src='${pageContext.request.contextPath}/img/menu/checked.png'></span><div id='modal_review'><span class='write_review_wrapper'>리뷰 쓰기</span></div>";
			$(".modal-body").html(modal_tag);
		
		});
		
		// ------------------------------------ Modal end ------------------------------------		
		
	   /*
		*  전 페이지에서 '업종별' 선택 아이콘목록을 출력한다.
		*  사용자가 선택한 값을 post로 받아온다. 추후 구현
		*  @param 아이콘갯수 
		*/    	
		function menu_item(count) {    		
        	var result="";
        	
        	for(var i=0; i < count; i++) {
        		result += "<li><div class='menu_iconarea' id='menu_group_" + i + "'><img class='menu_icon' src='${pageContext.request.contextPath}/img/menu/menu_" + i + ".png' width=" 
        		+  icon_size[0] + " height=" + icon_size[1] + "/><span>" + menu_txt[i] + "</span></div></li>";        		
        	}        	
        	$("#menuicon_list").html(result);
       		//document.getElementById("menuicon_list").innerHTML = result;        		
        }
    	
		/* 
		 *  지도 상단의 문구표출 
		 *  @param 추첨된 음식명
		 *	@param 주변 음식점 검색결과 갯수
		 */
    	function menu_listname(name, count) {
    		var result = "\"" + name +  "\" 주변음식점 검색결과 (" + count + ")"; 
    		
    		$("#listname").html(result);
    		//document.getElementById("listname").innerHTML = result;
    	}    	
    	
    	/*
		* 음식점 리스트 생성
		* @param 검색된 음식점 갯수
		*/
    	function list_side(count) {    		
    		var tag = "";
    		var jumsu_star = "";
    		var lstcode = "";    		
    		var jumsu_sum;
    		var jumsu_avr;
    		
    		if(count == 0){
  				review_tag = "<div class='center_css'><img id='noplace_img' src='${pageContext.request.contextPath}/img/menu/noplace.png' /><span id='noreview_txt'>주변에 해당되는 음식점이 없습니다. X( </span></div>";
  				$("#list_side").html(review_tag);  
  				return;
  			}
    		
    		for(var i=0; i < count; i++) {
    		jumsu_sum = 0.0;
    		jumsu_var = 0.0;
    		lstcode = menu_list[i].id; // 음식점 ID 		
    		
    		
    		//////////////////////////////////////// 리뷰 목록 read 
    		
   			if(review_count[i] != 0) {
	  			for(var j=0; j< review_count[i]; j++){
	  				jumsu_sum += review_list[lstcode][j].reviewScope; // 각 리뷰들의 별점 합산 
	  			}
	  			
	  			jumsu_avr = jumsu_sum / review_count[i]; // 별점 평균값
	  			
   			}
   			else { // 리뷰가 없는 경우
   				jumsu_avr = 0;
   			}
    		
    		// 별점 특수기호로 나타냄. 별점은 반올림한다. 
    		if(jumsu_avr >= 4.5) {    			
    			jumsu_star = "★★★★★";    		
    		} else if (jumsu_avr <= 4.4 && jumsu_avr >= 3.5) { // 4.4 ~ 3.5
    			jumsu_star = "★★★★☆";
    		} else if (jumsu_avr <= 3.4 && jumsu_avr >= 2.5) { // 3.4 ~ 2.5
    			jumsu_star = "★★★☆☆";
    		} else if (jumsu_avr <= 2.4 && jumsu_avr >= 1.5) { // 2.4 ~ 1.5
    			jumsu_star = "★★☆☆☆";
    		} else if (jumsu_avr <= 1.4 && jumsu_avr >= 0.5) { // 1.4 ~ 0.5
    			jumsu_star = "★☆☆☆☆";
    		} else {
    			jumsu_star = "☆☆☆☆☆"; // 0.4 이하 
    		}     		
    			
    		var address_name;
    		
    		if(menu_list[i].road_address_name != "") { 
    			address_name = menu_list[i].road_address_name;    		
    		} else {
    			address_name = menu_list[i].address_name;
    		}
    		
    		tag +=  "<div class='menu_listarea' data-index='" + menu_list[i].id + "'><h3><span class='menu_label'>" + label[i] + " </span>" + menu_list[i].place_name + 
    		"</h3><span class='jumsu_starcss'>" + jumsu_avr.toFixed(1) + " " + jumsu_star + " </span>  |  <a class='list_review'> 리뷰 " 
    		+ review_count[i] +"</a><br><span>"+ address_name +"</span></div>";    		
    		}
    		
    		$("#list_side").empty();    		
    		$("#list_side").html(tag);
    	}
    	
    	/*
		* 리뷰 리스트 생성
		* @param 리뷰 갯수
		*/
    	function review_listname(bistro_no) {
	    			    		
	    		var review_tag = "";
	    		var jumsu_star = "";
	    		var review_count = 0;
	    		var review_imgname = "";
	    		var lstcode = bistro_no;
	    		
	    		now_click_placeId = bistro_no; // 현재 음식점의 id를 저장하고, 리뷰 작성 모달에서 사용한다. 음식점 목록을 클릭했을때 업데이트 
	    		
	    		/////////////////////////////////////// 리뷰 목록 read			    		
	    		
	    		for(var i=0; i < menu_list.length; i++) {
	    			
	    			if(menu_list[i].id == bistro_no) {
	    				
		    			var name = menu_list[i].place_name;
		    			var count = 0;
		    			if(review_list[lstcode] != "NOREVIEW") count = review_list[lstcode].length;
			    		
			    		var result = "\"" + name +  "\" 리뷰 (" + count + ")";
			    		
			    		$("#listname").html(result);
			    		$("#list_side").empty();
			    		
			    		// 리뷰가 없는 경우 리뷰 없음 문구 표출
			    		if(count == 0){
			  				review_tag = "<div class='center_css'><img id='noreview_img' src='${pageContext.request.contextPath}/img/menu/noreview.png' /><span id='noreview_txt'>등록된 리뷰가 없습니다. X( </span></div>";
			  				$("#list_side").html(review_tag);  
			  				return;
			  			}
			    		break;
			    		
	    			}
			    		
	    		}
	    		
	    		for(var i=0; i < review_list[lstcode].length; i++) {
	    			
	    		review_imgname = "";
	    		
	    		if(review_list[lstcode][i].userImgNo != null && review_list[lstcode][i].userImgNo != "")
	    		{
	    			// 리뷰 이미지 name load
					$.ajax ({
						async: false,
						url :'${pageContext.request.contextPath}/menu/menu_list.img',
						method: 'get',
						data : {
							"reviewNo": review_list[lstcode][i].reviewNo
						},
						dataType: 'JSON',
						success: function(req) {				
							review_imgname = req.img_name.userImgPath;	
							//console.log(req.img_name);
							
						},
						error: function() {
							//alert("일시적인 오류가 발생하였습니다.");
						}
					});	    			
	    		}
	    			
	    		if(i==0) { // 신고하려는 리뷰 정보를 신고 팝업창으로 넘기기 위한 input 요소 
	       			review_tag = "<input type='hidden' id='report_no' /><input type='hidden' id='report_id' /><input type='hidden' id='report_content' /><input type='hidden' id='report_date' />";
	       		}		

	    			
	   			// 별점 특수기호로 나타냄. 별점은 반올림한다. 
	       		if(review_list[lstcode][i].reviewScope == 5.0 || review_list[lstcode][i].reviewScope == 4.5) {    			
	       			jumsu_star = "★★★★★";    		
	       		} else if (review_list[lstcode][i].reviewScope == 4.0 || review_list[lstcode][i].reviewScope == 3.5) { 
	       			jumsu_star = "★★★★☆";
	       		} else if (review_list[lstcode][i].reviewScope == 3.0 || review_list[lstcode][i].reviewScope == 2.5) {
	       			jumsu_star = "★★★☆☆";
	       		} else if (review_list[lstcode][i].reviewScope == 2.0 || review_list[lstcode][i].reviewScope == 1.5) {
	       			jumsu_star = "★★☆☆☆";
	       		} else if (review_list[lstcode][i].reviewScope == 1.0 || review_list[lstcode][i].reviewScope == 0.5) {
	       			jumsu_star = "★☆☆☆☆";
	       		} else {
	       			jumsu_star = "☆☆☆☆☆";  
	       		}	
			
	   		 
   			// 리뷰에 이미지가 있고 없는 경우에 대한 처리
  			if ( review_imgname != "") {	   			
	   			review_tag += "<div class='review_listarea' data-index='" + i + "'><div class='pull-left'><span class='menu_label'>" + review_list[lstcode][i].userNickname + " </span> "
	      		+ "<span class='jumsu_starcss'>" + review_list[lstcode][i].reviewScope + " " + jumsu_star + "</span><br><span class='review_content'>" 
	      		+ review_list[lstcode][i].reviewContent +"</span></div><div class='pull-right'><a href='" + review_imgname + "' data-lightbox='review_img" + bistro_no + "_" + i 
				+ "'><img class='review_img' src='" + review_imgname 
	      		+ "'/></a></div><div class='clear'></div><div class='review_bottom'>"+ review_list[lstcode][i].reviewRegdate +"   |   <a class='list_review' onclick='report("+ review_list[bistro_no][i].reviewNo + ",\"" + review_list[bistro_no][i].userNickname + "\",\"" + review_list[bistro_no][i].reviewContent + "\",\"" + review_list[bistro_no][i].reviewRegdate +"\" );'>신고</a></div></div>";
  			} else {
  				review_tag += "<div class='review_listarea' data-index='" + i + "'><span class='menu_label'>" + review_list[lstcode][i].userNickname + " </span> "
	      		+ "<span class='jumsu_starcss'>" + review_list[lstcode][i].reviewScope + " " + jumsu_star + "</span><br><span class='review_content'>" 
	      		+ review_list[lstcode][i].reviewContent +"</span><br><div class='review_bottom'>"+ review_list[lstcode][i].reviewRegdate +"   |   <a class='list_review' onclick='report(" + review_list[bistro_no][i].reviewNo + ",\"" + review_list[bistro_no][i].userNickname + "\",\"" + review_list[bistro_no][i].reviewContent + "\",\"" + review_list[bistro_no][i].reviewRegdate +"\" );'>신고</a></div></div>";	  			
	      		}
	    		
        	}        	
    		
	    	$("#list_side").html(review_tag);    		    		
    	}
    	
    	// 동적인 요소 제어
    	/* 리뷰 화면일 경우에만 아래 버튼을 나타낸다 */ 
		$(document).on('mouseenter', '.menu_listarea', function(e){
			$(this).css("background-color", "#eee" );
			$(this).css("cursor", "pointer");
		});
		
		$(document).on('mouseleave', '.menu_listarea', function(e){
			$(this).css("background-color", "#fff" );
		});
		
		$(document).on('click', '.menu_listarea', function(e){			
			review_listname($(this).data("index"));
			$("#review_prev").toggleClass("hidden_btn");
			$("#open_modal_btn").toggleClass("hidden_btn");
		});
		
		$("#review_prev").click(function(){
			$("#review_prev").toggleClass("hidden_btn");
			$("#open_modal_btn").toggleClass("hidden_btn");
			
			// 리뷰 이전페이지 -> 음식점 리스트로 되돌아간다.
			menu_listname(menu_param, menu_list.length);
			list_side(menu_list.length);
			
			// 마커를 선택하여 리뷰리스트에 들어왔다면, 마커 이미지를 초기화 해야한다. 
			map_load();
		});   
	   
		
		//$(document).on('click', '#open_modal_btn', function(e){	
		$("#open_modal_btn").click(function(e){
			
			$("#myModal").modal('show');
			
			var star_value = 0.5;
			var MAX_STAR = 5; 
			var modal_tag = "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button><h4 class='modal-title'>리뷰 쓰기</h4>";
			$(".modal-header").html(modal_tag);
			
			modal_tag = "<textarea name='review_content' id='review_content' cols='50' rows='10' placeholder='오늘의 식사는 어떠셨나요? 메이트님의 소중한 후기를 작성해주세요!(최대 250자)'></textarea>"
			+ "<form method='post' id='uploadForm' enctype='multipart/form-data'><div id='modal_bottom_area'><input type='file' name='uploadreViewImg' id='uploadreViewImg' /><div class='rating'>";
			
	        while( star_value <= MAX_STAR ) {
	        	modal_tag += "<span class='star star_left' value='" + star_value + "'></span>"
	        	modal_tag += "<span class='star star_right' value='" + (star_value + 0.5).toFixed(1) + "'></span>"
	                     star_value += 1;	
	         }

	        modal_tag += "<p class='user_rating'>0.0</p><p> / 5.0</p></div></div><a><span class='write_review_wrapper2'>리뷰 남기기</span></a></form>";
	        
			$(".modal-body").html(modal_tag);
			
			  $(".star").on('click',function(){			
		 		   var idx = $(this).index();
		 		   
		 		   $(".star").removeClass("onn");
		 		     for(var i=0; i<=idx; i++){
		 		        $(".star").eq(i).addClass("onn");
		 		   }
		 		   
		 		   var starValue = $(this).attr("value");
		 		   $('.rating .user_rating').html(starValue);
		 		    return false;
		 		});
			
		});
		
		$(document).on('click', '.write_review_wrapper2', function(e){
			
			// $("#myModal").modal('hide');
			review_insert();
			
		});	

		/*
		* 사용자가 선택한 업종아이콘에 select style   
		*/
		// 모든 동적인 요소가 생성이 된 다음 실행된다. 
		$(document).ready(function(){			
			var item_name = "";
				
			for(var i=0; i<sel_array.length; i++){
					item_name = "#menu_group_" + sel_array[i];					
					$(item_name).addClass("menu_select");										
			}
			
			// a href='#' 클릭 무시 스크립트
	        $('a[href="#"]').click(function(ignore) {
	            ignore.preventDefault();
	        });
		    
	        $(document).on('keyup', '#review_content', function(e){
				
				if($(this).val().length > 250) {
	                $(this).val($(this).val().substring(0, 250));
	                alert("리뷰는 최대 250자까지 작성가능합니다.");
	            }			
			});  	
		    
		});		
		
		
		// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 지도 API <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		
		
		function map_load() {
		
			markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
			markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
			overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
			overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
			spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기
			
			mapOption = {
					center : new kakao.maps.LatLng(userCompY, userCompX), // 지도의 중심좌표 (사용자의 회사 위치 : 회원 테이블에서 가져오기)
					level : 4	// 지도의 확대 레벨
			};
			
			positions.splice(0,positions.length);
			
			$("#map").empty();
			map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			for (var i = 0; i < menu_list.length; i++){
				positions.push(new kakao.maps.LatLng(menu_list[i].y, menu_list[i].x));
			}
			
			// 지도 위에 마커를 표시합니다
			for (var i = 0, len = positions.length; i < len; i++) {
				var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
				originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
				overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
				normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
				clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
				overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표

				// 마커를 생성하고 지도위에 표시합니다
				addMarker(positions[i], normalOrigin, overOrigin, clickOrigin, i);
			}		
		
		}
		

		// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
		function addMarker(position, normalOrigin, overOrigin, clickOrigin, index) {

			// 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
			var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
			overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
			clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);

			// 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : position,
				image : normalImage
			});

			// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
			marker.normalImage = normalImage;

			// 마커에 mouseover 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'mouseover', function() {

				// 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
				// 마커의 이미지를 오버 이미지로 변경합니다
				if (!selectedMarker || selectedMarker !== marker) {
					marker.setImage(overImage);
				}
			});

			// 마커에 mouseout 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'mouseout', function() {

				// 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
				// 마커의 이미지를 기본 이미지로 변경합니다
				if (!selectedMarker || selectedMarker !== marker) {
					marker.setImage(normalImage);
				}
			});

			// 마커에 click 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				
				review_listname(menu_list[index].id);				
				$("#review_prev").removeClass("hidden_btn");
				$("#open_modal_btn").removeClass("hidden_btn");

				// 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
				// 마커의 이미지를 클릭 이미지로 변경합니다
				if (!selectedMarker || selectedMarker !== marker) {

					// 클릭된 마커 객체가 null이 아니면
					// 클릭된 마커의 이미지를 기본 이미지로 변경하고
					!!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

					// 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
					marker.setImage(clickImage);
				}

				// 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
				selectedMarker = marker;
			});
		}

		// MakrerImage 객체를 생성하여 반환하는 함수입니다
		function createMarkerImage(markerSize, offset, spriteOrigin) {
			var markerImage = new kakao.maps.MarkerImage(SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
			markerSize, // 마커의 크기
			{
				offset : offset, // 마커 이미지에서의 기준 좌표
				spriteOrigin : spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
				spriteSize : spriteImageSize
			// 스프라이트 이미지의 크기
			});

			return markerImage;
		}
		
		// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 지도 API END <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		
		
			/** 함수 호출부 */
			data_load();					// 페이지 JSON데이터 load 			
			map_load();						// 지도 draw
    		menu_item(6);    				// 업종별 아이콘 load
    		menu_listname(menu_param, menu_list.length);	// 지도 윗쪽의 label에 표출되는 text
    		list_side(menu_list.length);	// 검색된 주변음식점 갯수
    	});
    </script>
    
</body>
</html>