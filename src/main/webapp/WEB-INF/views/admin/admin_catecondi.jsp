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
<html lang="ko">

<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/SCtest.css" />
<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/admin_style.css" />

<style type="text/css">
</style>

</head>

<body>
	<div class="container">
    <hr />
	
		<!--  include :: container 바로 아래에 있어야합니다 -->		
		<c:import url="../inc/admin.jsp" />
		

		<p class="top_title">업종·건강상태정보 관리</p>
		
	
    <a href="${pageContext.request.contextPath}/professor_ajax/add.do">[업종-컨디션 추가]</a>

    <!-- 검색폼 -->
    <form method="get" action="${pageContext.request.contextPath}/professor_ajax/list.do">
        <label for="keyword">검색어: </label>
        <input type="search" name="keyword" id="keyword" placeholder="이름 검색" value="${keyword}" />
        <button type="submit">검색</button>
    </form>
		<table id="category" align="center">
			
				<tr id="categoryList">
					<th width="50">번호</th>
					<th width="180">업종·건강상태정보 이름</th>
					<th width="210">분류(S:업종/C:건강상태정보)</th>
				</tr>
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
	
    let nowPage = 1;    // 현재 페이지의 기본값
    
    $(function() {
        /** 더 보기 버튼에 대한 이벤트 정의 */
        $("#btnMore").click(function() {
            // 다음 페이지를 요청하기 위해 페이지 변수 1 증가
            nowPage++;
            
            // Restful API에 GET 방식 요청
            $.get("${pageContext.request.contextPath}/professor", {
                "page": nowPage     // 페이지 번호는 GET 파라미터로 전송한다.
            }, function(json) {
                var source = $("#prof-list-tmpl").html();   // 템플릿 코드 가져오기
                var template = Handlebars.compile(source);  // 템플릿 코드 컴파일
                var result = template(json);    // 템플릿 컴파일 결과물에 json 전달
                $("#list").append(result);      // 최종 결과물을 #list 요소에 추가한다.
                
                // 현재 페이지 번호가 전체 페이지 수에 도달했다면 더 보기 버튼을 숨긴다.
                if (json.meta.totalPage <= nowPage) {
                    $("#btnMore").hide();
                }
            });
        });
    });
	</script>
</body>

</html>