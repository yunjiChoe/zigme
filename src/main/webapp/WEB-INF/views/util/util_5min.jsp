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

			function data_load(keyword, page) {
				// 요소 설정 setting 값 read
				$.ajax({
					async : false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
					url : 'https://dapi.kakao.com/v2/search/vclip?query=' + keyword + '&size=30&page=' + page,
					method : 'get',
					beforeSend: function (xhr) {			            
			            xhr.setRequestHeader("Authorization","KakaoAK 357888b843d98f32e260abf0e81dfd2a");
			        },
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
				
			}
			
			function default_load(count, query) { // 다른 스트레칭들도 모두 하나의 함수 호출로 다른 결과를 보여준다. 
				
				var result = "";
				var video_url = "";
				var data_count = 0; 
				var page_count = 1;
				var i = 0;
				
				data_load(query, page_count);				
				
				
				while ( 1 ) {
					
					if(i == all_data.length)						// 30개의 검색결과에서 원하는 count 만큼의 영상이 없을 경우
																	// 다음 페이지 검색결과를 가져와 다시 조건을 판단한다. 
					{
						page_count++;
						if(page_count==16) break;					// 카카오에서 주는 최대 페이지 수 초과시 break;					
						
						data_load(query, page_count);					
						console.log("page_count : " + page_count);
						
						i = 0;
					}
					
					if( parseInt(all_data[i].play_time) > 360 )  		{i++; continue;} // 영상이 6분이 넘을 경우 continue
					if( all_data[i].url.indexOf("youtube") == -1 ) 		{i++; continue;} // 유투브 영상이 아닌경우 continue
					
					// 외부에서 실행안되게 막은 유투브 영상 제거 (1페이지에 계속 검색됐음 ^^;)
					if( all_data[i].url.indexOf("z5qPsA0GhYg") != -1 ) 	{i++; continue;} 
					if( all_data[i].url.indexOf("sabOgAcx180") != -1 ) 	{i++; continue;}
					
					video_url = all_data[i].url.split("?v=");
					
					result += "<div class='video_area'><iframe width='560' height='315' src='https://www.youtube.com/embed/" + video_url[1] + "' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";
					result += "<p class='video_title'>" + all_data[i].title
							+ "</p></div>"
					
					data_count++;					
					if(data_count == count) break;
					
					i++;					
					
				}
				
				$("#min5_body").empty();
				$("#min5_body").html(result);
			}			

			$("#min5_all").click(function() {
				
				default_load(5, "5분 스트레칭");
				
			});

			$("#min5_neck").click(function() {
				
				default_load(5, "목 스트레칭");
				
			});

			$("#min5_shou").click(function() {
				
				default_load(5, "어깨 스트레칭");
				
			});

			$("#min5_waist").click(function() {
				
				default_load(5, "허리 스트레칭");
				
			});

			$("#min5_wrist").click(function() {
				
				default_load(5, "손목 스트레칭");
				
			});

			default_load(5, "5분 스트레칭"); // 초기 페이지 인입시 기본적으로 보여주는 영상

		});
	</script>
</body>
</html>