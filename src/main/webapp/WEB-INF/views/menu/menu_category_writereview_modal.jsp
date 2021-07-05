<!-- menu_category/ menu_condition/ menu_weather의 리뷰작성(별점, 사진첨부)화면에서 공통적으로 사용되는 모달임 -->
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	 
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
		</div>
	</div>


<c:import url="../inc/footer.jsp" />
<script type="text/javascript">
// $(document).ready(function() {
	$(function () {
		$("#open_modal_btn").click(function(e){
			// 스크립트를 사용하여 특정 modal 강제로 열기
			$("#myModal").modal('show');
			// 아래는 창을 강제로 닫기 처리
			//$("#myModal").modal('hide');
		});
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
</script>
	
</body>
</html>
