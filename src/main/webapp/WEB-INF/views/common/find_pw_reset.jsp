<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>직메 Zigme</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

	<!-- common.css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />

<style type="text/css">

div.container {
        width: auto;
        max-width: 450px;
        padding-top: 20px;
    }

.sub_desc p {
	margin-top: 20px;
	margin-bottom: 20px;
}

body {
        margin-top: 100px;
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
</head>

<body>
	<!-- .modal -->
	<div id="find-id-modal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<!-- .modal-dialog -->
		<div class="modal-dialog">
			<!-- .modal-content -->
			<div class="modal-content">
				<!-- 제목 -->
				<div class="modal-header">
					<!-- 닫기버튼 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<br>
					<h4 class="modal-title  text-primary text-center" id="myModalLabel">비밀번호
						재설정 완료</h4>
				</div>
				<!-- 내용 -->
				<div class="modal-body text-center">
					<p>메이트님의 비밀번호</p>
					<p>재설정이 완료되었습니다.</p>
				</div>
				<!-- 하단 -->
				<div class=" text-center">
					<a href="${pageContext.request.contextPath}/">
						<button type="button" class="btn  btn-primary btn-lg">확인
						</button>
					</a>
				</div>
				<br />
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<div class="container">
		<div class="content ">
			<div class="find-id-header">
				<a href="${pageContext.request.contextPath}"> <img src="${pageContext.request.contextPath}/img/common/logo.png"></a>
				<div class="id-blue">
					<div class="square"></div>
					비밀번호 재설정
					<div class="sub_desc">
						<p >비밀번호 재설정을 위하여 새로운 비밀번호를 입력해주세요.</p>
					</div>
				</div>
			</div>
			<br />
			<hr style="border: solid 1px #aaa;" width="100%">
			<form role="form"  >
				<fieldset>
					<div class="form-group">
						<div class="circle"></div>
						<span>새 비밀번호</span> <input type="password" id="user_pw" name="password"
							class="form-control" placeholder="영문,숫자 조합하여 최소4자,최대20자" />
							<input type="hidden" id="userno" name="userno" value="${output.getUserNo()}">
							
					</div>
					<div class="form-group">
						<div class="circle"></div>
						<span>새 비밀번호 확인</span> <input type="password" id="user_repw" 
							class="form-control" placeholder="비밀번호를 한 번 더 입력해주세요." />
							<font
							id="chkNotice" size="2"></font> <br />
					</div>
					<br />
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" href="#find-id-modal"  id="question">비밀번호 재설정</button>
				</fieldset>
			</form>
		</div>
	</div>
	<div class="clearfix"></div>
	<script type="text/javascript">
	$(function() {
		$('#user_pw').keyup(function() {
			
			$('#chkNotice').html('');
		});

		$('#user_repw').keyup(function() {

			if ($('#user_pw').val() != $('#user_repw').val()) {
				$('#chkNotice').html('비밀번호가 일치하지 않습니다<br>');
				$('#chkNotice').attr('color', '#f82a2aa3');
			} else {
				$('#chkNotice').html('비밀번호가 일치 합니다.<br>');
				$('#chkNotice').attr('color', '#199894b3');
			}

		});
	});
	
	 $(function() {
		    //idck 버튼을 클릭했을 때 
		    $("#question").click(function() {
		        
		    	
			        var password = $('#user_pw').val(); //id값이 "id"인 입력란의 값을 저장
			        var userno =$('#userno').val();
			        
			        $.ajax({
			            url:'${pageContext.request.contextPath}/common', //Controller에서 인식할 주소
			            type:'PUT', //PUT 방식으로 전달
			            data:{ "password": password ,"userno" :userno} ,
			            
			           success: function(json) {
			        	   console.log(json);
							// 사용 가능한 아이디인 경우 --> req = { result: "OK" }
							// 사용 불가능한 아이디인 경우 --> req = { result: "FAIL" }
							if (json.rt =="OK" ) {
							
								console.log(json.item.userno);
							}
			            }
			        });
		    });
		});
	</script>
</body>

</html>