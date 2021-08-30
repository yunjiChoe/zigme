<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  
  <!-- bootstrap -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
  
  <!-- style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin.css" />
  
  <!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
  <c:import url="../inc/header.jsp" />

</head>

<body>

	<div class="container">
	<!--  include :: container 바로 아래에 있어야합니다 -->	
	<c:import url="../inc/admin.jsp" />
	
    <h2 id="admin_title">어서오세요 관리자 페이지입니다!</h2>
    <h2 id="timer"></h2>
    <h2 class="admin_count">오늘의 방문자 수: <span id=count></span> 명</h2>
    <h2 class="admin_count">오늘의 가입회원 수: <span id=countJoin></span> 명</h2>
    <h2 class="admin_count">오늘의 탈퇴회원 수: <span id=countWithdraw></span> 명</h2>
    
    </div> <!-- //container 종료 -->
        
    
    <!-- javascript end -->
        <!-- include :: Javascript 파일 포함 
      <script src="../assets/js/jquery.min.js"></script>
      <script src="../assets/js/bootstrap.min.js"></script>
      
      </body> 바로 위에 위치해야합니다. 
    -->
    <c:import url="../inc/footer.jsp" />
    
    <script src="${pageContext.request.contextPath}/plugin/ajax/ajax_helper.js"></script>
    
    <script type="text/javascript">
    $(function() {
    	
    	var adminStatisDate;
    	
        function printTime() {
            // 현재 시각을 구한다.
            var mydate = new Date();
            var yy = mydate.getFullYear();
            var mm = mydate.getMonth() + 1;
            var dd = mydate.getDate();
            var hh = mydate.getHours();
            var mi = mydate.getMinutes();
            var ss = mydate.getSeconds();
            
         	// 시간은 뒤에서 작업 convert_12(hh)
            mi = zero_padding(mi);
            ss = zero_padding(ss); // 완성된 현재 시각
            mmm = zero_padding(mm);
            ddd = zero_padding(dd);
            
            var result = yy + "년 " + mm + "월 " + dd + "일 "  + is_ampm(hh) + " " + convert_12(hh) + ":" + mi +":" +ss;
            adminStatisDate = yy + mmm + ddd;
                        
            // 한자리 숫자일때 숫자앞에 0더해서 출력한다.
            function zero_padding(time) {           
                if (time < 10) time = "0" + time;
                return time;
             }
            
            // AM, PM을 표기한다.
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
            
            
            // 구한 현재시각을 출력한다.
            $("#timer").html(result);
            
            
        }

        printTime();     // 초기에 한번 실행시켜서 timer 실행전에도 화면에 보이도록함.  
        setInterval(printTime, 1000); // printTime 함수를 1초에 한번씩 반복해서 자동 호출한다.
        
        $.ajax({
         	async: false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
 			// 결과를 읽어올 URL
 			url: '${pageContext.request.contextPath}/admin/admin_main.do',
 			// 웹 프로그램에게 데이터를 전송하는 방식.(생략할 경우 get)
 			method: 'get',
 			// 전달할 조건값은 JSON형식으로 구성
 			data: {
 				   "adminStatisDate": adminStatisDate 				   
 			},
 			// 읽어올 내용의 형식(생략할 경우 Json)
 			dataType: 'json',
 			// 읽어온 내용을 처리하기 위한 함수
 			success: function(req) {
 				
 				console.log("req");
 				
 				$("#count").html(req.item.adminVisit);
 				$("#countJoin").html(req.item.adminJoin);
 				$("#countWithdraw").html(req.item.adminSecession);
 								
 			}
 		}); // end $.ajax
        
    });
    </script>
</body>

</html>