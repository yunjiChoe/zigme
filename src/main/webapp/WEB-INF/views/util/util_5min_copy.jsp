<!--
     Date : 2021/08/05
     Writer : 안다솜
     Content : 작업 시작
     version : V1.0.1
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
	width: auto;
}
</style>

</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div id="min5_header">
			<p class="sub_title">5분 스트레칭</p>
			<button type="button" class="btns_margin btn btn-primary btn-lg"
				id="min5_all">전체</button>
			<button type="button" class="btns_margin btn btn-info btn-lg"
				id="min5_neck">목</button>
			<button type="button" class="btns_margin btn btn-info btn-lg"
				id="min5_shou">어깨</button>
			<button type="button" class="btns_margin btn btn-info btn-lg"
				id="min5_waist">허리</button>
			<button type="button" class="btns_margin btn btn-info btn-lg"
				id="min5_wrist">손목</button>

			<hr />
		</div>
		
		
		<div id="min5_body">
			
		</div>
		<a href="#" class="btn btn-default pull-right fix_btn">TOP</a>

	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />
	<script type="text/javascript">
		$(function() {

			var all_data = [ "" ];
			var neck_data = [ "" ];
			var shou_data = [ "" ];
			var waist_data = [ "" ];
			var wrist_data = [ "" ];

			function data_load(count) {
				// 요소 설정 setting 값 read
				$.ajax({
					async : false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
					url : '${pageContext.request.contextPath}/assets/data/min5_list_all.json',
					method : 'get',
					data : {},
					dataType : 'JSON',
					success : function(req) {
						all_data = req.documents;
						//console.log(all_data[0].title);
					},
					error : function() {
						alert("일시적인 오류가 발생하였습니다.");
					}
				});

				var result = "";
				var video_url = "";
				for (var i = 0; i < count; i++) {					    				
					video_url = all_data[i].url.split("?v=");
					
					result += "<div class='video_area'><iframe width='560' height='315' src='https://www.youtube.com/embed/" + video_url[1] + "' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";
					result += "<p class='video_title'>" + all_data[i].title
							+ "</p></div>"
				}
				$("#min5_body").html(result);
			}

			function all_load(param) {

				var result = "";
				var video_url = "";
				var impl_array = [ "" ];
				var count = 5;

				for (var i = 0; i < count; i++) {

					if (param == "all") {
						video_url = all_data[i].url.split("?v=");
						impl_array = all_data;
					} else if (param == "neck") {
						video_url = neck_data[i].url.split("?v=");
						impl_array = neck_data;
					} else if (param == "shou") {
						video_url = shou_data[i].url.split("?v=");
						impl_array = shou_data;
					} else if (param == "waist") {
						video_url = waist_data[i].url.split("?v=");
						impl_array = waist_data;
					} else {
						video_url = wrist_data[i].url.split("?v=");
						impl_array = wrist_data;
					}

					result += "<div class='video_area'><iframe width='560' height='315' src='https://www.youtube.com/embed/" + video_url[1] + "' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";
					result += "<p class='video_title'>" + impl_array[i].title
							+ "</p></div>"
				}

				$("#min5_body").empty();
				$("#min5_body").html(result);
			}

			$("#min5_all").click(function() {
				if (all_data == "") {
					//console.log("최초한번 실행");
					$.ajax({
						async : false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
						url : '${pageContext.request.contextPath}/assets/data/min5_list_all.json',
						method : 'get',
						data : {},
						dataType : 'JSON',
						success : function(req) {
							all_data = req.documents;
						},
						error : function() {
							alert("일시적인 오류가 발생하였습니다.");
						}
					});
				}
				all_load("all");
			});

			$("#min5_neck").click(function() {
				if (neck_data == "") {
					//console.log("최초한번 실행");
					$.ajax({
						async : false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
						url : '${pageContext.request.contextPath}/assets/data/min5_list_neck.json',
						method : 'get',
						data : {},
						dataType : 'JSON',
						success : function(req) {
							neck_data = req.documents;
						},
						error : function() {
							alert("일시적인 오류가 발생하였습니다.");
						}
					});
				}
				all_load("neck");
			});

			$("#min5_shou").click(function() {
				if (shou_data == "") {
					//console.log("최초한번 실행");
					$.ajax({
						async : false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
						url : '${pageContext.request.contextPath}/assets/data/min5_list_shou.json',
						method : 'get',
						data : {},
						dataType : 'JSON',
						success : function(req) {
							shou_data = req.documents;
						},
						error : function() {
							alert("일시적인 오류가 발생하였습니다.");
						}
					});
				}
				all_load("shou");
			});

			$("#min5_waist").click(function() {
				if (waist_data == "") {
					//console.log("최초한번 실행");
					$.ajax({
						async : false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
						url : '${pageContext.request.contextPath}/assets/data/min5_list_waist.json',
						method : 'get',
						data : {},
						dataType : 'JSON',
						success : function(req) {
							waist_data = req.documents;
						},
						error : function() {
							alert("일시적인 오류가 발생하였습니다.");
						}
					});
				}
				all_load("waist");
			});

			$("#min5_wrist").click(function() {
				if (wrist_data == "") {
					//console.log("최초한번 실행");
					$.ajax({
						async : false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
						url : '${pageContext.request.contextPath}/assets/data/min5_list_wrist.json',
						method : 'get',
						data : {},
						dataType : 'JSON',
						success : function(req) {
							wrist_data = req.documents;
						},
						error : function() {
							alert("일시적인 오류가 발생하였습니다.");
						}
					});
				}
				all_load("wrist");
			});

			data_load(5);

		});
	</script>
</body>
</html>