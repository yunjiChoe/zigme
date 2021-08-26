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
/** help CSS에서  td 제어시 절대 td 단독 사용 금지 -> help_comm에서만 허용 */

.formcon_chart {
	padding: 0px;
	font-size: 13px;
}

#parent.formcon_chart {
	font-family: none;
	margin-bottom: 6px;
}

option {
	font-family: none;
}

.between {
	font-size: 25px;
}

.view {
	margin-bottom: 6px;
	margin-left: 10px;
}

.textmining {
	width: 920px;
	height: 920px;
	margin: auto;
	background-image: url("${pageContext.request.contextPath}/img/help/help_chart.png");
	background-size: 100% 100%;
	text-align: center;
	font-size: 50px;
}

.table .help_chart_table {
	width: 80%;
	margin-left: 120px;
}

.help_chart_table>thead>tr>th, .help_chart_table>tbody>tr>td {
	vertical-align: middle;
}

.chartsort{
	color: #4041fe;
	font-size: 20px;
	text-align: center;
	padding-top: 0;
	vertical-align: middle;
}

.chartrank{ /** help_chart CSS에서  td 제어시 절대 td 단독 사용 금지 -> help_comm에서만 허용 */
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	vertical-align: middle;
}

.first {
	font-family: 'S-CoreDream-6Bold';
	font-size: 40px;
	color: #b14eff;
	margin: 10px 0;
}

.second {
	font-family: 'S-CoreDream-5Medium';
	font-size: 37px;
	text-align: center;
	color: #9867ff;
	margin: 10px 0;
}

.third {
	font-family: 'S-CoreDream-5Medium';
	font-size: 34px;
	text-align: center;
	color: #728dff;
	margin: 10px 0;
}

.fourth {
	font-family: 'S-CoreDream-4Regular';
	font-size: 31px;
	text-align: center;
	color: #609fff;
	margin: 10px 0;
}

.fifth {
	font-family: 'S-CoreDream-4Regular';
	font-size: 28px;
	text-align: center;
	color: #4fb0ff;
	margin: 10px 0;
}

.no {
	width: 10%;
}

.count {
	width: 10%;
}

.click {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content">
			<p class="sub_title">메이트들의 고민은?</p>
		</div>
			<!-- <form class="form-inline pull-right">
				<div class="form-group">
					<select id="parent" class="form-control formcon_chart">
						<option class="help_chart_cal" value="">--- 선택하세요 ---</option>
						<option class="help_chart_cal" value="202010">2020년 10월</option>
						<option class="help_chart_cal" value="202011">2020년 11월</option>
						<option class="help_chart_cal" value="202012">2020년 12월</option>
					</select>
				</div>
				<span class="between"> &nbsp;<strong>~</strong>&nbsp;
				</span>
				<div class="form-group">
					<select id="parent" class="form-control formcon_chart">
						<option value="">--- 선택하세요 ---</option>
						<option value="202106">2021년 6월</option>
						<option value="202107">2021년 7월</option>
						<option value="202108">2021년 8월</option>
					</select>
				</div>
				<button type="button" class="btn btn-default view">
					<b>조회</b>
				</button>
			</form> -->

			

			<div class="textmining">
				<br> <img src="${pageContext.request.contextPath}/img/help/wordcloud.png">
			</div>

			<br> <br>

			<p class="sub_title">키워드 Top 5</p>
			<table class="table help_chart_table">
				<thead>
					<tr class="info">
						<th class="no chartsort">RANK</th>
						<th class="chartsort">키워드</th>
						<th class="count chartsort">횟수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="no chartrank">1</td>
						<td class="chartrank"><h1 class="click first" onClick="location.href='${pageContext.request.contextPath}/help_ajax/help_comm.do?keyword1=코로나'">코로나</h1></td>
						<td class="count chartrank">126</td>
					</tr>
					<tr>
						<td class="no chartrank">2</td>
						<td class="chartrank"><h2 class="click second" onClick="location.href='${pageContext.request.contextPath}/help_ajax/help_comm.do?keyword1=상사'">상사</h2></td>
						<td class="count chartrank">98</td>
					</tr>
					<tr>
						<td class="no chartrank">3</td>
						<td class="chartrank"><h3 class="click third" onClick="location.href='${pageContext.request.contextPath}/help_ajax/help_comm.do?keyword1=월요일'">월요일</h3></td>
						<td class="count chartrank">85</td>
					</tr>
					<tr>
						<td class="no chartrank">4</td>
						<td class="chartrank"><h4 class="click fourth" onClick="location.href='${pageContext.request.contextPath}/help_ajax/help_comm.do?keyword1=회식'">회식</h4></td>
						<td class="count chartrank">56</td>
					</tr>
					<tr>
						<td class="no chartrank">5</td>
						<td class="chartrank"><h5 class="click fifth" onClick="location.href='${pageContext.request.contextPath}/help_ajax/help_comm.do?keyword1=업무'">업무</h5></td>
						<td class="count chartrank">48</td>
					</tr>
				</tbody>
			</table>
		
	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />

</body>
</html>