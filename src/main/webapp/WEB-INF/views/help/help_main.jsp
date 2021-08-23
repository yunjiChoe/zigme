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
<style type="text/css">
.hbody {
	width: 80%;
	padding-top: 50px;
	margin: auto;
}

.hbody img {
	width: 89%;
	margin: 10% 6% 30% 6%;
	border-radius: 10%;
}
</style>
</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content clearfix">
			<p class="top_title">직장생활, 도와줘!</p>
			<div class="hbody">
				<div class="col-sm-12 col-md-6 pull-left">
					<a href="${pageContext.request.contextPath}/help_ajax/help_comm.do"><img alt="커뮤니티"
						src="${pageContext.request.contextPath}/img/help/main_community.png"></a>
				</div>
				<div class="col-sm-12 col-md-6 pull-left">
					<a href="${pageContext.request.contextPath}/help/help_chart"><img alt="메이트들의 고민은?"
						src="${pageContext.request.contextPath}/img/help/main_questions.png"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />

</body>
</html>