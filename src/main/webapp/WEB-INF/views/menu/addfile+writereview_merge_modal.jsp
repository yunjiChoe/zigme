<!-- menu_category/ menu_condition/ menu_weather의 방문확인화면(영수증 첨부 후) 공통적으로 사용되는 모달임 -->
<!--
     Date : 2021/06/11
     Writer : 2조
     Content : header-navbar-footer include
     version : 초본 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">

<head> 
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css" />
    <script src="../assets/js/bootstrap.min.js"></script>
	 
	<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
	<c:import url="../inc/header.jsp" />
  
	<style type="text/css">

		/** 모달 공통 style */
		* {
        font-family: 'S-CoreDream-4Regular';
        } 
        
        .modal-dialog {
        	width: 430px;
        }
        .modal-content {
		    position: relative;
		    top: 200px;
		    width: 430px;
		}
		
		.modal-title {
			color: #4041fe;
			vertical-align: middle;
			font-size: 16px;
			font-family: 'S-CoreDream-5Medium'
		}
		
		.modal-body {
			padding: 0;
		}
		.modal-title, .modal-body{
			text-align: center;
		}
		/** // 모달 공통 style 끝 */
		
		/** 1st modal style */
		.add_receipt_btn {
			display: block;
			padding: 20px 5px;
			margin: 45px auto 15px auto;
			width: 250px;
			height: 70px;
			background-color: #4041fe;
			border-radius: 50px;
			font-size: 24px;
			color: #fff;
			vertical-align: middle;
			cursor: pointer;
		}
		
		.modal-body p {
			margin-bottom: 5px;
			line-height: 14px;
			font-size: 14px;
			color: #404040;
		}
		
		.modal-body p:nth-child(3) {
			color: #4041fe;
			font-size: 14px;
			font-weight: 900;
			padding-top: 30px;
			padding-bottom: 40px;
		}
		
		#uploaded, .fileis {
			border: none;
			font-size: 12px;
			font-family: 'S-CoreDream-5Medium';
			display: inline;
			margin: 0 0 30px 0;
		}
		
		.file_name {
			text-align: center; /*중간정렬필요*/
		}
		/** // 1st modal style 끝 */
		
		/** 2nd modal 첨부 확인 style */
		.receiptimg {
			padding: 20px;
		}
		
		.write_review_wrapper {
			display: block;
			padding: 20px 5px;
			margin: 45px auto;
			width: 250px;
			height: 70px;
			background-color: #4041fe;
			border-radius: 50px;
		}
		
		.modal-body a {
			font-size: 24px;
			color: #fff;
			vertical-align: middle;
		}
		
		.modal-body .visit_dayandloc {
			color: #4041fe;
		}
		
		b {
			font-family: 'S-CoreDream-6Bold';
		}
		
		.modal-body span img {
			height: 12px;
		}
		/** // 영수증 첨부 확인 style 끝 */
		
		
		/** 리뷰 작성 style */
		textarea {
			margin: 20px auto 5px auto;
			padding: 8px;
		}
		.modal-title, .modal-body{
			text-align: center;
		}
		
		.write_review_wrapper {
			display: block;
			padding: 10px 5px;
			margin: 80px auto 40px auto;
			width: 150px;
			height: 40px;
			background-color: #4041fe;
			border-radius: 50px;
			font-size: 16px;
			color: #fff;
			vertical-align: middle;
			text-align: center;
		}
		/** 파일 첨부 관련 속성 */
		.addfile_btn {
			margin: 0 20px 20px 23px;
			width: 30px;
 			background-repeat: no-repeat;
			background-size: contain;
			cursor: pointer;
			float: left;
		}
		/** 별점 부여 관련 속성 */
		.rating {
			display: flex;
			width: 200px;
			margin: 0 0px 0 0;
			padding: 0 ;
			float: right;
		}
		
		.star{
			display:inline-block;
			width: 10px;
			height: 30px;
			cursor: pointer;
		}
		.star_left{
			background: url("../img/menu/rating_empty.png") no-repeat 0 0; 
			background-size: 20px; 
			margin-right: -0.1px;
		}
		.star_right{
			background: url("../img/menu/rating_empty.png") no-repeat -10px 0; 
			background-size: 20px; 
			margin-left: -0.1px;
		}
		.star.on{
			background-image: url("../img/menu/rating_full.png");
		}
		
		.rating .user_rating {
			margin: 0 0px 0 10px;
			padding: 2px;
			font-family: 'S-CoreDream-6Bold';
			font-size: 14px;
			color: #4041fe;
			vertical-align: middle;
			float: right;
		}
		.rating p {
			display: inline;
			margin: 0 0px 0 2px;
			padding: 2px;
			font-family: 'S-CoreDream-4Regular';
			font-size: 14px;
			color: #4041fe;
			vertical-align: middle;
			float: right;
		}
		/** // 리뷰 작성 style 끝 */

		
	</style>
