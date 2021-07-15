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

strong {
	font-size: 12px;
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
        
        $(document).on('click', '#dasom_save', function(e){        	
         	console.log("type : " + $('#tui-full-calendar-schedule-calendar').html());
        	console.log("title : " + $('#tui-full-calendar-schedule-title').val());
        	console.log("location : " + $('#tui-full-calendar-schedule-location').val());
        	console.log("s-date : " + $('#tui-full-calendar-schedule-start-date').val());
        	console.log("e-date : " + $('#tui-full-calendar-schedule-end-date').val());
        	console.log("checkbox : " + $('#tui-full-calendar-schedule-allday').prop('checked'));
        	
        	var type = $('#tui-full-calendar-schedule-calendar').html();        	        	
        	var scheCate = "";        	
        	
        	switch (type) {
        	case "일정":
        		scheCate = "0";
        		break;
        	case "회사":
        		scheCate = "1";
        		break;
        	case "가족":
        		scheCate = "2";
        		break;
        	case "친구":
        		scheCate = "3";
        		break;
        	case "그 외":
        		scheCate = "4";
        		break;
        	}
        	
        	
        	var scheContent = $('#tui-full-calendar-schedule-title').val();
        	var scheLoc = $('#tui-full-calendar-schedule-location').val();
        	var scheStartdate = $('#tui-full-calendar-schedule-start-date').val();
        	var scheEnddate = $('#tui-full-calendar-schedule-end-date').val(); 
        	
        	// 일정을 종일로 체크한 경우 
        	var allTime_checked = $('#tui-full-calendar-schedule-allday').prop('checked');
        	if (allTime_checked) {
        		scheStartdate = scheStartdate.substring(0, 11) + "00:00:00";
        		scheEnddate = scheEnddate.substring(0, 11) + "23:59:59";
        	}         	
        	
        	var userNo = 1; // test_user
        	
        	$.ajax({
    			// 결과를 읽어올 URL
    			url: '${pageContext.request.contextPath}/main',
    			// 웹 프로그램에게 데이터를 전송하는 방식.(생략할 경우 get)
    			method: 'post',
    			// 전달할 조건값은 JSON형식으로 구성
    			data: {
    				   "scheCate": scheCate,
    				   "scheContent": scheContent, 
    				   "scheLoc": scheLoc,
    				   "scheStartdate" : scheStartdate,
    				   "scheEnddate" : scheEnddate,
    				   "userNo" : userNo
    			},
    			// 읽어올 내용의 형식(생략할 경우 Json)
    			dataType: 'json',
    			// 읽어온 내용을 처리하기 위한 함수
    			success: function(req) {
    				
    				// console.log("통신완료" + req);
    				
    			}
    		}); // end $.ajax
    		
		});
        
        
		main_Time();
		startTimer();
		weather_getdossi();
		main_getalram(4);
	});
	
		$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat=37.56826&lon=126.977829&APPID=c689a368e2df5f6e70c8758bec4b5496&units=metric'
				,function(data){
			var temp = data.list[0].main.temp;
			var sky = data.list[0].weather[0].main;			
			var iconcode = data.list[0].weather[0].icon;
			
				//API에서 저녁에오는 XXn 의 값도 낮의 이미지로 출력해주기 위해 n(ight) -> d(ay)로 변경함 
				//console.log("iconcode" + iconcode);
				if (iconcode.substring(2,3) == 'n')
				{					
					iconcode = iconcode.substring(0,2)	+ 'd';	
				}
				
				switch (iconcode) {
				case '50d':
					iconname = "007-windy";
					break;
				case '13d':
					iconname = "008-snowy";
					break;
				case '11d':
				case '10d':
				case '09d':
					iconname = "009-rainy";
					break;
				case '04d':
				case '03d':					
				case '02d':
					iconname = "005-cloudy";
					break;
				case '01d':
					iconname = "002-sunny";
					break;
				}
			
			var iconurl = "${pageContext.request.contextPath}/img/common/weather-icons/" + iconname + ".png";
			
			if(sky == "Clouds")
				sky = "흐림";		   
			else if(sky == "Rain")
				sky = "비";
			else if(sky == "Snow")
				sky = "눈";
			else if(sky == "Haze")
				sky = "대기 오염";
			else
				sky = "맑음";
			
			$('#wicon').attr('src', iconurl);
			$('.ctemp').append(temp.toFixed(1) + "°C");			
			$('.csky').append(sky);			
		});
	</script>
	
	<script type="text/javascript" class="code-js">
  function getTimeTemplate(schedule, isAllDay) {
    var html = [];

    if (!isAllDay) {
      html.push('<strong>' + moment(schedule.start.getTime()).format('HH:mm') + '</strong> ');
    }
    if (schedule.isPrivate) {
      html.push('<span class="calendar-font-icon ic-lock-b"></span>');
      html.push(' Private');
    } else {
      if (schedule.isReadOnly) {
        html.push('<span class="calendar-font-icon ic-readonly-b"></span>');
      } else if (schedule.recurrenceRule) {
        html.push('<span class="calendar-font-icon ic-repeat-b"></span>');
      } else if (schedule.attendees.length) {
        html.push('<span class="calendar-font-icon ic-user-b"></span>');
      } else if (schedule.location) {
        html.push('<span class="calendar-font-icon ic-location-b"></span>');
      }
      html.push(' ' + schedule.title);
    }

    return html.join('');
  }

  function getGridTitleTemplate(type) {
    var title = '';

    switch(type) {
      case 'milestone':
        title = '<span class="tui-full-calendar-left-content">MILESTONE</span>';
        break;
      case 'task':
        title = '<span class="tui-full-calendar-left-content">TASK</span>';
        break;
      case 'allday':
        title = '<span class="tui-full-calendar-left-content">ALL DAY</span>';
        break;
    }

    return title;
  }

  function getGridCategoryTemplate(category, schedule) {
    var tpl;

    switch(category) {
      case 'milestone':
        tpl = '<span class="calendar-font-icon ic-milestone-b"></span> <span style="background-color: ' + schedule.bgColor + '">' + schedule.title + '</span>';
        break;
      case 'task':
        tpl = '#' + schedule.title;
        break;
      case 'allday':
        tpl = getTimeTemplate(schedule, true);
        break;
    }

    return tpl;
  }

  // register templates
  var templates = {
    milestone: function(schedule) {
      return getGridCategoryTemplate('milestone', schedule);
    },
    milestoneTitle: function() {
      return getGridTitleTemplate('milestone');
    },
    task: function(schedule) {
      return getGridCategoryTemplate('task', schedule);
    },
    taskTitle: function() {
      return getGridTitleTemplate('task');
    },
    allday: function(schedule) {
      return getTimeTemplate(schedule, true);
    },
    alldayTitle: function() {
      return getGridTitleTemplate('allday');
    },
    time: function(schedule) {
      return getTimeTemplate(schedule, false);
    },
    goingDuration: function(schedule) {
      return '<span class="calendar-icon ic-travel-time"></span>' + schedule.goingDuration + 'min.';
    },
    comingDuration: function(schedule) {
      return '<span class="calendar-icon ic-travel-time"></span>' + schedule.comingDuration + 'min.';
    },
    monthMoreTitleDate: function(date, dayname) {
      var day = date.split('.')[2];
      return '<span class="tui-full-calendar-month-more-title-day">' + day + '</span> <span class="tui-full-calendar-month-more-title-day-label">' + dayname + '</span>';
    },
    monthMoreClose: function() {
      return '<span class="tui-full-calendar-icon tui-full-calendar-ic-close"></span>';
    },
    monthGridHeader: function(dayModel) {
      var date = parseInt(dayModel.date.split('-')[2], 10);
      var classNames = ['tui-full-calendar-weekday-grid-date '];

      if (dayModel.isToday) {
        classNames.push('tui-full-calendar-weekday-grid-date-decorator');
      }

      return '<span class="' + classNames.join(' ') + '">' + date + '</span>';
    },
    monthGridHeaderExceed: function(hiddenSchedules) {
      return '<span class="weekday-grid-more-schedules">+' + hiddenSchedules + '</span>';
    },
    monthGridFooter: function() {
      return '';
    },
    monthGridFooterExceed: function(hiddenSchedules) {
      return '';
    },
    monthDayname: function(model) {
      return String(model.label).toLocaleUpperCase();
    },
    dayGridTitle: function(viewName) {
      /*
       * use another functions instead of 'dayGridTitle'
       * milestoneTitle: function() {...}
       * taskTitle: function() {...}
       * alldayTitle: function() {...}
      */

      return getGridTitleTemplate(viewName);
    },
    schedule: function(schedule) {
      /*
       * use another functions instead of 'schedule'
       * milestone: function() {...}
       * task: function() {...}
       * allday: function() {...}
      */

      return getGridCategoryTemplate(schedule.category, schedule);
    }
  };


  </script>  
  <script src="${pageContext.request.contextPath}/assets/js/calendar/default.js"></script>

</body>
</html>
