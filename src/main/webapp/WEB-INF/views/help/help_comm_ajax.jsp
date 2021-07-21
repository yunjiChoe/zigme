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
<html lang="ko" dir="ltr">
<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- help.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/help.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />

<style type="text/css">
tr {
	cursor: pointer;
}
</style>

</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />

		<div class="content">
			<div id="comm_upper">
				<p class="sub_title">커뮤니티</p>
				<p>직장내 고민을 서로에게 털어놓고 직장생활 노하우 나눔터!</p>
			</div>

			<form id="comm_middle" class="form-inline pull-right">
				<div class="form-group">
					<select id="parent" class="form-control formcon-comm">
						<option value="">말머리</option>
						<option value="202010">도움</option>
						<option value="202011">꿀팁</option>
						<option value="202012">넋두리</option>
					</select>
				</div>
				
				<!-- 검색폼 -->
    <form method="get" action="${pageContext.request.contextPath}/help_ajax/help_comm_ajax.do">
        <input type="search" name="keyword" id="keyword" placeholder="이름 검색" value="${keyword}" />
        <button type="submit">검색</button>
    </form>			
			</form>

			<table class="help_comm_table">
				<thead>
					<tr class="info help_comm_point">
						<th>NO.</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>추천</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody id="comm_table">
					<c:choose>
						<%-- 조회결과가 없는 경우 --%>
						<c:when test="${output == null || fn:length(output) == 0}">
							<tr>
								<td colspan="9" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<%-- 조회결과가 있는  경우 --%>
						<c:otherwise>
							<%-- 조회 결과에 따른 반복 처리 --%>
							<c:forEach var="item" items="${output}" varStatus="status">
								<%-- 출력을 위해 준비한 교수이름 변수 --%>
								<c:set var="name" value="${item.postTitle}" />
								<%-- 검색어가 있다면? --%>
								<c:if test="${keyword != ''}">
									<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
									<c:set var="mark" value="<mark>${keyword}</mark>" />
									<%-- 출력을 위해 준비한 교수이름에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
									<c:set var="name" value="${fn:replace(name, keyword, mark)}" />
								</c:if>

								<%-- 상세페이지로 이동하기 위한 URL --%>

								<tr>
									<td align="left">${item.postNo}</td>
									<td align="left"><span>[${item.postSubtitle}]</span>${item.postTitle}</td>
									<td align="left">${item.nickname}</td>
									<td align="left">${item.postRegdate}</td>
									<td align="left">${item.postUpcount}</td>
									<td align="left">${item.postViewcount}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>

			</table>
			
			<!-- 페이지 구현 -->
			<%-- 이전 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 이전 그룹으로 이동이 가능하다면? --%>
				<c:when test="${pageData.prevPage > 0}">
				<%-- 이동할 URL 생성 --%>
            		<c:url value="/help_ajax/help_comm.do" var="prevPageUrl">
                		<c:param name="page" value="${pageData.prevPage}" />
                		<c:param name="keyword" value="${keyword}" />
            		</c:url>
            		<a href="${prevPageUrl}">[이전]</a>
				</c:when>
				<c:otherwise>
            		[이전]
        		</c:otherwise>
			</c:choose>
			
			<%-- 페이지 번호(시작 페이지 부터 끝 페이지까지 반복 --%>
			<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
				<%-- 이동할 URL 생성 --%>
        		<c:url value="/help_ajax/help_comm.do" var="pageUrl">
            		<c:param name="page" value="${i}" />
            		<c:param name="keyword" value="${keyword}" />
        		</c:url>
        		
        		<%-- 페이지 번호 출력 --%>
        		<c:choose>
            		<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
            		<c:when test="${pageData.nowPage == i}">
                		<strong>[${i}]</strong>
            		</c:when>
            		<%-- 나머지 페이지의 경우 링크 적용함 --%>
            		<c:otherwise>
                		<a href="${pageUrl}">[${i}]</a>
            		</c:otherwise>
        		</c:choose>
			</c:forEach>
			
			<%-- 다음 그룹에 대한 링크 --%>
			<c:choose>
        	<%-- 다음 그룹으로 이동 가능하다면? --%>
        		<c:when test="${pageData.nextPage > 0}">
            		<%-- 이동할 URL 생성 --%>
            		<c:url value="/help_ajax/help_comm.do" var="nextPageUrl">
                		<c:param name="page" value="${pageData.nextPage}" />
                		<c:param name="keyword" value="${keyword}" />
            		</c:url>
            		<a href="${nextPageUrl}">[다음]</a>
        		</c:when>
        		<c:otherwise>
            	[다음]
        		</c:otherwise>
    		</c:choose>
			
			<!-- 전체 페이지 수가 2페이지 이상인 경우 "더보기"버튼 노출 -->



			<form id="comm_bottom help_comm_point" class="form-inline">
				<div class="bottom_btns">
					<ul class="pagination">
						<li class="disabled"><a href="#">&laquo;</a></li>
						<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>

					<button type="button" id="button_w" class="pull-right"
						onclick="writePage()">글쓰기</button>
				</div>
			</form>
		</div>
	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />



	<!-- Handlebar 템플릿 코드 -->
	<script id="post-list-tmpl" type="text/x-handlebars-template">
	{{#each item}}
	<tr>
          <td align="left">{{postNo}}</td>
          <td align="left"><span>[{{postSubtitle}}]</span>{{postTitle}}</td>
          <td align="left">{{nickname}}</td>
          <td align="left">{{postRegdate}}</td>
          <td align="left">{{postUpcount}}</td>
          <td align="left">{{postViewcount}}</td>
    </tr>			
	{{/each}}
	</script>
	<!--Google CDN 서버로부터 jQuery 참조 -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Handlebar CDN 참조 -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<!-- User code -->
	<script type="text/javascript">
		function writePage() {
			<!-- 글쓰기 클릭 이벤트 발생시 help_comm_write_ajax페이지로 이동 -->
			window.location.href = "${pageContext.request.contextPath}/help_ajax/help_comm_write";
		}
		
		let nowPage = 1;    // 현재 페이지의 기본값
		
		$(function() {
            /** 더 보기 버튼에 대한 이벤트 정의 */
            	$("#btnMore").click(function() {
                // 다음 페이지를 요청하기 위해 페이지 변수 1 증가
                nowPage++;
                
                // Restful API에 GET 방식 요청
                $.get("${pageContext.request.contextPath}/help", {
                    "page": nowPage     // 페이지 번호는 GET 파라미터로 전송한다.
                }, function(json) {
                    var source = $("post-list-tmpl").html();   // 템플릿 코드 가져오기
                    var template = Handlebars.compile(source);  // 템플릿 코드 컴파일
                    var result = template(json);    // 템플릿 컴파일 결과물에 json 전달
                    $("#comm_table").append(result);      // 최종 결과물을 #list 요소에 추가한다.
                    
                    // 현재 페이지 번호가 전체 페이지 수에 도달했다면 더 보기 버튼을 숨긴다.
                    if (json.meta.totalPage <= nowPage) {
                        $("#btnMore").hide();
                    }
                });
        	});
	</script>

</body>
</html>