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

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />


<!-- 스타일 지정 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/util.css" />

</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content clearfix">
			<p class="top_title">부가 기능</p>
			<div class="ubody">
				<div class="hidden-sm hidden-xs">
					<a href="${pageContext.request.contextPath}/util/util_alarm.do?type=${zigme_user.userNo}"><img id="alram" alt="알람"
						src="${pageContext.request.contextPath}/img/util/main_alarm.png"></a>
				</div>
				<div class="col-sm-12 hidden-lg hidden-md">
					<a href="${pageContext.request.contextPath}/util/util_alarm.do?type=${zigme_user.userNo}"><img alt="알람"
						src="${pageContext.request.contextPath}/img/util/main_alarm.png"></a>
				</div>
				<div class="col-md-6 col-sm-12 pull-left">
					<a href="${pageContext.request.contextPath}/util/util_5min"><img alt="5분 스트레칭"
						src="${pageContext.request.contextPath}/img/util/main_5minstretch.png"></a>
				</div>
				<div class="col-md-6 col-sm-12 pull-left">
					<a href="${pageContext.request.contextPath}/util/util_lotto"><img alt="돌려돌려 공돌려"
						src="${pageContext.request.contextPath}/img/util/main_raffle.png"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />
</body>
</html>