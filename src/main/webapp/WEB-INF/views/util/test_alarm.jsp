<!--
     Date : 2021/08/05
     Writer : 안다솜
     Content : 작업 시작
     version : V1.0.1
     
     note : 매 시마다 DB의 값을 읽어서 현재 시에 스케쥴이 있는 경우 1분 단위로 interval로 시간 감지
            단, 스케쥴을 등록한 시간이 현재시라면 바로 interval을 생성한다.  
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
 
<html>
<head>

    <title></title>
</head>
<body>
    <button onclick="calculate()">calculate</button>
 	
    <script type="text/javascript">
        window.onload = function () {
            if (window.Notification) {
                Notification.requestPermission();
            }
        }
 
        function calculate() {
            setTimeout(function () {
                notify();
            }, 5000);
        }
 
        function notify() {
            if (Notification.permission !== 'granted') {
                alert('notification is disabled');
            }
            else {
                var notification = new Notification('ZIGME Alarm!', {
                    icon: 'http://pds18.egloos.com/pds/202106/01/23/d0116923_60b6410e48cab.png',
                    body: '[10:30] 사수님 간식시간',
                });
 
                notification.onclick = function () {
                    window.open('http://localhost:8080/util/util_alarm');
                };
            }
        }
    </script>
</body>
</html>