</head>
<body>
<div class="container">
	<!--  include :: container 바로 아래에 있어야합니다 -->
	<c:import url="../inc/navbar.jsp" />
	
	<h1 class="page-header">업종별 메뉴추천 방문 확인 Modal</h1>
	<!-- 링크로 모달 열기 -->
	<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#myModal">open modal</a>
	<!-- 스크립트로 모달 열기 -->
	<button id="open_modal_btn" class="btn btn-info">open by script</button>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-custom">
		<div class="modal-content">
			<!-- 첫번째 모달 페이지 : 리뷰 작성 전 영수증 인증을 위해 영수증 사진 파일을 첨부하는 페이지 -->
			<div class="1stModal changeModal">
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
					<div class="fileis"></div>
					<div class="file_name">
						<span>
							<input type="text" name="uploaded" id="uploaded" readonly />
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
				<!-- // 첫번째 모달 페이지 끝 -->
				<!-- 두번째 모달 페이지 : 첨부된 영수증 사진과 사진에서 불러온 날짜/음식점 정보를 표시하고 리뷰를 작성하기 위한 버튼을 제공하는 페이지 -->
				<div class="2ndModal changeModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">방문 확인</h4>
			</div>
			<div class="modal-body">
				<div class="receiptimg">
					<img src="../img/menu/receiptimage_sample.png">
				</div>
				<span class="visit_dayandloc">2021-06-25 <b>메이탄 강남점</b></span>
				<span>방문확인 <img src="../img/menu/checked.png"></span>
				<a href="#">
				<span class="write_review_wrapper">리뷰 쓰기</span>
				</a>
			</div>
			</div>
			<!-- // 두번째 모달 페이지 끝 -->
			<!-- 세번째 모달 페이지 시작 -->
			<div class=3rdModal>
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">리뷰 쓰기</h4>
			</div>
			<div class="modal-body">
				<!-- ${board.content} 부분에 데이터 전송 관련 코드가 들어갈 것으로 보임.
				현재 시점에서 해당 내용 작성해도 브라우저 테스트시 무방한 것으로 보여 추가함 -->
				<textarea name="리뷰작성창" cols="50" rows="10" wrap="hard"
				placeholder="오늘의 식사는 어떠셨나요? 메이트님의 소중한 후기를 작성해주세요!(최대 250자)">${board.content}</textarea>
				<form action="upload" id="uploadForm" method="post" enctype="multipart/form-data">
					<!--  display: none으로 변경 후 버튼 커스텀 예정 -->
					<input type="file" name="file" style="display: none" />
				</form>
				<!-- 커스텀 버튼 추가 코드 -->
				<div class="addfile" onclick="onclick=document.all.file.click()">
					<img class="addfile_btn" src="../img/menu/addfile_btn.png">
				</div>
				<!-- 별점 주기 -->
				<div class="rating">
					  <span class="star star_left on" value="0.5"></span>
					  <span class="star star_right on" value="1.0"></span>
					
					  <span class="star star_left on" value="1.5"></span>
					  <span class="star star_right on" value="2.0"></span>
					
					  <span class="star star_left on" value="2.5"></span>
					  <span class="star star_right" value="3.0"></span>
					
					 <span class="star star_left" value="3.5"></span>
					 <span class="star star_right" value="4.0"></span>
					
					 <span class="star star_left" value="4.5"></span>
					 <span class="star star_right" value="5.0"></span>
					 <p class= user_rating>2.5</p><p>/5.0</p>
					
				</div>	<!-- // 별점 주기 -->
				<a href="#">
				<span class="write_review_wrapper">리뷰 남기기
				</span>
				</a>
			</div> 
			</div>
			<!-- // 세번째 모달 페이지  -->
			
		</div> <!-- // modal-content -->
	</div>
</div>

    <c:import url="../inc/footer.jsp" />
    
<script type="text/javascript">
$(function() {

	$("#open_modal_btn").click(function(e){
		// 스크립트를 사용하여 특정 modal 강제로 열기
		$("#myModal").modal('show');
		// 아래는 창을 강제로 닫기 처리
		//$("#myModal").modal('hide');
	});
	
	/** 3rd Modal Script */
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
	/** 3rd Modal Script End */
	
	/** 1st Modal script */
	// 파일명 textbox에 띄우기 --------------------------------------------------------------------
	// input 요소 중에 name이 file 인 요소의 값이 바뀌었을때 
	$("input[name=file]").on("change", function() {
		
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
			$(".fileis").html("첨부된 파일: "); 
			
		});
		/** 1st Modal Script End */
		
	});
	

	
		// 모달 클래스명을 이용하여 모달 내부 내용 변경하기
			$(document).ready(function(){
				$(".2ndModal").empty();
				$(".3rdModal").empty();
			});		
		
			$("input[name=file]").on('change',function(){
				$(".1stModal").empty();
				$(".2ndModal").addClass(".2ndModal");
			});
});	
</script>

</body>
</html>
