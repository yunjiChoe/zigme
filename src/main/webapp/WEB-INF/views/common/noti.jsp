<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/ScoreDreamWebFont.css" />

<%@ include file="../inc/header.jsp"%>

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
		<%@ include file="../inc/navbar.jsp"%>
		<div class="page-header">
			<h1>알 림</h1>
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
					<tr class="noti_row on">
						<td>1</td>
						<td
							onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'장마철..레인부츠 VS 슬리퍼, 당신의 선택은?' 덧글에 추천(<span class="noti_new">
								3 </span>)이 달렸습니다.
						</td>
						<td>2021-06-18 18:00</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row on">
						<td>2</td>
						<td
							onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'장마철..레인부츠 VS 슬리퍼, 당신의 선택은?' 덧글에 덧글(<span class="noti_new">
								1 </span>)이 달렸습니다.
						</td>
						<td>2021-06-18 08:14</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row on">
						<td>3</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'여름은 콩국수의 계절! 양재/역삼/강남 콩국수 맛집 공유해봐요' 덧글에 추천(<span
							class="noti_new"> 19 </span>)이 달렸습니다.
						</td>
						<td>2021-06-03 15:07</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row on">
						<td>4</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'여름은 콩국수의 계절! 양재/역삼/강남 콩국수 맛집 공유해봐요' 덧글에 덧글(<span
							class="noti_new"> 9 </span>)이 달렸습니다.
						</td>
						<td>2021-06-02 11:24</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row on">
						<td>5</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'6월달 빨간 날 없는거 실화인가요?' 덧글에 덧글(<span class="noti_new"> 2 </span>)이
							달렸습니다.
						</td>
						<td>2021-05-30 18:34</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row">
						<td>6</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'6월달 빨간 날 없는거 실화인가요?' 게시글에 추천(<span> 3 </span>)이 달렸습니다.
						</td>
						<td>2021-05-30 15:46</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row">
						<td>7</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'6월달 빨간 날 없는거 실화인가요?' 게시글에 덧글(<span> 24 </span>)이 달렸습니다.
						</td>
						<td>2021-05-30 15:45</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row">
						<td>8</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'부장님의 무리한 지시에서 벗어나는 법' 게시글에 덧글(<span> 3 </span>)이 달렸습니다.
						</td>
						<td>2021-05-28 18:34</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row">
						<td>9</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'부장님의 무리한 지시에서 벗어나는 법' 게시글이 추천(<span> 5 </span>) 되었습니다.
						</td>
						<td>2021-05-28 18:28</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>

					</tr>
					<tr class="noti_row">
						<td>10</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'오늘은 금요일! 신난다~~' 게시글이 추천(<span> 55 </span>) 되었습니다.
						</td>
						<td>2021-05-28 16:10</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row">
						<td>11</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'새내기 신입 조언 부탁드려요 ㅠㅠ.'의 댓글에 댓글(<span> 1 </span>)이 달렸습니다.
						</td>
						<td>2021-05-28 10:34</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row">
						<td>12</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">'회식
							가기 싫어요...'의 댓글이 추천(<span> 61 </span>) 되었습니다.
						</td>
						<td>2021-05-26 13:45</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row">
						<td>13</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'대부도 근처 캠핑장 추천 부탁드려요' 게시글에 덧글(<span> 18 </span>)이 달렸습니다.
						</td>
						<td>2021-05-25 09:07</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row">
						<td>14</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'대부도 근처 캠핑장 추천 부탁드려요' 게시글이 추천(<span> 29 </span>) 되었습니다.
						</td>
						<td>2021-05-25 09:02</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row">
						<td>15</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">'이런
							경우에 어떻게 하나요?'의 댓글이 추천(<span> 10 </span>) 되었습니다.
						</td>
						<td>2021-05-22 01:23</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
					<tr class="noti_row">
						<td>16</td>
						<td onClick="location.href='${pageContext.request.contextPath}/help/help_comm_read'">
							'출근룩으로 이거 어떤가요?' 게시글이 추천(<span> 3 </span>) 되었습니다.
						</td>
						<td>2021-05-21 16:10</td>
						<td class="delnoti"><button type="button"
								class="close close-btn" aria-hidden="true">&times;</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
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

	<%@ include file="../inc/footer.jsp"%>
</body>

</html>