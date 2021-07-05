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

<!-- 메뉴 style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/menu.css" />

</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content clearfix">
			<p class="top_title">메뉴 추천</p>
			<div class="mbody">
				<div class="col-sm-12 col-md-6 pull-left">
					<a href="${pageContext.request.contextPath}/menu/menu_category"><img alt="업종별"
						src="${pageContext.request.contextPath}/img/menu/main_foodcategory.png"></a>
				</div>
				<div class="col-sm-12 col-md-6 pull-left">
					<a href="${pageContext.request.contextPath}/menu/menu_weather"><img alt="날씨별"
						src="${pageContext.request.contextPath}/img/menu/main_weather.png"></a>
				</div>
				<div class="col-sm-12 col-md-6 pull-left">
					<a href="${pageContext.request.contextPath}/menu/menu_condition"><img alt="건강상태별"
						src="${pageContext.request.contextPath}/img/menu/main_health.png"></a>
				</div>
				<div class="col-sm-12 col-md-6 pull-left">
					<a href="${pageContext.request.contextPath}/menu/menu_chart"><img alt="선호음식순위"
						src="${pageContext.request.contextPath}/img/menu/main_bestmenu.png"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />

</body>
</html>