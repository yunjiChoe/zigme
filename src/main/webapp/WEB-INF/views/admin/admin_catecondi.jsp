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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/admin_style.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />

<style type="text/css">
</style>

</head>

<body>
	<div class="container">

		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/admin.jsp" />

		<p class="top_title">업종·건강상태 관리</p>

		<div class="admin_search claerfix">
			<a href="${pageContext.request.contextPath}/admin/admin_catecondi/add.do"
				class="admin_add pull-left">[업종/건강상태 추가]</a>

			<!-- 검색폼 -->
			<form method="get"
				action="${pageContext.request.contextPath}/admin/admin_catecondi/list.do"
				class="pull-right">
				<label for="keyword">검색어: </label> <input type="search"
					name="keyword" id="keyword" placeholder="이름 검색" value="${keyword}" />
				<button type="submit">검색</button>
			</form>
			<br>
		</div>

		<hr />
		<br>

		<table id="admin_list">
			<thead>
				<tr>
					<th width="50">번호</th>
					<th width="150">업종·건강상태 이름</th>
					<th width="200">분류 ( S: 업종 / C: 건강상태 )</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>

					<c:when test="${output == null || fn:length(output) == 0}">
						<tr>
							<td colspan="3" align="center">조회결과가 없습니다.</td>
						</tr>
					</c:when>

					<c:otherwise>

						<c:forEach var="item" items="${output}" varStatus="status">

							<c:set var="cateCondiName" value="${cateCondiName}" />

							<c:url value="view.do" var="viewUrl">
								<c:param name="cateCondiNo" value="${item.cateCondiNo}" />
							</c:url>

							<tr>
								<td align="center">${item.cateCondiNo}</td>
								<td align="center"><a href="${viewUrl}">${item.cateCondiName}</a></td>
								<td align="center">${item.cateCondiFlag}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<!-- //container 종료 -->



	<!-- include :: Javascript 파일 포함 
      <script src="../assets/js/jquery.min.js"></script>
      <script src="../assets/js/bootstrap.min.js"></script>
    -->
	<c:import url="../inc/footer.jsp" />
	<script type="text/javascript">
		
	</script>
</body>

</html>