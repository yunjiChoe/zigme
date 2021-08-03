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
  
  <!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
  <c:import url="../inc/header.jsp" />
  
  <!-- 메뉴 style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/menu.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  

   <script type="text/javascript">
	
	function report(index, i) {
		
		$("#report_id").attr("value", review_list[i].id);
		$("#report_content").attr("value", review_list[i].content);
		$("#report_date").attr("value", review_list[i].date);
		
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
	
	</style>
</head>
<body>
	<div class="container">
	<!--  include :: container 바로 아래에 있어야합니다 -->
	<c:import url="../inc/navbar.jsp" />	
	
	<!-- body 시작  -->
	<div class="body col-lg-7"> 
	 <span class="sub_title">메뉴 추천 > 날씨별</span>
	 
	 <!-- 아이콘 목록 -->
	 <div class="sel_item"> 
	    <ul id="menuicon_list"></ul>		    	    
	 </div> <!-- //sel_item 종료 -->
		 
	 <!-- 지도 div -->
	 <div id="menu_map"> 
	 	<span id="listname"></span>
	 	<img src="${pageContext.request.contextPath}/img/menu/menu_listmap.png" />
	 </div>		 
	 
	 
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
					<input type="file" id="fileInput" name="file" style="display: none"/>
						<!-- 커스텀 버튼 추가 코드 -->
						<div class="addfile" onclick="onclick=document.all.file.click()">
							<div class="add_receipt_btn">영수증 첨부</div>
						</div>
				</form>
					
					<!-- 파일 이름 표기 -->
					<div class="file_name">
					<div class="fileis"></div>
						<span>
							<input type="text" name="uploaded" id="uploaded" value="" readonly>
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
    
    <!--  lightbox 플러그인 -->
    <script src="${pageContext.request.contextPath}/plugin/lightbox/js/lightbox.min.js"></script>
    <script type="text/javascript">
    $(function() {  	
    	
		var label = [""];						 
		var icon_size = [""];
		var menu_list = [""];		
		var menu_txt = [""];
		
		var sel_array = ["0", "1", "4", "5"];
    	
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
				
					//icon_size[0] = req.common[0].icon_size_width;
					//icon_size[1] = req.common[0].icon_size_height;
					label = req.common[0].label;
					//menu_txt = req.common[0].menu_txt;
				},
				error: function() {
					alert("일시적인 오류가 발생하였습니다.");
				}
			});
			
			// 음식점 목록 read
			$.ajax ({
				async: false,
				url :'${pageContext.request.contextPath}/assets/data/menu_list.json', 
				method: 'get',
				data : {},
				dataType: 'JSON',
				success: function(req) {				
					menu_list = req.doenjangjjigae;					
				},
				error: function() {
					alert("일시적인 오류가 발생하였습니다.");
				}
			});
			
			// 리뷰 목록 read
			$.ajax ({
				async: false,
				url :'${pageContext.request.contextPath}/assets/data/review_list.json', 
				method: 'get',
				data : {},
				dataType: 'JSON',
				success: function(req) {				
					review_list = req.doenjangjjigae;					
				},
				error: function() {
					alert("일시적인 오류가 발생하였습니다.");
				}
			});
			
		}		
		// ------------------------------------ Modal start ------------------------------------
		$("#open_modal_btn").click(function(e){
			// 스크립트를 사용하여 특정 modal 강제로 열기
			$("#myModal").modal('show');
			// 아래는 창을 강제로 닫기 처리
			//$("#myModal").modal('hide');
		});	

		// 파일명 textbox에 띄우기 --------------------------------------------------------------------------
		// input 요소 중에 name이 file 인 요소의 값이 바뀌었을때 
		$("input[name=file]").on("change", function() {	
			
			/** 추후 구현 
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
				var size = 3;  
				var fileSize = document.getElementById("fileInput").files[0].size;	// 파일 사이즈 get
				var maxSize = size * 1024 * 1024 // 3MB
				
				if (fileSize > maxSize) {
					alert("첨부파일 사이즈는 " + size + "MB 이내로 등록 가능합니다.");
					$('#fileInput').val('');
					return;
				}
			}
			
			// 추출한 파일명 삽입
			$("#uploaded").val(filename);		
			**/
			
			$(".modal-header").empty();
			$(".modal-body").empty();
			
			var modal_tag = "<button type='button' class='close' data-dismiss='moda' aria-label='Close'><span aria-hidden='true'>&times;</span></button><h4 class='modal-title'>방문 확인</h4></div>";
			$(".modal-header").html(modal_tag);
			
			modal_tag = "<div class='receiptimg'><img src='${pageContext.request.contextPath}/img/menu/receiptimage_sample.png'></div><span class='visit_dayandloc'>2021-06-25 <b>메이탄 강남점</b></span><span>방문확인 <img src='${pageContext.request.contextPath}/img/menu/checked.png'></span><div id='modal_review'><span class='write_review_wrapper'>리뷰 쓰기</span></div>";
			$(".modal-body").html(modal_tag);
			
			
		});
		
		// ------------------------------------ Modal end ------------------------------------		
		
	   /*
		*  날씨 값을 post로 받아온다. 추후 구현
		*  @param 아이콘갯수 
		*/    	
		function weather_item(item) {  
			
       		item = "<font color='#f00'>" + item + "</font>"; 
       		result = "<li class='weather_title'>현재 날씨는[" + item + "] 입니다. </li>";
			$("#menuicon_list").html(result);
       		
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
    		
    		for(var i=0; i < count; i++) {
    		
    		// 별점 특수기호로 나타냄. 별점은 반올림한다. 
    		if(menu_list[i].jumsu >= 4.5) {    			
    			jumsu_star = "★★★★★";    		
    		} else if (menu_list[i].jumsu <= 4.4 && menu_list[i].jumsu >= 3.5) { // 4.4 ~ 3.5
    			jumsu_star = "★★★★☆";
    		} else if (menu_list[i].jumsu <= 3.4 && menu_list[i].jumsu >= 2.5) { // 3.4 ~ 2.5
    			jumsu_star = "★★★☆☆";
    		} else if (menu_list[i].jumsu <= 2.4 && menu_list[i].jumsu >= 1.5) { // 2.4 ~ 1.5
    			jumsu_star = "★★☆☆☆";
    		} else if (menu_list[i].jumsu <= 1.4 && menu_list[i].jumsu >= 0.5) { // 1.4 ~ 0.5
    			jumsu_star = "★☆☆☆☆";
    		} else {
    			jumsu_star = "☆☆☆☆☆"; // 0.4 이하 
    		}     		
    			
    		tag +=  "<div class='menu_listarea' data-index='" + menu_list[i].no + "'><h3><span class='menu_label'>" + label[i] + " </span>" + menu_list[i].name + 
    		"</h3><span class='jumsu_starcss'>" + menu_list[i].jumsu + " " + jumsu_star + " </span>  |  <a class='list_review'> 리뷰 " 
    		+ menu_list[i].review +"</a><br><span>"+ menu_list[i].address +"</span></div>";    		
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
	    		//console.log("review_list.length " + review_list.length);
	    		//console.log("menu_list.length " + menu_list.length);
	    		
	    		for(var i=0; i < menu_list.length; i++) {
	    			
		    		if(menu_list[i].no == bistro_no) {
		    			var name = menu_list[i].name;
			    		var count = menu_list[i].review;
			    		
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
	    		
	    		for(var i=0; i < review_list.length; i++) {
	    			
	    		if(i==0) {
	       			review_tag = "<input type='hidden' id='report_id' /><input type='hidden' id='report_content' /><input type='hidden' id='report_date' />";
	       		}
	    		
	    		// 서로 같은 음식점 id 인경우에만 리뷰를 출력한다. 
	    		if(review_list[i].no == bistro_no) {
	    			
		   			// 별점 특수기호로 나타냄. 별점은 반올림한다. 
		       		if(review_list[i].review_jumsu == 5.0 || review_list[i].review_jumsu == 4.5) {    			
		       			jumsu_star = "★★★★★";    		
		       		} else if (review_list[i].review_jumsu == 4.0 || review_list[i].review_jumsu == 3.5) { 
		       			jumsu_star = "★★★★☆";
		       		} else if (review_list[i].review_jumsu == 3.0 || review_list[i].review_jumsu == 2.5) {
		       			jumsu_star = "★★★☆☆";
		       		} else if (review_list[i].review_jumsu == 2.0 || review_list[i].review_jumsu == 1.5) {
		       			jumsu_star = "★★☆☆☆";
		       		} else if (review_list[i].review_jumsu == 1.0 || review_list[i].review_jumsu == 0.5) {
		       			jumsu_star = "★☆☆☆☆";
		       		} else {
		       			jumsu_star = "☆☆☆☆☆";  
		       		}	
		   			
	   			// 리뷰에 이미지가 있고 없는 경우에 대한 처리
	  			if (review_list[i].img != "") {	   			
		   			review_tag += "<div class='review_listarea' data-index='" + i + "'><div class='pull-left'><span class='menu_label'>" + review_list[i].id + " </span> "
		      		+ "<span class='jumsu_starcss'>" + review_list[i].review_jumsu + " " + jumsu_star + "</span><br><span class='review_content'>" 
		      		+ review_list[i].content +"</span></div><div class='pull-right'><a href='${pageContext.request.contextPath}/img/menu/review/" + review_list[i].img + "' data-lightbox='review_img" + bistro_no + "_" + i 
					+ "'><img class='review_img' src='${pageContext.request.contextPath}/img/menu/review/" + review_list[i].img 
		      		+ "'/></a></div><div class='clear'></div><div class='review_bottom'>"+ review_list[i].date +"   |   <a class='list_review' onclick='report("+ bistro_no +"," + i +" );'>신고</a></div></div>";
	  			} else {
	  				review_tag += "<div class='review_listarea' data-index='" + i + "'><span class='menu_label'>" + review_list[i].id + " </span> "
		      		+ "<span class='jumsu_starcss'>" + review_list[i].review_jumsu + " " + jumsu_star + "</span><br><span class='review_content'>" 
		      		+ review_list[i].content +"</span><br><div class='review_bottom'>"+ review_list[i].date +"   |   <a class='list_review' onclick='report("+ bistro_no +"," + i +");'>신고</a></div></div>";	  			
		      		}
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
			menu_listname("된장찌개", menu_list.length);
			list_side(menu_list.length);
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
			});
	   
		$(document).on('click', '#modal_review', function(e){			
			var modal_tag = "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button><h4 class='modal-title'>리뷰 쓰기</h4>";
			$(".modal-header").empty();
			$(".modal-header").html(modal_tag);
			
			modal_tag = "<textarea name='리뷰작성창' cols='50' rows='10' wrap='hard' placeholder='오늘의 식사는 어떠셨나요? 메이트님의 소중한 후기를 작성해주세요!(최대 250자)'>${board.content}</textarea><form action='upload' id='uploadForm' method='post' enctype='multipart/form-data'><input type='file' name='file' style='display: none' /></form><div class='addfile' onclick='onclick=document.all.file.click()'><img class='addfile_btn' src='${pageContext.request.contextPath}/img/menu/addfile_btn.png'></div><a href='#'><span class='write_review_wrapper2'>리뷰 남기기</span></a>";
			//modal_tag = "<textarea name='리뷰작성창' cols='50' rows='10' wrap='hard' placeholder='오늘의 식사는 어떠셨나요? 메이트님의 소중한 후기를 작성해주세요!(최대 250자)'>${board.content}</textarea><form action='upload' id='uploadForm' method='post' enctype='multipart/form-data'><input type='file' name='file' style='display: none' /></form><div class='addfile' onclick='onclick=document.all.file.click()'><img class='addfile_btn' src='../img/menu/addfile_btn.png'></div><div class='rating'><span class='star star_left on' value='0.5'></span><span class='star star_right on' value='1.0'></span><span class='star star_left on' value='1.5'></span><span class='star star_right on' value='2.0'></span><span class='star star_left on' value='2.5'></span><span class='star star_right' value='3.0'></span><span class='star star_left' value='3.5'></span><span class='star star_right' value='4.0'></span><span class='star star_left' value='4.5'></span><span class='star star_right' value='5.0'></span><p class= user_rating>2.5</p><p>/5.0</p></div><a href='#'><span class='write_review_wrapper2'>리뷰 남기기</span></a>";
			$(".modal-body").empty();
			$(".modal-body").html(modal_tag);
		});
		
		$(document).on('click', '.write_review_wrapper2', function(e){
			$("#myModal").modal('hide');
		});
		
		$(".star").on('click',function(){
			   var idx = $(this).index();
			   $(".star").removeClass("on");
			     for(var i=0; i<=idx; i++){
			        $(".star").eq(i).addClass("on");
			   }
			   
			   var starValue = $(this).attr("value");
			   $('.rating .user_rating').html(starValue);
			   return false;
		});
	   
			/** 함수 호출부 */
			data_load();					// 페이지 JSON데이터 load 		
			weather_item("비");    		// 날씨별 아이콘 load
    		menu_listname("된장찌개", menu_list.length);	// 지도 윗쪽의 label에 표출되는 text
    		list_side(menu_list.length);    // 검색된 주변음식점 갯수
    	});
    </script>
    
</body>
</html>