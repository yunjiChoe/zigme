<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>



<!-- footer 영역 시작 -->
     <div class="footer">
       <span id="footer_title">(주)직장인 메이트</span>
       <br>
       <span>서울 서초구 서초대로 77길 55, 에이프로 스퀘어 3층 (서초동) | 사업자번호 : 120-00-67890</span>
       <br>
       <span>대표전화 : 1600-1234 | 팩스 : 050-6000-4646 | 대표메일 : <address><a href="mailto:zigme2021@gmail.com">zigme2021@gmail.com</a></address>
       <!-- <a href="${pageContext.request.contextPath}/admin">관리자</a>  -->
       </span><br>       
       <span><font color="RED">♥</font> EZEN.2021 2조 김태현 안다솜 이솔 최윤지 정희선 김바른이 <font color="RED">♥</font></span><br>
      </div>
	  <!-- // footer 영역 종료 --> 
	  
<script src="${pageContext.request.contextPath}/assets/js/session.js"></script>

<script type="text/javascript">

  $(function() {
    
   // sub navbar slide
    $(".menu-item").hover(function() {
        $(this).find(".sub").slideToggle(300);
    });

   // main navbar menu hover img
   $(".menu-item").mouseover(function() {
      var img_name = $(this).data("imgname");

      $(this).css("background-image", "url(${pageContext.request.contextPath}/img/common/"+ img_name + ")");
      $(this).css("background-size", "100%");
      $(this).children().css("color","#fff");
   });

    $(".menu-item").mouseout(function() {
        $(".menu-item").css("background-image", "none");
        $(this).children().css("color", "#4041fe");
    });
    
    function calculate() {
        // 1분마다 알람 LIST 조회
    	setInterval(function () { 
    		$.ajax({
    			async: false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
    			// 결과를 읽어올 URL
    			url: '${pageContext.request.contextPath}/util/sche_alarm.get',
    			// 웹 프로그램에게 데이터를 전송하는 방식.(생략할 경우 get)
    			method: 'post',
    			// 읽어올 내용의 형식(생략할 경우 Json)
    			dataType: 'json',
    			// 읽어온 내용을 처리하기 위한 함수
    			success: function(req) {

    				var todate = new Date();
    				var Alarm_list = req.item;      
    				
    				for(var i=0; i<Alarm_list.length; i++){     
    					
    					//console.log("Alarm Data " + Alarm_list[i].alarmTime);
        				//console.log("Alarm length " + Alarm_list.length);
        				//console.log("JSON 데이터 시 " + parseInt(Alarm_list[i].alarmTime.substring(0,2)));
        				//console.log("JSON 데이터 분! " + parseInt(Alarm_list[i].alarmTime.substring(3)));
        				//console.log("현재 데이터 시 " + todate.getHours());
        				//console.log("현재 데이터 분 " + todate.getMinutes());
        				
     				// DB값과 현재시각이 동일할 경우 True
     				if((parseInt(todate.getHours()) == parseInt(Alarm_list[i].alarmTime.substring(0,2))) &&    // 시 비교
     				 ((parseInt(todate.getMinutes())) == parseInt(Alarm_list[i].alarmTime.substring(3)))) 	// 분 비교
     				{
     					//console.log("동일함!!");
     					body_text = "["+ Alarm_list[i].alarmTime +"] " + Alarm_list[i].alarmContent;
     					notify(body_text);
     				}
    				}
    				
    			}
    		}); // end $.ajax 
    	}, 60000);
    }
    
    function notify(body_text) {
        if (Notification.permission != 'granted') {
            alert('[ZIGME]알림 접근권한을 허용해주세요.');
        }
        else {
            var notification = new Notification('ZIGME Alarm!', {
                icon: 'http://pds18.egloos.com/pds/202106/01/23/d0116923_60b6410e48cab.png',
                body: body_text,
            });

            notification.onclick = function () {                 	  
                window.open('${pageContext.request.contextPath}/util/util_alarm.do?type=${zigme_user.userNo}');
            };
        }
    }
    
    calculate();

  });       
  
  window.onload = function () {    		
  	var userno = $("#userNo").val();
  	if (userno == 0) {	// 입력되지 않았다면?
  		alert("로그인을 해주세요.");	// <-- 메시지 표시
  		window.location.href='${pageContext.request.contextPath}';
  	}
  	
  	// 윈도우 알람 혀용 	
   	if (window.Notification) {
         Notification.requestPermission();
      }
  	
  };
  
  

  </script>	  