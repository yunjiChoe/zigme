<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

 
	.correct{
    color : #4041fe;
	}
	.incorrect{
    color : red;
	}
    </style>
    
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
                <div class="modal-body text-center" id="input_email">
                    <h4 class="text-primary " ></h4>
                    <p>
                        인증번호가 발송되었습니다.
                    </p>
                </div>
                <!-- 하단 -->
                <div class=" text-center">
                    <button type="button" class="btn btn-primary btn-lg ghkrdls" data-dismiss="modal" >
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
                    <h4 class="modal-title  text-primary text-center" id="myModalLabel">인증 확인</h4>
                </div>
                <!-- 내용 -->
                <div class="modal-body text-center">
                    <h4 class="text-primary  "id="mail_check_input_box_warn"></h4>
                    <p>
                        
                    </p>
                </div>
                <!-- 하단 -->
                <div class=" text-center">
                
                  <a href="${pageContext.request.contextPath}/find_pw_reset" id="pw_reset_ok"><button type="button" class="btn  btn-primary btn-lg "id="pw_rest">
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
            <form role="form" method="post" action="${pageContext.request.contextPath}/common/find_pw_ok.do"  id="myform">
                <fieldset>
                    <div class="form-group">
                        <input type="text" id="user_name" class="form-control" placeholder="이름" name="name" />
                        <span class="text-info"> 이름을 입력해 주세요.</span>
                    </div>
                    <div class="form-group">
                        <input type="text" id="user_id" class="form-control" placeholder="ID"  name="id"/>
                        <span class="text-info"> 아이디를 입력해주세요.</span>
                    </div>
                    <div class="form-group">
                        <input type="email" id="user_eamil" class="form-control mail_input" placeholder="email@example.com"  name="email"/>
                        <span class="text-info"> 이메일 주소를 입력해주세요.</span>
                    </div>
                    <br /> 
                    <input type="hidden" name="subject" placeholder="ID" class="ckeditor"/>
                    
                    <button type="submit" id="question" class=" btn btn-primary btn-lg mail_check_button" data-toggle="modal" href="#find-id-modal" onclick="printResult()">
                        인증번호 받기
                    </button>
                    <br />
                    <br />
                    <br />
                    <div class="show2">
                        <p>
                            <input type="text" class="form-control mail_check_input" id="certification"  placeholder="인증번호 입력">
                            <div class="" ></div>
                           
                            <button type="button" class=" btn btn-primary btn-lg " id="pw_ch" data-toggle="modal" href="#find-id-modal2" disabled="disabled"> 인증번호 확인</button>
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
        <script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
        <script type="text/javascript">
        
        function printResult() {
        	
            var result = "인증번호 재전송";
            var mytag = document.getElementById("question");
            mytag.innerHTML = result;

        }
        $(document).ready(function() {

            $('.show2').hide();
            $('.modal-dialog').hover(function() {

                $('.show2').show();
                return false;
            });
        });

       
        // 카운트 다운
        var num = 60 * 5; // 몇분을 설정할지의 대한 변수 선언
        var myVar;

        var code = "";
        /* 인증번호 이메일 전송 */
        
        $(".mail_check_button").click(function(){
            
            var email = $(".mail_input").val();        // 입력한 이메일
            var cehckBox = $(".mail_check_input");        // 인증번호 입력란
            var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
            
            $.ajax({
                
                type:"GET",
                url:"mailCheck?email=" + email,
                success:function(data){
                	//console.log("data : " + data);
                	
                	code = data;
                }     
            });
            
        });
        /* 인증번호 비교 */
        $(".mail_check_input").blur(function(){
        	
        	
            var inputCode = $(".mail_check_input").val();        // 입력코드    
            var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
            $('#pw_reset_ok').hide();
            $('#pw_reset_x').hide();
           
            
            if(inputCode == code){                            // 일치할 경우
                checkResult.html("인증번호가 일치합니다.");
                checkResult.attr("class", "correct"); 
                $("#pw_reset_ok").show();
                
            } else {                                            // 일치하지 않을 경우
                checkResult.html("인증번호를 다시 확인해주세요.");
                checkResult.attr("class", "incorrect");
                $("#pw_reset_x").show();
                
            }    
            
        });
        
        $(".mail_check_input").click(function(){
  	      $('#pw_ch').removeAttr("disabled");
  	 })
      
        
        $(function() {
            /** 폼에서의 데이터 전송 이벤트 */
    $("#myform").submit(function(e) {  
       e.preventDefault(); // 데이터 전송 강제 중단

                var username = $("#user_name").val(); // 입력값 가져오기
                if (!username) { // 입력값이 없다면?
                    alert("이름을 입력하세요."); // 메시지 표시
                    $("user_name").focus(); // 포커스 강제 지정
                    return false; // 함수 처리 중단
                }

                var userid = $("#user_id").val(); // 입력값 가져오기
                if (!userid) { // 입력값이 없다면?
                    alert("아이디를 입력하세요."); // 메시지 표시
                    $("#user_id").focus(); // 포커스 강제 지정
                    return false; // 함수 처리 중단
                }
                
                var useremail = $("#user_eamil").val(); // 입력값 가져오기
                if (!useremail) { // 입력값이 없다면?
                    alert("이메일를 입력하세요."); // 메시지 표시
                    $("#user_eamil").focus(); // 포커스 강제 지정
                    return false; // 함수 처리 중단
                }
                
             // 입력값을 화면에 표시하기
                $("#input_email").text( useremail );
             
             
               $(".ghkrdls").click(function(){
                function time() {
                    myVar = setInterval(alertFunc, 1000);
                 }
                 time();

                
                function alertFunc() {
                    var min = num / 60;
                    min = Math.floor(min);

                    var sec = num - (60 * min);
                    //console.log(min)
                    //console.log(sec)

                    var $input = $('.timer').val(min + ':' + sec);

                    if (num == 0) {
                    	
                        clearInterval(myVar) // num 이 0초가 되었을대 clearInterval로 타이머 종료
                        $('#certification').attr("disabled","disabled");
                        
                    }
                    num--;
                    
                    
                }
               });

                // 백엔드 페이지에게 데이터를 전송해야 할 경우 사용해야 한다.
                // $(this).submit();
            });
        });
        
        
        $(function() {
		    //idck 버튼을 클릭했을 때 
		    $("#question").click(function() {
		        
		    	
			        var id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
			        var name =$('#user_name').val();
			        var email =$('.mail_input').val();
			        $.ajax({
			            url:'${pageContext.request.contextPath}/common/find_pw_ok.do', //Controller에서 인식할 주소
			            type:'POST', //POST 방식으로 전달
			            data:{id : id ,name :name, email : email} ,
			            
			           success: function(req) {
			        	 // console.log(req);
							// 사용 가능한 아이디인 경우 --> req = { result: "OK" }
							// 사용 불가능한 아이디인 경우 --> req = { result: "FAIL" }
							if (req.result != "0") {
							
								//console.log(req.result);
							}
			            }
			        });
		    });
		});
        </script>
    </div>
</body>

</html>