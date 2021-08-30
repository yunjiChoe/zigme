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

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />

<!-- 스타일 지정 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/util.css" />
<style type="text/css">

.noAlarm{
	font-size: 20px;
	font-weight: bold;
}

.date_colored {
	color: #4041FE;
}

.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
    padding-left: 170px;
}

#button_s {
    color: white;
}

</style>
<script type="text/javascript">

function getCheckboxValue(event) {
	let result = '';
	  if(event.target.checked)  {
	    result = event.target.value;
	  }else {
	    result = '';
	  }
	  
	  //console.log(">>>>>>>>>>>>>>>>>>체크된 항목의 value값: "+result);
}
</script>
</head>
<body>
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hiddendden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="addalarmForm"
					action="${pageContext.request.contextPath}/util/util_alarm_add.do" method="POST">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<div class="modal-title" id="myModalLabel">
							<select id="AP" name="AP" style="border: none;">
								<option value="am" selected style="color: #4041ef;">AM</option>
								<option value="pm" style="color: #4041ef;">PM</option>
							</select> <input type="text" id="hour" class="time" name="hour"
								 /> <span>&nbsp;</span> <span id="seperator">:</span>
							<span>&nbsp;</span> <input type="text" id="min" class="time"
								name="min"/>
						</div>
					</div>
					<div class="modal-body">
						<span class="modal_dis">반복 </span>
						<div class="input-group">							
							<div class="check_date" id="check_mon">
								<input type="checkbox" name="monAct" id="mon" value="Y" > <label for="mon"></label>
							</div>
							<div class="check_date" id="check_tue">
								<input type="checkbox" name="tueAct" id="tue" value="Y"> <label for="tue"></label>
							</div>
							<div class="check_date" id="check_wed">
								<input type="checkbox" name="wedAct" id="wed" value="Y"> <label for="wed"></label>
							</div>
							<div class="check_date" id="check_thu">
								<input type="checkbox" name="thuAct" id="thu" value="Y"> <label for="thu"></label>
							</div>
							<div class="check_date" id="check_fri">
								<input type="checkbox" name="friAct" id="fri" value="Y"> <label for="fri"></label>
							</div>
							<div class="check_date" id="check_sat">
								<input type="checkbox" name="satAct" id="sat" value="Y"> <label for="sat"></label>
							</div>
							<div class="check_date" id="check_sun">
								<input type="checkbox" name="sunAct" id="sun" value="Y"> <label for="sun"></label>
							</div>
						</div>
						<div>
							<label for="alarm_name" class="modal_dis2">알람 내용</label> <input
								type="text" name="alarmContent" id="alarm_name" />
								<input type="hidden" name= "userNo" value="${zigme_user.userNo}" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="button_c" data-dismiss="modal">취소</button>
						<span>&nbsp;</span>
						<button type="submit" id="button_s">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content">
			<div id="alarm_upper">
				<span id="alarm_icon"> <img
					src="${pageContext.request.contextPath}/img/util/alarm_icon.png"
					width="79px" height="65px" /> <span class="sub_title">${zigme_user.nickname}님의
						알람</span>
				</span>
			</div>
		</div>
		<div id="alarm_body">
			<div id="alarm_component"
				data-alarmlength="${fn:length(output_alarm)}">
				<c:choose>
					<c:when
						test="${output_alarm == null || fn:length(output_alarm) == 0}">
						<tr align="right">
							<td colspan="9" align="center">
								<font size="20px" weight= "bold">
								알람을 추가해주세요!
								</font>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="item" items="${output_alarm}" varStatus="status">
							<%-- <c:url value="/help_ajax/help_comm_read.do" var="viewUrl">
                            		<c:param name="postNo" value="${item.postNo}" />
                        		</c:url> --%>
							<div class="row_elements">
								<div class="on_off" data-alarmtime="${item.alarmTime}"
									data-userno="${item.userNo}"
									data-alarmcontent="${item.alarmContent}"
									data-alarmno="${item.alarmNo}" data-alarmact="${item.alarmAct}">

									<input type="checkbox" class="check" /> <label
										class="on_off_items" for="check"></label>


								</div>
								<div>
									${item.alarmTime}
								</div>
								<div class="alarm_title">${item.alarmContent}</div>
								<div class="dates" data-monact= "${item.monAct}" data-tueact= "${item.tueAct}" data-wedact= "${item.wedAct}" 
									data-thuact= "${item.thuAct}" data-friact= "${item.friAct}" 
									data-satact= "${item.satAct}" data-sunact= "${item.sunAct}" >
									<span class="mon">M</span> <span>&nbsp;</span> <span class="tue">T</span> <span>&nbsp;</span>
									<span class="wed">W</span> <span>&nbsp;</span> <span class="thu">T</span> <span>&nbsp;</span>
									<span class="fri">F</span> <span>&nbsp;</span> <span class="sat">S</span> <span>&nbsp;</span>
									<span class="sun">S</span>
								</div>
								<div>
									<a href="#"> <span class="glyphicon glyphicon-remove" data-alarmno="${item.alarmNo}"></span></a>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</div>
			<br /> <a href="#myModal" data-toggle="modal" class="pull-right"
				id="add_button"> <img
				src="${pageContext.request.contextPath}/img/util/alarm_add_button.png"
				width="50px" height="50px" />
			</a>
		</div>
	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />

	<script id="alarm-list-tmpl" type="text/x-handlebars-template">
		{{#each item}}
									<div class="row_elements">
									<div class="on_off"
									data-alarmtime = "{{output_alarm.alarmTime}}" data-userno = "{output_alarm.userNo}}"
									data-alarmcontent = "{{output_alarm.alarmContent}}" data-alarmdate = "{{output_alarm.alarmDate}}" 
									data-alarmno = "{{output_alarm.alarmNo}}" data-alarmact = "{{output_alarm.alarmAct}}">
									</div>
									<div>{{output_alarm.alarmTime}}</div>
									<div class="alarm_title">{{output_alarm.alarmContent}}</div>
									<input type="checkbox" class="check" />
									<label class="on_off_items" for="check"></label> 
									<div class="dates" data-monact= "{{output_alarm.monAct}}" 
									data-tueact= "{{output_alarm.tueAct}}" data-wedact= "{{output_alarm.wedAct}}" 
									data-thuact= "{{output_alarm.thuAct}}" data-friact= "{{output_alarm.friAct}}" 
									data-satact= "{{output_alarm.satAct}}" data-sunact= "{{output_alarm.sunAct}}">
									<span>M</span> <span>&nbsp;</span> <span>T</span> <span>&nbsp;</span>
									<span>W</span> <span>&nbsp;</span> <span>T</span> <span>&nbsp;</span>
									<span>F</span> <span>&nbsp;</span> <span>S</span> <span>&nbsp;</span>
									<span>S</span>
									</div>
									<div>
										<a href="#"> <span class="glyphicon glyphicon-remove" data-alarmno="{{output_alarm.alarmNo}}"></span></a>
									</div>
								</div>
		{{/each}}
    </script>

	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Handlebar CDN 참조 -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/ajax/ajax_helper.js"></script>

	<script type="text/javascript">
		$(function() {
			function updateDates() {
				var alarmLength = $("#alarm_component").data("alarmlength");
				
				for (var i=0; i < alarmLength;i++) {
					
					var dates = new Array();
					var words = [".mon", ".tue", ".wed", ".thu", ".fri", ".sat", ".sun"];
					
					dates[0] = $("#alarm_component").children().eq(i)
							.children(".dates").data("monact");
					
					dates[1] = $("#alarm_component").children().eq(i)
						.children(".dates").data("tueact");
					
					dates[2] = $("#alarm_component").children().eq(i)
						.children(".dates").data("wedact");
					
					dates[3] = $("#alarm_component").children().eq(i)
						.children(".dates").data("thuact");
					
					dates[4] = $("#alarm_component").children().eq(i)
						.children(".dates").data("friact");
					
					dates[5] = $("#alarm_component").children().eq(i)
						.children(".dates").data("satact");
					
					dates[6] = $("#alarm_component").children().eq(i)
						.children(".dates").data("sunact");
					
					console.log(dates);
					
					for(var j = 0; j < 7; j++) {
						if(dates[j] == "Y") {
							var testinput = $("#alarm_component").children().eq(i)
								.children(".dates").children(words[j]).addClass("date_colored");
						}
					}
					
					/* if(dates[0] == "Y") {
						var testinput = $("#alarm_component").children().eq(i)
							.children(".dates").children(words[0]).addClass("date_colored");
					} */
					
					/* if(mon == "Y") {
						var testinput = $("#alarm_component").children().eq(i)
								.children(".on_off").children(".dates").children(".mon")
								.addClass("date_colored");
						
						console.log(">>>>>>>>>>>>>>>>>>>>>>>>>" +testinput);
					} */
				}
			}
			
			function startCheck() {
				var alarmLength = $("#alarm_component").data("alarmlength");

				for (var i = 0; i < alarmLength; i++) {
					var alarmActStart = $("#alarm_component").children().eq(i)
							.children(".on_off").data("alarmact");
					console.log(alarmActStart);

					if (alarmActStart == "Y") {
						var testinput = $("#alarm_component").children().eq(i)
								.children(".on_off").children(".check")
								.addClass("on_off_checked");
						$("#alarm_component").children().eq(i).css(
								"background-color", "#CFE1FC");
					}
				}
			}

			$(document).on('click', ".glyphicon-remove", function(e) {
				e.preventDefault();						
				var alarmNoItem = $(this).data("alarmno");
				
				$.delete(
						"${pageContext.request.contextPath}/alarm",
						{
							"alarmNo" : alarmNoItem,
						},
						function(json) {
							if (json.rt == "OK") {
								alert("해당 알람이 삭제 되었습니다.");
							}
						});
				
				$(this).closest(".row_elements").remove();
			});

			$(".on_off").click(function() {
				//console.log(">>>>>>>>>>>>>>>>>>클릭이벤트 구현");
				var alarmNoItem = $(this).data("alarmno");
				console.log(alarmNoItem);

				var alarmActItem = $(this).data("alarmact");
				console.log(alarmActItem);

				var alarmTimeItem = $(this).data("alarmtime");
				console.log(alarmTimeItem);

				var alarmContentItem = $(this).data("alarmcontent");
				console.log(alarmContentItem);

				var alarmUserItem = $(this).data("userno");
				console.log(alarmUserItem);
				
				var currentAct = "";

				switch (alarmActItem) {
					case 'N':
						var test1 = $(this).children(".check").addClass("on_off_checked");
									$(this).closest(".row_elements").css("background-color", "#CFE1FC");
									console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<" +test1);

									$.put("${pageContext.request.contextPath}/alarm",
													{
														"alarmNo" : alarmNoItem,
														"alarmAct" : "Y",
														"alarmContent" : alarmContentItem,
														"alarmTime" : alarmTimeItem												
													},
													function(json) {
														if (json.rt == "OK") {
															let userinfoNo = ${zigme_user.userNo};
															
															$.get("${pageContext.request.contextPath}/alarm?userNo=" +userinfoNo, {

															// 페이지 번호는 GET 파라미터로 전송한다.
															}, function(json) {
																console.log(">>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<처음 페이지 진입후 $.get 이 샐행됨");
																var source = $("alarm-list-tmpl").html(); // 템플릿 코드 가져오기
																var template = Handlebars.compile(source); // 템플릿 코드 컴파일
																var result = template(json); // 템플릿 컴파일 결과물에 json 전달
																$("#alarm_component").append(result); // 최종 결과물을 #list 요소에 추가한다.
															});
														}
													});
													break;
									
									
								case 'Y':
									var test2 = $(this).children(".check")
											.removeClass("on_off_checked");
									$(this).closest(".row_elements").css(
											"background-color", "#E5E5E5");
									console.log(test2);

									
											$.put(
													"${pageContext.request.contextPath}/alarm",
													{
														"alarmNo" : alarmNoItem,
														"alarmAct" : "N",
														"alarmContent" : alarmContentItem,
														"alarmTime" : alarmTimeItem,
														"userNo" : alarmUserItem,

													},
													function(json) {
														if (json.rt == "OK") {
															let userinfoNo = ${zigme_user.userNo};
															
															$.get("${pageContext.request.contextPath}/alarm?userNo=" +userinfoNo, {
															// 페이지 번호는 GET 파라미터로 전송한다.
															}, function(json) {
																console.log(">>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<처음 페이지 진입후 $.get 이 샐행됨");
																var source = $("alarm-list-tmpl").html(); // 템플릿 코드 가져오기
																var template = Handlebars.compile(source); // 템플릿 코드 컴파일
																var result = template(json); // 템플릿 컴파일 결과물에 json 전달
																$("#alarm_component").append(result); // 최종 결과물을 #list 요소에 추가한다.
															});
														}													
													});												
													break;
								}
								window.setTimeout(function(){
									let userinfoNo = ${zigme_user.userNo};
									location.replace("${pageContext.request.contextPath}/util/util_alarm.do?type=" +userinfoNo)
	                  			}, 700);
							});

			$(document).ready(function() {
				let userinfoNo = ${zigme_user.userNo};
				
				// Restful API에 GET 방식 요청
				$.get("${pageContext.request.contextPath}/alarm?userNo=" +userinfoNo, {
		
				// 페이지 번호는 GET 파라미터로 전송한다.
				}, function(json) {
					console.log(">>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<처음 페이지 진입후 $.get 이 샐행됨");
					var source = $("alarm-list-tmpl").html(); // 템플릿 코드 가져오기
					var template = Handlebars.compile(source); // 템플릿 코드 컴파일
					var result = template(json); // 템플릿 컴파일 결과물에 json 전달
					$("#alarm_component").append(result); // 최종 결과물을 #list 요소에 추가한다.
				});
				

				startCheck();
				updateDates();	
			});
			
			function getUpdate() {
				let userinfoNo = ${zigme_user.userNo};

				// Restful API에 GET 방식 요청
				$.get("${pageContext.request.contextPath}/alarm", {
					"userNo" : userinfoNo
				// 페이지 번호는 GET 파라미터로 전송한다.
				}, function(json) {
					var source = $("alarm-list-tmpl").html(); // 템플릿 코드 가져오기
					var template = Handlebars.compile(source); // 템플릿 코드 컴파일
					var result = template(json); // 템플릿 컴파일 결과물에 json 전달
					$("#alarm_component").append(result); // 최종 결과물을 #list 요소에 추가한다.
				});
			}
		});
	</script>
</body>
</html>