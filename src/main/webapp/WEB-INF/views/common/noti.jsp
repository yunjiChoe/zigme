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
<html lang="ko">

<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/ScoreDreamWebFont.css" />

<c:import url="../inc/header.jsp" />

<!-- common.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/common.css" />

<style type="text/css">

/** bootstrap.css 재정의 */
.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td,
	.table>tbody>tr>td, .table>tfoot>tr>td {
	vertical-align: middle;
}

.table>thead>tr>th {
	border-bottom: none;
}
/** bootstrap.css 재정의 끝 */
.page-header h1 {
	font-family: 'S-CoreDream-6Bold';
	text-align: center;
	color: #4041fe;
}

.table-header h2 {
	font-weight: 600;
	color: #4041fe;
}

.info th {
	color: #4041fe;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
}

.noti_row td {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	vertical-align: middle;
}

#noti_table td {
	width: auto;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	vertical-align: middle;
}

.showingnumber {
	font-weight: 600;
}

.noti-box {
	width: 100%;
	height: 500px;
	overflow: scroll;
}

.noti-table {
	width: 100%;
}

.newNotiPostTitle, .newNotiCommContent, .token {
	font-family: 'S-CoreDream-5Medium';
	color: #819dd6;
}

.table-header img {
	width: 30px;
}

.table-bumper {
	width: auto;
	height: 50px;
}

.boldchar, .noti_new {
	color: #ff5555;
	font-family: 'S-CoreDream-6Bold';
}

.close-btn {
	margin-right: 40%;
}

.showingnumber a {
	color: #4041fe;
	font-family: 'S-CoreDream-6Bold';
}

.noti_row {
	cursor: pointer;
}

.btn_delAll {
	background: none;
	border: none;
	margin: 0;
	padding: 0;
	cursor: pointer;
}

/** 미확인된 가상의 알림 5개를 표시하기 위한 클래스 */
.on {
	background-color: #FCE6E6;
}
</style>
</head>

