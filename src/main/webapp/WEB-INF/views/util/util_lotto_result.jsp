<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />

<!-- 스타일 지정 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/util.css" />

<style type="text/css">
.button {
	width: 25%;
	margin: auto;
}
</style>
</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content">
			<p class="sub_title">돌려돌려 공돌려</p>
			<div class="lotto_img">
				<img
					src="${pageContext.request.contextPath}/img/util/lotto_result_win.png"
					width="70" class=" pull-right win">
			</div>
			<p class="caption">&nbsp;&nbsp;오늘 우리 팀 간식을 책임질 사람은 누구~?</p>

			<br>

			<div class="result">
				<img
					src="${pageContext.request.contextPath}/img/util/lotto_result.png"
					width="600"> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br>
				<div class="choice">
					오늘은 <span class="who" id="one"> </span> <span class="who" id="two">
					</span> 님이 쏘는 날!
				</div>
			</div>

			<br> <br>

			<div class="button">
				<button type="button" class="pull-left btn btn-default btn-lg back"
					onClick="location.href='${pageContext.request.contextPath}/util/util_lotto'">&nbsp;처음으로&nbsp;
				</button>
				<button type="submit" class="pull-right btn btn-default btn-lg more">&nbsp;한
					명 더 뽑기&nbsp;</button>
			</div>

		</div>
	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />

	<script
		src="${pageContext.request.contextPath}/plugin/ajax/ajax_helper.js"></script>

	<script type="text/javascript">
	$(function() {	
		var list = [];

		var player0 = "${player0}";
		if (player0 != "") {
			list.push(player0);
		}
		var player1 = "${player1}";
		if (player1 != "") {
			list.push(player1);
		}
		var player2 = "${player2}";
		if (player2 != "") {
			list.push(player2);
		}
		var player3 = "${player3}";
		if (player3 != "") {
			list.push(player3);
		}
		var player4 = "${player4}";
		if (player4 != "") {
			list.push(player4);
		}
		var player5 = "${player5}";
		if (player5 != "") {
			list.push(player5);
		}
		var player6 = "${player6}";
		if (player6 != "") {
			list.push(player6);
		}
		var player7 = "${player7}";
		if (player7 != "") {
			list.push(player7);
		}
		var player8 = "${player8}";
		if (player8 != "") {
			list.push(player8);
		}
		var player9 = "${player9}";
		if (player9 != "") {
			list.push(player9);
		}

		function fisherYatesShuffle(arr){
		    for(var i = arr.length - 1; i > 0; i--){
		        var j = Math.floor( Math.random() * (i + 1) ); //random index
		        [arr[i], arr[j]] = [arr[j], arr[i]]; // swap
		    }
		    
		    console.log(arr)
		    
		    $("#one").html(arr[0]);

			$(".more").click(function() {
				$("#two").html(", " + arr[1]);
				$(".more").addClass("end");
			});
		}

		fisherYatesShuffle(list);

	});
	</script>
</body>
</html>