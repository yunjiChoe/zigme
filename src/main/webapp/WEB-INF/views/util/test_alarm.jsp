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

</style>

<script type="text/javascript">

</script>
</head>
<body>
	<div class="container">
		
		<button>알림 실행!</button>

	</div>
	<!-- //container 종료 -->

	<c:import url="../inc/footer.jsp" />
	<script type="text/javascript">
		$(function() {
			
			window.addEventListener('load', function () {
				  // 처음에는 알림 권한이 있는지 확인함
				  // 없으면 권한 요구
				  if (Notification && Notification.permission !== "granted") {
				    Notification.requestPermission(function (status) {
				      if (Notification.permission !== status) {
				        Notification.permission = status;
				      }
				    });
				  }

				  var button = document.getElementsByTagName('button')[0];

				  button.addEventListener('click', function () {
					  
					 console.log("웨않되");
					 
				    // 사용자가 알림을 받는 데 동의한 경우
				    // 알림 10개를 보내본다
				    if (Notification && Notification.permission === "granted") {
				      var i = 0;
				      // 어떤 브라우저(파이어폭스 등)는 일정 시간 동안 알림이 너무 많은 경우 차단하기 때문에 인터벌 사용.
				      var interval = window.setInterval(function () {
				        // 태그 덕분에 "안녕! 9" 알림만 보여야 함
				        var n = new Notification("안녕! " + i, {tag: '알림너무많음'});
				        if (i++ == 9) {
				          window.clearInterval(interval);
				        }
				      }, 200);
				    }

				    // 사용자가 알림을 받을지 말지 답하지 않은 경우
				    // 참고: 크롬 때문에 권한 속성이 설정됐는지 알 수 없으므로
				    // "기본" 값을 확인하는 것은 안전하지 않음
				    else if (Notification && Notification.permission !== "denied") {
				      Notification.requestPermission(function (status) {
				        // 사용자가 ok한 경우
				        if (status === "granted") {
				          var i = 0;
				          // 어떤 브라우저(파이어폭스 등)는 일정 시간 동안 알림이 너무 많은 경우 차단하기 때문에 인터벌 사용.
				          var interval = window.setInterval(function () {
				            // 태그 덕분에 "안녕! 9" 알림만 보여야 함
				            var n = new Notification("안녕! " + i, {tag: '알림너무많음'});
				            if (i++ == 9) {
				              window.clearInterval(interval);
				            }
				          }, 200);
				        }

				        // 그 외의 경우 일반적인 모달 alert로 폴백
				        else {
				          alert("안녕!");
				        }
				      });
				    }

				    // 사용자가 알림을 거부한 경우
				    else {
				      // 일반적인 모달 alert로 폴백
				      alert("안녕!");
				    }
				  });
				});
			
		});
		
	</script>
</body>
</html>