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
ul {
	padding: 0px;
}

input {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid #efefef;
	border-radius: 35px;
	font-size: 16px;
	box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.05), -4px -2px 4px
		rgba(0, 0, 0, 0.08);
}

.button {
	width: 23%;
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
		</div>
			
			<div class="part clearfix">
				<a class="delete"><img
					src="${pageContext.request.contextPath}/img/util/lotto_minus.png"
					width="50" class="pull-left" /></a>
				<div class="num">
					<span class="pull-left" id="var">2</span>
					<p class="pull-left">명&nbsp;</p>
				</div>
				<a class="add"><img
					src="${pageContext.request.contextPath}/img/util/lotto_plus.png"
					width="50" class="pull-right" /></a>
				<div class="text">
					<p class="pull-right">참여</p>
				</div>
				<br>
			</div>
			<div class="max">(최대 10명)</div>
			<br> <br> <br> <br>
			<form name="form" method="post" action="${pageContext.request.contextPath}/util/util_lotto_result.do">
			<div class="name">
				<div class="clearfix">
					<ul>
						<li class="pull-left"><img
							src="${pageContext.request.contextPath}/img/util/lotto-num1.png"
							class="input"> <input type="text" name="player0"
							maxlength="8" placeholder="이름을 입력해주세요" title="1번 참여자 작성하기">
						</li>
						<li class="pull-right"><img
							src="${pageContext.request.contextPath}/img/util/lotto-num2.png"
							class="input"> <input type="text" name="player1"
							maxlength="8" placeholder="이름을 입력해주세요" title="2번 참여자 작성하기">
						</li>
					</ul>
				</div>
				<div class="clearfix">
					<ul>
						<li style="display: none;" class="pull-left" id="three"><img
							src="${pageContext.request.contextPath}/img/util/lotto-num3.png"
							class="input"><input type="text" name="player2"
							maxlength="8" placeholder="이름을 입력해주세요" title="3번 참여자 작성하기"></li>
						<li style="display: none;" class="pull-right" id="four"><img
							src="${pageContext.request.contextPath}/img/util/lotto-num4.png"
							class="input"><input type="text" name="player3"
							maxlength="8" placeholder="이름을 입력해주세요" title="4번 참여자 작성하기"></li>
					</ul>
				</div>
				<div class="clearfix">
					<ul>
						<li style="display: none;" class="pull-left" id="five"><img
							src="${pageContext.request.contextPath}/img/util/lotto-num5.png"
							class="input"><input type="text" name="player4"
							maxlength="8" placeholder="이름을 입력해주세요" title="5번 참여자 작성하기"></li>
						<li style="display: none;" class="pull-right" id="six"><img
							src="${pageContext.request.contextPath}/img/util/lotto-num6.png"
							class="input"><input type="text" name="player5"
							maxlength="8" placeholder="이름을 입력해주세요" title="6번 참여자 작성하기"></li>
					</ul>
				</div>
				<div class="clearfix">
					<ul>
						<li style="display: none;" class="pull-left" id="seven"><img
							src="${pageContext.request.contextPath}/img/util/lotto-num7.png"
							class="input"><input type="text" name="player6"
							maxlength="8" placeholder="이름을 입력해주세요" title="7번 참여자 작성하기"></li>
						<li style="display: none;" class="pull-right" id="eight"><img
							src="${pageContext.request.contextPath}/img/util/lotto-num8.png"
							class="input"><input type="text" name="player7"
							maxlength="8" placeholder="이름을 입력해주세요" title="8번 참여자 작성하기"></li>
					</ul>
				</div>
				<div class="clearfix">
					<ul>
						<li style="display: none;" class="pull-left" id="nine"><img
							src="${pageContext.request.contextPath}/img/util/lotto-num9.png"
							class="input"><input type="text" name="player8"
							maxlength="8" placeholder="이름을 입력해주세요" title="9번 참여자 작성하기"></li>
						<li style="display: none;" class="pull-right" id="ten"><img
							src="${pageContext.request.contextPath}/img/util/lotto-num10.png"
							class="input"><input type="text" name="player9"
							maxlength="8" placeholder="이름을 입력해주세요" title="10번 참여자 작성하기"></li>
					</ul>
				</div>
			</div>
			<br> <br> <br> <br>
			<div class="button">
				<button type="submit" class="btn" id="roll">
					<strong>돌려 돌려!</strong>
				</button>
			</div>
			</form>
		
	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />
	<script type="text/javascript">
		var counter = 0;

		$(function() {
			$(".delete")
					.mousedown(
							function() {
								$(".delete")
										.html(
												"<img src='${pageContext.request.contextPath}/img/util/lotto_minus_on.png' width='50' class='pull-left'>");
							});

			$(".delete")
					.mouseup(
							function() {
								$(".delete")
										.html(
												"<img src='${pageContext.request.contextPath}/img/util/lotto_minus.png' width='50' class='pull-left'>");

								counter--;

								if (counter == 7) {
									$("#ten").attr('style', 'display: none;');
									$("#var").html(9);
								} else if (counter == 6) {
									$("#nine").attr('style', 'display: none;');
									$("#var").html(8);
								} else if (counter == 5) {
									$("#eight").attr('style', 'display: none;');
									$("#var").html(7);
								} else if (counter == 4) {
									$("#seven").attr('style', 'display: none;');
									$("#var").html(6);
								} else if (counter == 3) {
									$("#six").attr('style', 'display: none;');
									$("#var").html(5);
								} else if (counter == 2) {
									$("#five").attr('style', 'display: none;');
									$("#var").html(4);
								} else if (counter == 1) {
									$("#four").attr('style', 'display: none;');
									$("#var").html(3);
								} else if (counter == 0) {
									$("#three").attr('style', 'display: none;');
									$("#var").html(2);
								} else {
									counter = 0;
								}
							});

			$(".add")
					.mousedown(
							function() {
								$(".add")
										.html(
												"<img src='${pageContext.request.contextPath}/img/util/lotto_plus_on.png' width='50' class='pull-right'>");
							});

			$(".add")
					.mouseup(
							function() {
								$(".add")
										.html(
												"<img src='${pageContext.request.contextPath}/img/util/lotto_plus.png' width='50' class='pull-right'>");

								counter++;

								if (counter == 1) {
									$("#three").attr('style',
											'display: inline-block;');
									$("#var").html(3);
								} else if (counter == 2) {
									$("#four").attr('style',
											'display: inline-block;');
									$("#var").html(4);
								} else if (counter == 3) {
									$("#five").attr('style',
											'display: inline-block;');
									$("#var").html(5);
								} else if (counter == 4) {
									$("#six").attr('style',
											'display: inline-block;');
									$("#var").html(6);
								} else if (counter == 5) {
									$("#seven").attr('style',
											'display: inline-block;');
									$("#var").html(7);
								} else if (counter == 6) {
									$("#eight").attr('style',
											'display: inline-block;');
									$("#var").html(8);
								} else if (counter == 7) {
									$("#nine").attr('style',
											'display: inline-block;');
									$("#var").html(9);
								} else if (counter == 8) {
									$("#ten").attr('style',
											'display: inline-block;');
									$("#var").html(10);
								} else {
									counter = 8;
								}
							});
		});
	</script>
</body>
</html>