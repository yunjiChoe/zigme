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
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>커뮤니티</title>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- help.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/help.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />

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
				<!-- 검색폼 -->
				<form method="get"
					action="${pageContext.request.contextPath}/help_ajax/help_comm_ajax.do">				
						<select name="keyword2" class="form-control formcon-comm keyword2">
							<option value="">말머리</option>
							<option value="도움">도움</option>
							<option value="꿀팁">꿀팁</option>
							<option value="넋두리">넋두리</option>
						</select>
						<input type="search" name="keyword1" id="keyword1"
						placeholder="제목 검색" value="${keyword1}" />
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
						<c:when test="${output_post == null || fn:length(output_post) == 0}">
							<tr>
								<td colspan="9" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${output_post}" varStatus="status">
                        		<c:url value="/help_ajax/help_comm_read.do" var="viewUrl">
                            		<c:param name="postNo" value="${item.postNo}" />
                        		</c:url>								
								<tr style = "cursor:pointer;" onClick = " location.href='${viewUrl}'">
									<td>${item.postNo}</td>
									<td id="titles"><span>[${item.postSubtitle}]</span>${item.postTitle}</td>
									<td>${item.nickname}</td>
									<td>${item.postRegdate}</td>
									<td>${item.postUpcount}</td>
									<td>${item.postViewcount}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose> 
				</tbody>

			</table>

			<form id="comm_bottom help_comm_point" class="form-inline">
				<div class="bottom_btns">
					<!-- 페이지 구현 -->
					<ul class="pagination">
						<%-- 이전 그룹에 대한 링크 --%>
						<c:choose>
							<%-- 이전 그룹으로 이동이 가능하다면? --%>
							<c:when test="${pageData.prevPage > 0}">
								<%-- 이동할 URL 생성 --%>
								<c:url value="/help_ajax/help_comm.do" var="prevPageUrl">
									<c:param name="page" value="${pageData.prevPage}" />
									<c:param name="keyword1" value="${keyword1}" />
									<c:param name="keyword2" value="${keyword2}" />
								</c:url>
								<li><a href="${prevPageUrl}">&laquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#none">&laquo;</a></li>
							</c:otherwise>
						</c:choose>


						<%-- 페이지 번호(시작 페이지 부터 끝 페이지까지 반복 --%>
						<c:forEach var="i" begin="${pageData.startPage}"
							end="${pageData.endPage}" varStatus="status">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/help_ajax/help_comm.do" var="pageUrl">
								<c:param name="page" value="${i}" />
								<c:param name="keyword1" value="${keyword1}" />
								<c:param name="keyword2" value="${keyword2}" />
							</c:url>

							<%-- 페이지 번호 출력 --%>
							<c:choose>
								<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
								<c:when test="${pageData.nowPage == i}">
									<li class="active"><a href="#">${i}<span
											class="sr-only">(current)</span></a></li>
								</c:when>
								<%-- 나머지 페이지의 경우 링크 적용함 --%>
								<c:otherwise>
									<li><a href="${pageUrl}">${i}</a></li>
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
									<c:param name="keyword1" value="${keyword1}" />
									<c:param name="keyword2" value="${keyword2}" />
								</c:url>
								<li><a href="${nextPageUrl}">&raquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#none">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<!-- 전체 페이지 수가 2페이지 이상인 경우 "더보기"버튼 노출 -->

					<button type="button" id="button_w" class="pull-right"
						onclick="writePage()">글쓰기</button>
				</div>
			</form>
		</div>
	</div>
	<!-- //container 종료 -->
	<script>
	function writePage() {
			<!-- 글쓰기 클릭 이벤트 발생시 help_comm_write_ajax페이지로 이동 -->
			window.location.href = "${pageContext.request.contextPath}/help_ajax/help_comm_write.do";
		}
	function viewPage() {
			window.location.href = "${viewUrl}";	
		}
	</script>
	<c:import url="../inc/footer.jsp" />



	<!-- Handlebar 템플릿 코드 -->
	<script id="post-list-tmpl" type="text/x-handlebars-template">
	{{#each item}}
	<tr>
          <td>{{output_post.postNo}}</td>
          <td><span>[{{output.postSubtitle}}]</span>{{output_post.postTitle}}</td>
          <td>{{output_post.nickname}}</td>
          <td>{{output_post.postRegdate}}</td>
          <td>{{output_post.postUpcount}}</td>
          <td>{{output_post.postViewcount}}</td>
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
		src="${pageContext.request.contextPath}/assets/ajax/ajax_helper.js"></script>
	<!-- User code -->
	<script type="text/javascript">		
		let nowPage = 1;    // 현재 페이지의 기본값
		
		$(function() {
			
			function writePage() {
				<!-- 글쓰기 클릭 이벤트 발생시 help_comm_write_ajax페이지로 이동 -->
				window.location.href = "${pageContext.request.contextPath}/help_ajax/help_comm_write.do";
			}
		function viewPage() {
				window.location.href = "${viewUrl}";	
			}
			
			$(document).ready(function () {
				  postSubtitle_val = "${keyword2}";
				  console.log(postSubtitle_val);
				  $('select.keyword2 option[value=' + postSubtitle_val + ']').attr('selected', 'selected');
				
	                 
	                // Restful API에 GET 방식 요청
	                $.get("${pageContext.request.contextPath}/help", {
	                    "page": nowPage     // 페이지 번호는 GET 파라미터로 전송한다.
	                }, function(json) {
	                    var source = $("post-list-tmpl").html();   // 템플릿 코드 가져오기
	                    var template = Handlebars.compile(source);  // 템플릿 코드 컴파일
	                    var result = template(json);    // 템플릿 컴파일 결과물에 json 전달
	                    $("#comm_table").append(result);      // 최종 결과물을 #list 요소에 추가한다.
	                });
			
			});			
                 
        	});
	</script>

</body>
</html>