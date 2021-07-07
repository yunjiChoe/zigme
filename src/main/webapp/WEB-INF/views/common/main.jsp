<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">

<head>
  
  <!-- bootstrap -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
	
  <!-- 강사님이 주신 버전이 더 최신인듯 -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/calendar/tui-time-picker.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/calendar/tui-date-picker.css" />  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/calendar/tui-calendar.css" />  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/calendar/default.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/calendar/icons.css" />
  
  <!-- common.css -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
  
  <c:import url="../inc/header.jsp" />
  
  <style type="text/css">   
  @import url('https://fonts.googleapis.com/css2?family=Gugi&family=Roboto:wght@100&display=swap');  
 
.btn,
.btn:disabled, 
.btn:hover,   
.btn:active,
.btn:focus {
	border: 0px solid #000; 
	background-color: #fff;
}   
   </style>	
    
</head>

<body>
	<div class="container">	
	<c:import url="../inc/navbar.jsp" />
	
    <!-- sidebar 영역 시작 -->
  <div class="sidebar pull-left col-lg-2" >
    	<!-- 시계 -->
    	<div id="main_time"></div>
    	<!-- 날씨정보 -->
    	<div id="main_weather">
    		<img id="wicon" src="" alt="Weather icon" width="100">
    		<span id="main_whaterdossi" class="ctemp" ></span>
    	</div>    	
    	<!-- 알람 -->
    	<div id="main_alram"></div>
  </div>
  
  	<!-- body 영역 시작 -->
    <div class="body pull-left col-lg-10">    
	<!--  calendar 시작 -->
        <div id="menu">
        	<!-- invisible button  -->
             <span class="dropdown">
                <button id="dropdownMenu-calendarType" class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="true">
                    <i id="calendarTypeIcon" class="calendar-icon ic_view_month" style="margin-right: 4px;"></i>
                    <span id="calendarTypeName">Dropdown</span>&nbsp;
                    <i class="calendar-icon tui-full-calendar-dropdown-arrow"></i>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-calendarType">
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-monthly">
                            <i class="calendar-icon ic_view_month"></i>Month
                        </a>
                    </li>
                </ul>
            </span>
            <!-- // invisible button  -->
             
            <span id="menu-navi">
            	<div class="calendar_menu">
                <!-- <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>  -->
                <button type="button" id="calendar-prev" class="btn btn-default btn-sm move-day" data-action="move-prev">
                    <i class="calendar-icon ic-arrow-line-left" data-action="move-prev"></i>
                </button>
                </div>
                <div class="calendar_menu cal_label">
                	<span id="renderRange" class="render-range"></span>
                </div>
                <div class="calendar_menu">	
                <button type="button" id="calendar-next" class="btn btn-default btn-sm move-day" data-action="move-next">
                    <i class="calendar-icon ic-arrow-line-right" data-action="move-next"></i>
                </button>
                </div>
            </span>
            
        </div>
        <div id="calendar"></div>
        <!-- <div id="calendar_data"></div>  -->
    
    <!--  //calendar 종료 -->	    
	</div>
  <!--  </div>  -->
    </div> <!-- // container 종료 -->	
   
    <script src="${pageContext.request.contextPath}/assets/js/calendar/jquery-3.2.1.slim.min.js"></script>  		
  	<script src="${pageContext.request.contextPath}/assets/js/calendar/tui-code-snippet.min.js"></script>
  	<script src="${pageContext.request.contextPath}/assets/js/calendar/tui-time-picker.min.js"></script>
  	<script src="${pageContext.request.contextPath}/assets/js/calendar/tui-date-picker.min.js"></script>
  	<script src="${pageContext.request.contextPath}/assets/js/calendar/moment.min.js"></script>
  	<script src="${pageContext.request.contextPath}/assets/js/calendar/chance.min.js"></script>  	
    <script src="${pageContext.request.contextPath}/assets/js/calendar/tui-calendar.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/calendar/data/calendars.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/calendar/data/schedules.js"></script>     
    <script src="${pageContext.request.contextPath}/assets/js/calendar/app.js"></script>  
    
    
    <c:import url="../inc/footer.jsp" />
    
    <script type="text/javascript">    
		$(function() {	
		// 메인 시계
		function main_Time() {
            var mydate = new Date();            
            var hh = mydate.getHours();
            var mi = mydate.getMinutes();
            var ss = mydate.getSeconds();
            
            // 시간은 뒤에서 작업 convert_12(hh)
            mi = zero_padding(mi);
            ss = zero_padding(ss);
            
            var result = "<p id='ampm'>" + is_ampm(hh) + "</p> <p id='time_digit'>" + convert_12(hh) + ":" + mi + "</p>";            
            document.getElementById("main_time").innerHTML = result;
        }

        function startTimer() {
            setInterval(main_Time, 1000);
        }	    
        
        function zero_padding(time) {        	
        	if (time < 10) time = "0" + time;
        	return time;
        }
        
        function is_ampm(time) {
        	if (time < 12) return "AM";
        	else return "PM";
        }
        
        function convert_12(time) {
        	if(is_ampm(time)=="PM") {        	
				if((time-12)==0) time = 12; // 오후 12시도 12로 표기한다.
				else time = time - 12;		// 13시는 01시로 표기한다.  
        	} else {
        		if(time==0) time = 12;		// 오전 12시도 12로 표기한다. 
        	}        	
        	return zero_padding(time);
        }
        
        function weather_getdossi() {            
            var result = "";            
            document.getElementById("main_whaterdossi").innerHTML = result;
        }
        
        function main_getalram(count) {            
            
        	var result="";
            var test_txt = ["10:30  택배 확인하기","11:20  워크샵 회의", "15:40  3층 세미나실 회의", "16:40  사수님 간식 챙겨드리기"];
        	
        	for(var i=0; i < count; i++) {
        		result += "<a class='alram_area' href='${pageContext.request.contextPath}/util/util_alarm'>" + test_txt[i] +"</a>";        		
        	}
        	
        	document.getElementById("main_alram").innerHTML = result;        	
        	
        }        
        
		$("#dasom_save").click(function(e){				
			console.log("정녕 안되는것인가 ㅠㅠ");
			
		$.ajax({
			// 결과를 읽어올 URL
			url: '../api/get.do',
			// 웹 프로그램에게 데이터를 전송하는 방식.(생략할 경우 get)
			method: 'get',
			// 전달할 조건값은 JSON형식으로 구성
			data: {num1: 123, num2: 456},
			// 읽어올 내용의 형식(생략할 경우 Json)
			dataType: 'html',
			// 읽어온 내용을 처리하기 위한 함수
			success: function(req) {
				// req는 url에 지정된 페이지에 접속했을 경우
				// 브라우저에 표시되는 HTML소스 자체.
				$("#calendar_data").append(req);
			}
		}); // end $.ajax
		}); // end click
		
		main_Time();
		startTimer();
		weather_getdossi();
		main_getalram(4);
	});
	
		$.getJSON('http://api.openweathermap.org/data/2.5/forecast?id=1835848&APPID=c689a368e2df5f6e70c8758bec4b5496&units=metric'
				,function(data){
			var $temp = data.list[0].main.temp;
			var $sky = data.list[0].weather[0].main;			
			var iconcode = data.list[0].weather[0].icon;
			var iconurl = "${pageContext.request.contextPath}/img/common/weather-icons/" + iconcode + ".png";
			
			if($sky == "Clouds","Mist")
				$sky = "흐림";
		   
			else if($sky == "Rain","Squalls","Tornado")
				$sky = "비";
			else if($sky == "Snow")
				$sky = "눈";
			else if($sky == "Haze","Smoke","Sand","Dust","Ash")
				$sky = "대기 오염";
			else
				$sky = "맑음";
			
			Math.ceil
			
			$('#wicon').attr('src', iconurl);
			$('.ctemp').append($temp + "°C");			
			$('.csky').append($sky);			
		});
	</script>

</body>
</html>
