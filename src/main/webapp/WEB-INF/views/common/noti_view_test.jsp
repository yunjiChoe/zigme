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
			<h1>${item1.postTitle}</h1>
			<div class="table-header">
				<!-- 이미지 삽입 테스트 필요 -->
				<h2>
					<img
						src="${pageContext.request.contextPath}/img/common/reward_icon_influencer.png">
					정자바 님
				</h2>
			</div>
			<div class="summary">
				<p class="noti_txt">
					읽지않은 알림이 <span class=boldchar>5</span>개 있습니다.
				</p>
			</div>
			<hr />
			<div class="noti-box">
				<table class="table noti-table">
					<thead>
						<tr class=info>
							<th>NO.</th>
							<th>알림 내역</th>
							<th>알림 일시</th>
							<th><button type="button" class="btn_delAll">전체삭제</button></th>
						</tr>
					</thead>
					<tbody>
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
							<c:forEach var="item" items="${output}" varStatus="status">

								<%-- 해당글의 페이지로 이동하기 위한 URL --%>
                        		<c:url value="/help_ajax/help_comm_read.do" var="viewUrl">
                            		<c:param name="postNo" value="${item1.postNo}" />
                        		</c:url>
								
								<tr style = "cursor:pointer;" onClick = " location.href='${viewUrl}'">
									<td>'<span>[${item1.postTitle}]</span>' 게시글에 댓글이 <span>${item1.commCount}</span>개 달렸습니다.</td>
									<td>'<span>[${item2.commContent}]</span>' 댓글에 댓글이 <span>${item2.commCount}</span>개 달렸습니다.</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	
	
	
	<script id="post-list-tmpl" type="text/x-handlebars-template">
	{{#each item1}}
	<tr>
         <td>'<span>{{postTitle}}</span>' 게시글에 댓글이 <span>{{commCount}}</span>개 달렸습니다.</td>
		 
    </tr>			
	{{/each}}

	{{#each item2}}
	<tr>
          <td>'<span>{{commContent}}</span>' 댓글에 댓글이 <span>{{commCount}}</span>개 달렸습니다.</td>
    </tr>			
	{{/each}}
	</script>
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script type="text/javascript">
	
		/** 알림 내용 클릭 시 해당 글 페이지로 이동*/
		/** 차후 실제 글로 연결되도록 설정 필요 */
		function writePage() {
			window.location.href = "${pageContext.request.contextPath}/help/help_comm_write";
		}

		/** 마우스 오버시 개별 tr의 색상변경 */
		/** 추후 visited()로 변경 예정, 확인 시 배경 색상 변경 되는 부분 시각화를 위한 임시 코드 */
		$(function() {
			$(".noti_row").mouseover(function() {
				$(this).css("background-color", "#eee")
			});
			$(".noti_row").mouseout(function() {
				$(this).css("background-color", "#fff")
			});
		});

		/** X 버튼 클릭시 개별 알람 목록 삭제 */
		$(function() {
			$('button.close').click(function() {
				$(this.closest("tr")).remove();
			});
		});

		/** 전체삭제 버튼 클릭시 알람 전체 삭제 */
		$(function() {
			$('button.btn_delAll').click(function() {
				$('tr.noti_row').remove();

			});
		});

		/** DB 연동단계에서 확인/미확인 알림의 <span>요소와 그의 부모 <tr>요소에 대한 처리 필요 --> 미확인visited가상클래스? */
		/** 새로운 알림일 경우 span에 .noti_new 부여 --> .noti_new는 css로 정의 */
		/** noti_new에 해당하는 부모 tr 요소는 css제어가 안되어 js로 정의하였음 */
		/** 상위 5개를 미확인 알림이라고 가정하고 해당 tr 색깔 적용 */
		$('span.noti_new').closest('tr').css('background-color', '#FCE6E6');
	</script>
	
	<!-- Handlebar 템플릿 코드 -->
	
	<script>
	$(function() {
        // Restful API에 GET 방식 요청
        $.get("${pageContext.request.contextPath}/noti", {
        }, function(json) {
            var source = $("post-list-tmpl").html();   	// 템플릿 코드 가져오기
            var template = Handlebars.compile(source);  // 템플릿 코드 컴파일
            var result = template(json);    			// 템플릿 컴파일 결과물에 json 전달
            $("#noti_table").append(result);      		// 최종 결과물을 #list 요소에 추가한다.
        });	
	});
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
		
	<c:import url="../inc/footer.jsp" />
</body>

</html>