<body>
	<!-- 웹페이지 영역 -->
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="page-header">
			<h1>알 림</h1>
			<div class="table-header">
				<h2>
					<img
						src="${pageContext.request.contextPath}/img/common/reward_icon_influencer.png">
					${zigme_user.nickname} 님
				</h2>
				<!-- <input type="text" id="user_id" name="userno" value="${zigme_user.userNo}">  -->
				
			</div>
			<div class="summary">
				<p class="noti_txt">
					읽지않은 알림이 <span class=boldchar>${fn:length(output1) + fn:length(output2)}</span>개 있습니다.
				</p>
			</div>
			<hr />
			<div class="noti-box">
				<table class="table noti-table">
					<thead>
						<tr class=info>
							<th>알림 내역</th>
							<!--  <th>알림 일시</th> -->
							<th><a href="#" class="btn_delAll">전체삭제</a></th>
						</tr>
					</thead>
					<tbody id="noti_table">
						<c:choose>
							<%-- 게시글에 대한 새로운 댓글 조회결과가 없는 경우 --%>
							<c:when test="${output1 == null || fn:length(output1) == 0}">
								<tr>
									<td colspan="9" align="center">조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<%-- 게시글에 대한 새로운 댓글 조회결과가 있는  경우 --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:forEach var="item" items="${output1}" varStatus="status">
	
									<%-- 해당글의 페이지로 이동하기 위한 URL --%>
	                        		<c:url value="/help_ajax/help_comm_read.do" var="viewUrl">
	                            		<c:param name="postNo" value="${item.postNo}" />
	                        		</c:url>
									
									<tr>
										<td>
											<span class="token">'</span>
											<span class="newNotiPostTitle" style = "cursor:pointer;" onClick="location.href='${viewUrl}'" data-postNo="${item.postNo}">${item.postTitle}</span>
											<span class="token">'</span> 게시글에 댓글이
											<span class="token">${item.countComm}</span>개 달렸습니다.
										</td>
										<td class="delnoti">
											<button type="button" class="close close-btn" aria-hidden="true">&times;</button>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<%-- 게시글에 대한 새로운 댓글 조회결과가 없는 경우 --%>
							
							<c:when test="${output2 == null || fn:length(output2) == 0}">
								<tr>
									<!-- <td colspan="9" align="center">조회결과가 없습니다.</td>  -->
								</tr>
							</c:when>
							<%-- 게시글에 대한 새로운 댓글 조회결과가 있는  경우 --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:forEach var="item" items="${output2}" varStatus="status">
	
									<%-- 해당글의 페이지로 이동하기 위한 URL --%>
	                        		<c:url value="/help_ajax/help_comm_read.do" var="viewUrl">
	                            		<c:param name="postNo" value="${item.postNo}" />
	                        		</c:url>
									
									<tr>
										<td style = "cursor:pointer;"><span class="token">'</span><span class="newNotiCommContent" 
										onClick="location.href='${viewUrl}'" data-commNo="${item.commNo}">${item.postTitle}${item.commContent}
										</span><span class="token">'</span> 댓글에 댓글이 <span class="token">${item.countComm}</span>개 달렸습니다.</td>
										<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!--Google CDN 서버로부터 jQuery 참조 -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Handlebar CDN 참조 -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<!-- jQuery Ajax Setup -->
	
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	
	<c:import url="../inc/footer.jsp" />
	<script src="${pageContext.request.contextPath}/plugin/ajax/ajax_helper.js"></script>
	<script type="text/javascript">
	$(function() {

		/** X 버튼 클릭시 개별 알람 목록 삭제 */
			$(document).on('click', 'button.close', function(e){
				
				// 화면상의 해당알림 행 삭제
 				$(this).closest("tr").remove();
				
				// 콘솔 찍어서 들어오는 값 확인
				//console.log(">>> postno = " + $(this).closest("tr").find('.newNotiPostTitle').data("postno"));
				click_postNo = $(this).closest("tr").find('.newNotiPostTitle').data("postno");
				
				if (click_postNo !== "" ) {
					
					$.put("${pageContext.request.contextPath}/noti", {
						"postNo" : click_postNo,
						"postNoti" : "Y"
					}, function(json) {
						if (json.rt == "OK") {
							console.log("postNoti가 개별수정 되었습니다. 수정된 postNoti : " + click_postNo);
						}
					});
				}
				
				
				// 콘솔 찍어서 들어오는 값 확인
				//console.log(">>> commNo = " + $(this).closest("tr").find('.newNotiCommContent').data("commno"));
				click_commNo = $(this).closest("tr").find('.newNotiCommContent').data("commno");
				
				if (click_commNo !== "") {
					$.put("${pageContext.request.contextPath}/noti", {
						"commNo" : click_commNo,
						"commNoti" : 1
					}, function(json) {
						if (json.rt == "OK") {
							console.log("commNoti가 개별수정 되었습니다. 수정된 commNoti : " + click_commNo);
						}
					});
				}
			});

		/** 전체삭제 버튼 클릭시 알람 전체 삭제 */
		  $(document).on('click', '.btn_delAll', function(e) {
				$('.noti-table').html("새로운 알람이 없습니다.");
				
				$.put("${pageContext.request.contextPath}/noti", {
	  				   "postNoti" : "Y",
	  				   "commNoti" : "Y"
		    		},
	    			function(json) {
	    				if (json.rt == "OK") {
	    				}
	    			});

			});
		

		var userNo = ${zigme_user.userNo};
		//console.log("###########" + userNo);
		/*
			$.ajax({		 
         	async: false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
 			// 결과를 읽어올 URL
 			url: '${pageContext.request.contextPath}/noti/noti_view_test.do',
 			// 웹 프로그램에게 데이터를 전송하는 방식.(생략할 경우 get)
 			method: 'get',
 			// 읽어온 내용을 처리하기 위한 함수
 			data: {"userNo" : userNo}, 			
 			dataType: 'json', 			
 			success: function(req) {
 				console.log(req);
 			}
 		}); // end $.ajax
		*/
		// window.location = '${pageContext.request.contextPath}/noti/noti_view_test.do?userNo=' + userNo;
		 
	 }); 
	 
	 
	</script>

	
</body>

</html>