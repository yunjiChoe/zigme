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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<%@ include file="../inc/header.jsp"%>

<!-- 스타일 지정 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/util.css" />

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
		<%@ include file="../inc/navbar.jsp"%>
		<div class="content">
			<p class="sub_title">돌려돌려 공돌려</p>
			<div class="lotto_img"><img src="${pageContext.request.contextPath}/img/util/lotto_result_win.png" width="70"
				class=" pull-right win"></div>
			<p class="caption">&nbsp;&nbsp;오늘 우리 팀 간식을 책임질 사람은 누구~?</p>

			<br>

			<div class="result">
				<img src="${pageContext.request.contextPath}/img/util/lotto_result.png" width="600"> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br>
				<div class="choice">
					오늘은 <span class="who"> 정자바</span><!--  --><span class="yet" id="one">, 솔솔이 </span> 님이 쏘는 날!
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

	<%@ include file="../inc/footer.jsp"%>

	<script type="text/javascript">
		$(function() {
			$(".more").click(function() {
				$("#one").removeClass("yet");
				$("#one").addClass("who");
			});
		});
	</script>
</body>
</html>