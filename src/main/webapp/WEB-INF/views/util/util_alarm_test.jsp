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

<!-- 스타일 지정 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/util.css" />

<style type="text/css">
.input-group {
	display: inline;
	padding-left: 80px;
}

input::-webkit-input-placeholder {
	color: #4041ef;
}
</style>
</head>
<body>
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hiddendden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="modal-title" id="myModalLabel">
						<select id="AP" name="mal" style="border: none;">
							<option value="am" selected style="color: #4041ef;">AM</option>
							<option value="pm" style="color: #4041ef;">PM</option>
						</select> <input type="text" id="hour" class="time" name="hour"
							placeholder="00" /> <span>&nbsp;</span> <span id="seperator">:</span>
						<span>&nbsp;</span> <input type="text" id="min" class="time"
							name="min" placeholder="00" />
					</div>
				</div>
				<div class="modal-body">
					<span class="modal_dis">반복 </span>
					<div class="input-group">
						<div class="check_date" id="check_mon">
							<input type="checkbox" id="mon"> <label for="mon"></label>
						</div>
						<div class="check_date" id="check_tue">
							<input type="checkbox" id="tue"> <label for="tue"></label>
						</div>
						<div class="check_date" id="check_wed">
							<input type="checkbox" id="wed"> <label for="wed"></label>
						</div>
						<div class="check_date" id="check_thu">
							<input type="checkbox" id="thu"> <label for="thu"></label>
						</div>
						<div class="check_date" id="check_fri">
							<input type="checkbox" id="fri"> <label for="fri"></label>
						</div>
						<div class="check_date" id="check_sat">
							<input type="checkbox" id="sat"> <label for="sat"></label>
						</div>
						<div class="check_date" id="check_sun">
							<input type="checkbox" id="sun"> <label for="sun"></label>
						</div>
					</div>
					<div>
						<label for="alarm_name" class="modal_dis">알람 내용</label> <input
							type="text" name="alarm_name" id="alarm_name" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="button_c" data-dismiss="modal">취소</button>
					<span>&nbsp;</span>
					<button type="button" id="button_s" data-dismiss="modal">저장</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content">
			<div id="alarm_upper">
				<span id="alarm_icon"> <img src="${pageContext.request.contextPath}/img/util/alarm_icon.png"
					width="79px" height="65px" /> <span class="sub_title">알람</span>
				</span>
			</div>
		</div>
		<div id="alarm_body">
			<div id="alarm_component">
				<div class="row_elements" id="row_element_1">
					<div class="on_off">
						<input type="checkbox" id="check1"> <label id="on_off1"
							for="check1"></label>
					</div>
					<div>10:30</div>
					<div class="alarm_title">택배 확인하기</div>
					<div>
						<span>M</span> <span>&nbsp;</span> <span>T</span> <span>&nbsp;</span>
						<span>W</span> <span>&nbsp;</span> <span>T</span> <span>&nbsp;</span>
						<span>F</span> <span>&nbsp;</span> <span>S</span> <span>&nbsp;</span>
						<span>S</span>
					</div>
					<div>
						<a href="#"> <span class="glyphicon glyphicon-remove"></span>
						</a>
					</div>
				</div>


				<div class="row_elements" id="row_element_2">
					<div class="on_off">
						<input type="checkbox" id="check2"> <label id="on_off2"
							for="check2"></label>
					</div>
					<div>11:20</div>
					<div class="alarm_title">워크샵 회의</div>
					<div>
						<span>M</span> <span>&nbsp;</span> <span>T</span> <span>&nbsp;</span>
						<span>W</span> <span>&nbsp;</span> <span>T</span> <span>&nbsp;</span>
						<span>F</span> <span>&nbsp;</span> <span>S</span> <span>&nbsp;</span>
						<span>S</span>
					</div>
					<div>
						<a href="#"> <span class="glyphicon glyphicon-remove"></span>
						</a>
					</div>
				</div>
				<div class="row_elements" id="row_element_3">
					<div class="on_off">
						<input type="checkbox" id="check3"> <label id="on_off3"
							for="check3"></label>
					</div>
					<div>15:40</div>
					<div class="alarm_title">3층 세미나실 회의</div>
					<div>
						<span>M</span> <span>&nbsp;</span> <span>T</span> <span>&nbsp;</span>
						<span>W</span> <span>&nbsp;</span> <span>T</span> <span>&nbsp;</span>
						<span>F</span> <span>&nbsp;</span> <span>S</span> <span>&nbsp;</span>
						<span>S</span>
					</div>
					<div>
						<a href="#"> <span class="glyphicon glyphicon-remove"></span>
						</a>
					</div>
				</div>
				<div class="row_elements" id="row_element_4">
					<div class="on_off">
						<input type="checkbox" id="check4"> <label id="on_off4"
							for="check4"></label>
					</div>
					<div>16:40</div>
					<div class="alarm_title">사수님 간식 챙겨드릴 시간</div>
					<div>
						<span>M</span> <span>&nbsp;</span> <span>T</span> <span>&nbsp;</span>
						<span>W</span> <span>&nbsp;</span> <span>T</span> <span>&nbsp;</span>
						<span>F</span> <span>&nbsp;</span> <span>S</span> <span>&nbsp;</span>
						<span>S</span>
					</div>
					<div>
						<a href="#"> <span class="glyphicon glyphicon-remove"></span>
						</a>
					</div>
				</div>
			</div>

			<br /> <a href="#myModal" data-toggle="modal" class="pull-right"
				id="add_button"> <img src="${pageContext.request.contextPath}/img/util/alarm_add_button.png"
				width="50px" height="50px" />
			</a>
		</div>
	</div>
	<!-- //container 종료 -->

	<script type="text/javascript">
		// 미리 준비한 틀에 출력될 내용을 JSON으로 준비
	</script>

	<script type="text/x-handlebars-template" id="content-tmpl">
         <div class="row_elements" id="{{row_element_num}}">
                    <div class="on_off">
                        <input type="checkbox" id="{{check_num}}">
                        <label id="{{on_off_num}}" for="{{check_num}}"></label>
                    </div>
                    <div>{{alarm_time}}</div>
                    <div class="alarm_title">{{alarm_title}}</div>
                    <div>
                        <span>M</span>
                        <span>&nbsp;</span>
                        <span>T</span>
                        <span>&nbsp;</span>
                        <span>W</span>
                        <span>&nbsp;</span>
                        <span>T</span>
                        <span>&nbsp;</span>
                        <span>F</span>
                        <span>&nbsp;</span>
                        <span>S</span>
                        <span>&nbsp;</span>
                        <span>S</span>
                    </div>
                    <div>
                        <a href="#">
                            <span class="glyphicon glyphicon-remove"></span>
                        </a>
                    </div>
                </div>
    </script>

	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugin/handlebars/handlebars-v4.7.6.js"></script>

	<script type="text/javascript">
		var index = 1;
		var alarm_list = [ {
			"time" : "10:30",
			"title" : "택배 확인하기",
			"date_active" : "[0,1,0,0,1,0,0]",
			"active" : "true"
		}, {
			"time" : "10:30",
			"title" : "워크샵 회의",
			"date_active" : "[0,0,1,1,1,0,0]",
			"active" : "false"
		}, {
			"time" : "10:30",
			"title" : "3층 세미나실 회의",
			"date_active" : "[1,0,0,0,1,0,0]",
			"active" : "true"
		}, {
			"time" : "10:30",
			"title" : "사수님 간식 챙겨드릴 시간",
			"date_active" : "[1,1,1,1,1,0,0]",
			"active" : "true"
		} ];

		function alarm_item(count) {
			for (var i = 0; i < count; i++) {
				result += "<span>코딩하기 싫어여</span>";
			}
			document.getElementById("alarm_body").innerHTML = result;
		}

		var alarm_active = true;

		$(function() {

			$("#button_s").click(function() {

				content = {
					row_element_num : "row_element_" + index,
					check_num : "check" + index,
					on_off_num : "on_off" + index,
					alarm_time : "12:00",
					alarm_title : "웹툰보기"
				};

				var template = Handlebars.compile($("#content-tmpl").html());

				//custom helper등록 (row_element_num을 인자로 받아서 num과 합친다)

				var html = template(content);
				console.log(index);
				$("#alarm_component").append(html);
				index++;

			});

			$(document).on('click', ".glyphicon-remove", function(e) {
				e.preventDefault();
				$(this).closest(".row_elements").remove();
			});

			$("#on_off1").click(function() {
				console.log(alarm_active);
				switch (alarm_active) {
				case true:
					$("#row_element_1").css("background-color", "#CFE1FC");
					break
				case false:
					$("#row_element_1").css("background-color", "#E5E5E5");
					break
				}
				alarm_active = !alarm_active;
				console.log(alarm_active);
			});

			$("#on_off2").click(function() {
				console.log(alarm_active);
				switch (alarm_active) {
				case true:
					$("#row_element_2").css("background-color", "#CFE1FC");
					break
				case false:
					$("#row_element_2").css("background-color", "#E5E5E5");
					break
				}
				alarm_active = !alarm_active;
				console.log(alarm_active);
			});

			$("#on_off3").click(function() {
				console.log(alarm_active);
				switch (alarm_active) {
				case true:
					$("#row_element_3").css("background-color", "#CFE1FC");
					break
				case false:
					$("#row_element_3").css("background-color", "#E5E5E5");
					break
				}
				alarm_active = !alarm_active;
				console.log(alarm_active);
			});

			$("#on_off4").click(function() {
				console.log(alarm_active);
				switch (alarm_active) {
				case true:
					$("#row_element_4").css("background-color", "#CFE1FC");
					break
				case false:
					$("#row_element_4").css("background-color", "#E5E5E5");
					break
				}
				alarm_active = !alarm_active;
				console.log(alarm_active);
			});

			$("#on_off5").click(function() {
				console.log(alarm_active);
				switch (alarm_active) {
				case true:
					$("#row_element_5").css("background-color", "#CFE1FC");
					break
				case false:
					$("#row_element_5").css("background-color", "#E5E5E5");
					break
				}
				alarm_active = !alarm_active;
				console.log(alarm_active);
			});

			$("#on_off6").click(function() {
				console.log(alarm_active);
				switch (alarm_active) {
				case true:
					$("#row_element_6").css("background-color", "#CFE1FC");
					break
				case false:
					$("#row_element_6").css("background-color", "#E5E5E5");
					break
				}
				alarm_active = !alarm_active;
				console.log(alarm_active);
			});

		});
	</script>

	<c:import url="../inc/footer.jsp" />
</body>
</html>