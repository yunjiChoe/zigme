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
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>직메 Zigme</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    
    <!-- common.css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
    <style type="text/css">
  
  	body {
        margin-top: 100px;
    }
    
    div.container {
        width: auto;
        max-width: 450px;
        padding-top: 20px;
    }
    
    .pw-word {
        margin-top: 20px;
        margin-bottom: 40px;
    }
    
    .item {
        border: 1px dotted #ff6600;
        margin: 10px auto;
        padding: 5px 10px;
    }

    .btn-ttc3 {
        padding: 5px 20px;
    }

   
    .timer{
    width:50px;
    }
    
    .btn-primary {
	background-color: #4041fe;
	}

	.btn-primary:hover,
	.btn-primary:focus {
	border-color: #4041fe;
	background-color: #4041fe;
	color: #FFF;
	}

	.form-group {
	padding: 0;
	margin: 15px 0;
	}

	.text-info, .text-primary {
	margin-top: 10px;
	}
   
    </style>
    <script type="text/javascript">
    
    function printResult() {
    	
        var result = "인증번호 재전송";
        var mytag = document.getElementById("question");
        mytag.innerHTML = result;

    }
    
    </script>
</head>

<body>
    <!-- .modal -->
    <div id="find-id-modal" class="modal fade " tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <!-- .modal-dialog -->
        <div class="modal-dialog ">
            <!-- .modal-content -->
            <div class="modal-content" >
                <!-- 제목 -->
                <div class="modal-header">
                    <!-- 닫기버튼 -->
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <br>
                    <h4 class="modal-title  text-primary text-center" id="myModalLabel">인증번호 발송</h4>
                </div>
                <!-- 내용 -->
                <div class="modal-body text-center">
                    <h4 class="text-primary ">javajung@zigme.com</h4>
                    <p>
                        인증번호가 발송되었습니다.
                    </p>
                </div>
                <!-- 하단 -->
                <div class=" text-center">
                    <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">
                        확인
                    </button>
                </div>
                <br />
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!-- .modal2 -->
    <div id="find-id-modal2" class="modal fade " tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <!-- .modal-dialog -->
        <div class="modal-dialog">
            <!-- .modal-content -->
            <div class="modal-content">
                <!-- 제목 -->
                <div class="modal-header">
                    <!-- 닫기버튼 -->
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <br>
                    <h4 class="modal-title  text-primary text-center" id="myModalLabel">인증 완료</h4>
                </div>
                <!-- 내용 -->
                <div class="modal-body text-center">
                    <h4 class="text-primary "></h4>
                    <p>
                        비밀번호 찾기를 위한 인증이 완료되었습니다.
                    </p>
                </div>
                <!-- 하단 -->
                <div class=" text-center">
                    <a href="${pageContext.request.contextPath}/find_pw_reset"><button type="button" class="btn  btn-primary btn-lg  ">
                            확인
                        </button></a>
                </div><br />
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class=" container box">
        <div class="content ">
            <div class="find-id-header">
                <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/common/logo.png"></a>
                <div class="id-blue">
                    <div class="square"></div> 비밀번호 찾기
                    <div class="">
                        <p>비밀번호 재설정을 위하여 메이트님의 이름, 아이디, 이메일 주소를 입력해 주세요.</p>
                        <br />
                        <p>이메일 주소로 전송되는 인증번호를 아래의 인증번호 입력창에 입력해주세요.</p>
                    </div>
                </div>
            </div>
            <br />
            <hr class="hr_solid" style="border: solid 1px #aaa;" width="100%">
            <form role="form">
                <fieldset>
                    <div class="form-group">
                        <input type="text" id="user_name" class="form-control" placeholder="이름" />
                        <span class="text-info">이름을 입력해 주세요.</span>
                    </div>
                    <div class="form-group">
                        <input type="text" id="user_id" class="form-control" placeholder="ID" />
                        <span class="text-info">아이디를 입력해주세요.</span>
                    </div>
                    <div class="form-group">
                        <input type="email" id="user_eamil" class="form-control" placeholder="email@example.com" />
                        <span class="text-info">이메일 주소를 입력해주세요.</span>
                    </div>
                    <br /> <button type="button" id="question" class=" btn btn-primary btn-lg " data-toggle="modal" href="#find-id-modal" onclick="printResult()">
                        인증번호 받기
                    </button>
                    <br />
                    <br />
                    <br />
                    <div class="show2">
                        <p>
                            <input type="text" class="form-control" placeholder="인증번호 입력">
                            <br />
                            <button type="button" class=" btn btn-primary btn-lg " data-toggle="modal" href="#find-id-modal2"> 인증 받기</button>
                            <span class=".btn_recive_num"> 인증 제한 시간 </span>
                            <input type="text" class="timer" style="color:blue">
                        </p>
                        <br />
                        <br />
                        <br />
                    </div>
                </fieldset>
            </form>
        </div>
        <script src=" ${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"> </script>
        <script type="text/javascript">
        $(document).ready(function() {

            $('.show2').hide();
            $('.modal-dialog').hover(function() {

                $('.show2').show();
                return false;
            });
        });

        // 카운트 다운
        var num = 60 * 3; // 몇분을 설정할지의 대한 변수 선언
        var myVar;

        function time() {
            myVar = setInterval(alertFunc, 1000);
        }
        time();

        function alertFunc() {
            var min = num / 60;
            min = Math.floor(min);

            var sec = num - (60 * min);
            console.log(min)
            console.log(sec)

            var $input = $('.timer').val(min + ':' + sec);

            if (num == 0) {
                clearInterval(myVar) // num 이 0초가 되었을대 clearInterval로 타이머 종료
            }
            num--;
        }
        </script>
    </div>
</body>

</html>