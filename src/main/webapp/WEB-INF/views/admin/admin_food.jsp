<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0.
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

		<p class="top_title">음식 DB 관리</p>
		<div class="admin_search claerfix">
			<a href="${pageContext.request.contextPath}/admin/admin_food/add.do"
				class="admin_add pull-left">[음식 추가]</a>
			<form method="get"
				action="${pageContext.request.contextPath}/admin/admin_food/list.do"
				class="pull-right">
				<label for="keyword">음식이름: </label> <input type="search"
					name="keyword" placeholder="음식이름 검색" value="${keyword}" />
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
					<th width="150">음식 이름</th>
					<th width="100">업종</th>
					<th width="120">선호 날씨</th>
					<th width="180">건강상태정보</th>
					<th width="100">삭제여부(Y/N)</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>

					<c:when test="${output == null || fn:length(output) == 0}">
						<tr>
							<td colspan="6" align="center">조회결과가 없습니다.</td>
						</tr>
					</c:when>

					<c:otherwise>

						<c:forEach var="item" items="${output}" varStatus="status">

							<c:set var="foodName" value="${item.foodName}" />

							<c:url value="view.do" var="viewUrl">
								<c:param name="foodNo" value="${item.foodNo}" />
							</c:url>

							<tr>
								<td align="center">${item.foodNo}</td>
								<td align="center"><a href="${viewUrl}">${foodName}</a></td>
								<td align="center">${item.foodCategory}</td>
								<td align="center">${item.foodWeather}</td>
								<td align="center">${item.foodCondition}</td>
								<td align="center">${item.delFoodflag}</td>
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
		
	<%--$(function() {
         var filename = '';
                  
         // 파일명 textbox에 띄우기 --------------------------------------------------------------------
            // input 요소 중에 name이 file 인 요소의 값이 바뀌었을때 
            $("input[name=file]").on("change", function() {      
               
               $('#uploaded').val('');                                  // 파일 이름 추출 전 초기화
               
               if(window.FileReader) {                         
                  filename = $(this)[0].files[0].name;                  // 최근 브라우저의 파일명 추출         
               } else { // old IE
                  filename = $(this).val().split('/').pop().split('\\').pop(); // 구 브라우저 파일명 추출
               }
               
               // 파일 확장자 확인 -----------------------------------------------------------------------------
               var ext = filename.split('.').pop().toLowerCase();
               
               // 업로드 가능한 확장자 배열처리, 이 외의 확장자에 대해 알람 창 띄우기
               if($.inArray(ext, ['jpg', 'jpeg', 'gif', 'png']) == -1) {
                  alert('jpg, gif, png 파일만 등록이 가능합니다.');
                  $('#fileInput').val('');
                  return;
               }
               
               // 파일 크기 확인
               if (filename != ''){
                  var size = 3;  
                  var fileSize = document.getElementById("fileInput").files[0].size;   // 파일 사이즈 get
                  var maxSize = size * 1024 * 1024 // 3MB
                  
                  if (fileSize > maxSize) {
                     alert("첨부파일 사이즈는 " + size + "MB 이내로 등록 가능합니다.");
                     $('#fileInput').val('');
                     return;
                  }
               }
               
               // 추출한 파일명 삽입
               $("#uploaded").val(filename);
            
            });
      }); --%>
		
	</script>

</body>
</html>