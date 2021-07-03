<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- 메뉴 style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/menu.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<%@ include file="../inc/header.jsp"%>

</head>

<style type="text/css">
.btn-primary {
	background-color: #4041fe;
}

.btn-primary:hover {
	background-color: #4041fe;
}
</style>


<body>
	<div class="container" id="menu-container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<%@ include file="../inc/navbar.jsp"%>
		<!--  body 시작 -->
		<div class="content">
			<p class="sub_title text-center">메뉴 추천 > 업종별</p>
			<br>
			<ul class="menuicon">
				<li class="col-md-2 col-sm-3"></li>
				<li class="col-md-1 col-sm-1 col-xs-4 "><button id="btn-kor">
						<img src="${pageContext.request.contextPath}/img/menu/koreanfood.png" width="70" />한식
					</button></li>
				<li class="col-md-1 col-sm-1 col-xs-4"><button id="btn-yangsik">
						<img src="${pageContext.request.contextPath}/img/menu/westernfood.png" width="70" />양식
					</button></li>
				<li class="col-md-1 col-sm-1 col-xs-4"><button id="btn-jan">
						<img src="${pageContext.request.contextPath}/img/menu/japanesefood.png" width="70" />일식
					</button></li>
				<li class="col-md-1 col-sm-1 col-xs-4"><button id="btn-china">
						<img src="${pageContext.request.contextPath}/img/menu/chinesefood.png" width="70" />중식
					</button></li>
				<li class="col-md-1 col-sm-1 col-xs-4"><button id="btn-boonsik">
						<img src="${pageContext.request.contextPath}/img/menu/boonsik.png" width="70" />분식
					</button></li>
				<li class="col-md-1 col-sm-1 col-xs-4">
					<button id="btn-other">
						<img src="${pageContext.request.contextPath}/img/menu/etc.png" width="70" />그외
					</button>
				</li>
				<li class="col-md-2 col-sm-3"></li>
			</ul>
			<br> <br> <br>

		</div>
		<div class="box1 text-center">
			<br> <br>
			<h3 id="today_menu">오늘의 추천 메뉴는?</h3>
			<br>
			<!-- 토글로 보여주는 곳 -->
			<div class="imgbox">
				<div id="box1" class="menu-kor " style="width: 60px; height: 60px;">
					<br> <br> <br> <span>한식</span>
				</div>
				<div id="box2" class="menu-yangsik "
					style="width: 60px; height: 60px;">
					<br> <br> <br> <span>양식</span>
				</div>
				<div id="box3" class="menu-jan " style="width: 60px; height: 60px;">
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
				<div id="box6" class="menu-other" style="width: 60px; height: 60px;">
					<br> <br> <br> <span>그외</span>
				</div>
			</div>

			<div id="box7">
				<span id="re-recommend"> <img alt="자장면"
					src="${pageContext.request.contextPath}/img/menu/review/210622_001.jpg" width="140">
					<h1>자장면</h1></span> <span id="re-re"></span> <span class="menu_find_btn">
					<a><button type="button" class="btn btn-ms btn-ttc1"
							id="btn-retry">&nbsp;&nbsp;재추천&nbsp;&nbsp;</button></a> <a
					href="${pageContext.request.contextPath}/menu/menu_category_list"><button type="button"
							class="btn btn-primary btn-ttc2 ">주변음식점찾기</button></a>
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

	<%@ include file="../inc/footer.jsp"%>

	<script type="text/javascript">
		$(function() {
			var i1 = 0;
			var i2 = 0;
			var i3 = 0;
			var i4 = 0;
			var i5 = 0;
			var i6 = 0;
			var turn = new Array('skyblue', 'white');

			// 요소 숨기기
			$('#box1').hide();
			$('#box2').hide();
			$('#box3').hide();
			$('#box4').hide();
			$('#box5').hide();
			$('#box6').hide();
			$('#box7').hide();

			// 토글로 요소를 보여주고 사라지게한다.
			$("#btn-kor").click(function() {
				$("#box1").fadeToggle();

				var result = turn[i1]
				$('#btn-kor').css("background", result);
				i1++;
				if (i1 == 2) {
					i1 = 0;
				}

			});

			$("#btn-yangsik").click(function() {
				$("#box2").fadeToggle();

				var result = turn[i2]
				$('#btn-yangsik').css("background", result);
				i2++;
				if (i2 == 2) {
					i2 = 0;
				}

			});
			
			$("#btn-jan").click(function() {
				$("#box3").fadeToggle();

				var result = turn[i3]
				$('#btn-jan').css("background", result);
				i3++;
				if (i3 == 2) {
					i3 = 0;
				}

			});

			$("#btn-china").click(function() {
				$("#box4").fadeToggle();

				var result = turn[i4]
				$('#btn-china').css("background", result);
				i4++;
				if (i4 == 2) {
					i4 = 0;
				}

			});
			
			$("#btn-boonsik").click(function() {
				$("#box5").fadeToggle();

				var result = turn[i5]
				$('#btn-boonsik').css("background", result);
				i5++;
				if (i5 == 2) {
					i5 = 0;
				}

			});
			
			$("#btn-other").click(function() {
				$("#box6").fadeToggle();

				var result = turn[i6]
				$('#btn-other').css("background", result);
				i6++;
				if (i6 == 2) {
					i6 = 0;
				}

			});
			
			$("#ran").click(function() {
				$("#box7").toggle();
				$('#box1,#box2,#box3,#box4,#box5,#box6,#today_menu,#ran').remove();
			});

			$("#btn-retry").click(function() {
				$('#re-recommend,#btn-retry').remove();
				$("#re-re").html("<img src='../img/menu/jjamppong.jpg' height='130'>" + "<br>" + "<h1>짬뽕</h1>" + "<br>")

			});

		});
	</script>

</body>
</html>