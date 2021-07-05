<!-- menu_category/ menu_condition/ menu_weather의 영수증 첨부 버튼이 있는 화면(첨부 전) 공통적으로 사용되는 모달임 -->
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
		/** 웹폰트 설정 */
		@font-face {
			font-family: 'S-CoreDream-4Regular';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
			font-weight: normal;
			font-style: normal;
		}

		* {
        font-family: 'S-CoreDream-4Regular';
        } 
        .modal-dialog {
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
			margin: 0 auto; /** 중간정렬필요 */
		}
		
		
	</style>
</head>
<body>
<div class="container">
	<!--  include :: container 바로 아래에 있어야합니다 -->
	<c:import url="../inc/navbar.jsp" />
	
	<h1 class="page-header">업종별 메뉴추천 영수증 첨부 Modal</h1>
	<!-- 링크로 모달 열기 -->
	<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#myModal">open modal</a>
	<!-- 스크립트로 모달 열기 -->
	<button id="open_modal_btn" class="btn btn-info">open by script</button>


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
			// $(".fileis").html("첨부된 파일: "); 
			
		});
	
	});
});	
</script>
     
</body>
</html>