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
	</div>
</div>

<!-- include :: Javascript 파일 포함 
      <script src="../assets/js/jquery.min.js"></script>
      <script src="../assets/js/bootstrap.min.js"></script>
      
      </body> 바로 위에 위치해야합니다. 
    -->
    <c:import url="../inc/footer.jsp" />
<script type="text/javascript">
	$(function () {
		$("#open_modal_btn").click(function(e){
			// 스크립트를 사용하여 특정 modal 강제로 열기
			$("#myModal").modal('show');
			// 아래는 창을 강제로 닫기 처리
			//$("#myModal").modal('hide');
		})
	})
</script>

</body>
</html>
