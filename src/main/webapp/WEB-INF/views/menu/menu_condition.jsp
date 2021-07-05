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
			<ul class="menuicon  ">
				<li class="col-md-2 col-sm-3 text-center"></li>
				<li class="col-md-1 col-sm-1 col-xs-4" id="condi_one"><button id="cold"
						class="condition-img">
						<img src="${pageContext.request.contextPath}/img/menu/sick_0.png" width="70" />
					</button> <b class="condi_padding"> 감기몸살</b></li>
				<li class="col-md-1 col-sm-1 col-xs-4" id="condi_two"><button id="digestion"
						class="condition-img">
						<img src="${pageContext.request.contextPath}/img/menu/sick_1.png" width="70" />
					</button> <b class="condi_padding"> 소화불량</b></li>
				<li class="col-md-1 col-sm-1 col-xs-4" id="condi_three"><button id="hangover"
						class="condition-img">
						<img src="${pageContext.request.contextPath}/img/menu/sick_2.png" width="70" />
					</button> <b class="condi_padding"> 숙취해소</b></li>
				<li class="col-md-1 col-sm-1 col-xs-4" id="condi_four"><button id="energy"
						class="condition-img">
						<img src="${pageContext.request.contextPath}/img/menu/sick_3.png" width="70" />
					</button> <b class="condi_padding"> 기력보충</b></li>
				<li class="col-md-1 col-sm-1 col-xs-4" id="condi_five"><button id="diet"
						class="condition-img">
						<img src="${pageContext.request.contextPath}/img/menu/sick_4.png" width="70" />
					</button> <b class="condi_padding"> 다이어트</b></li>

				<li class="col-md-2 col-sm-3"></li>
			</ul>
			<br> <br> <br>

		</div>
		<div class="text-center box1">
			<div class="box2">
				<br> <br> <br> <br>
				<p class="condition">
					"&nbsp;<span id="condition-food"></span>&nbsp;"에 좋은 음식는?
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
					<a href="${pageContext.request.contextPath}/menu/menu_condition_list"><button type="button"
							class="btn  btn-primary btn-ttc2 ">주변음식점찾기</button></a>
				</span>

			</div>
		</div>


	</div>

	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />

	<script type="text/javascript">
		$(function() {

			$('#box7').hide();
			$("#cold").click(function() {
				$("#condi_one").addClass("select");
				$("#condi_two").removeClass("select");
				$("#condi_three").removeClass("select");
				$("#condi_four").removeClass("select");
				$("#condi_five").removeClass("select");
				$("#condition-food").html("감기몸살").css("color", "#4041fe");

			});

			$("#digestion").click(function() {
				$("#condi_one").removeClass("select");
				$("#condi_two").addClass("select");
				$("#condi_three").removeClass("select");
				$("#condi_four").removeClass("select");
				$("#condi_five").removeClass("select");
				$("#condition-food").html("소화불량").css("color", "#4041fe");

			});

			$("#hangover").click(function() {
				$("#condi_one").removeClass("select");
				$("#condi_two").removeClass("select");
				$("#condi_three").addClass("select");
				$("#condi_four").removeClass("select");
				$("#condi_five").removeClass("select");
				$("#condition-food").html("숙취해소").css("color", "#4041fe");

			});

			$("#energy").click(function() {
				$("#condi_one").removeClass("select");
				$("#condi_two").removeClass("select");
				$("#condi_three").removeClass("select");
				$("#condi_four").addClass("select");
				$("#condi_five").removeClass("select");
				$("#condition-food").html("기력보충").css("color", "#4041fe");

			});

			$("#diet").click(function() {
				$("#condi_one").removeClass("select");
				$("#condi_two").removeClass("select");
				$("#condi_three").removeClass("select");
				$("#condi_four").removeClass("select");
				$("#condi_five").addClass("select");
				$("#condition-food").html("다이어트").css("color", "#4041fe");

			});

			$("#ran").click(function() {
				$("#box7").toggle();
				$('.box2,#ran').remove();

			});

			$("#btn-retry").click(
					function() {
						$('#re-recommend,#btn-retry').remove();

						$("#re-re").html(
								"<img src='${pageContext.request.contextPath}/img/menu/Haejangguk.jpg' height='130'>"
										+ "<br>" + "<h1>해장국</h1>" + "<br>")

					});
		});
	</script>

</body>
</html>