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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

#user_id,
#user_subname {
	width: 69%;
	display: inline-block;
}

div.mycontainer {
	width: auto;
	max-width: 430px;
	padding-top: 20px;
}

#user_id, #user_subname {
	width: 69%;
	display: inline-block;
}

.btn-primary {
	background-color: #4041fe;
}

.btn-danger {
	background-color: #ff0000;
	color: #FFF;
}

.btn-danger:hover,
.btn-danger:focus {
	background-color: #ff0000;
	color: #FFF;
}

.btn-primary:hover,
.btn-primary:focus {
	border-color: #4041fe;
	background-color: #4041fe;
	color: #FFF;
}

.form-group {
	margin: 0;
	padding: 0;
}


.btn-ttc3 {
	width: 29%;
}

#user_adress {
	width: 49%;
	display: inline-block;
}

.btn-ttc {
	width: 49%;
}

.check-form {
	margin-top: 20px;
}

.check-form label::before {
	content: '';
	display: inline-block;
	width: 20px;
	height: 20px;
	background: url(${pageContext.request.contextPath}/img/common/checkbox_circle-01.png) no-repeat 0 0;
	background-size: 20px;
	vertical-align: top;
}

.check-form {
	margin-top: 20px;
}

.check-form input:checked+label::before {
	background: url(${pageContext.request.contextPath}/img/common/checkbox_circle_selected-01.png) no-repeat
		0 0;
	background-size: 20px;
}

.check-form input {
	position: absolute;
	overflow: hidden;
	width: 1px;
	height: 1px;
	margin: -1px;
	opacity: 0;
}

.check-form label {
	padding-top: 10px;
	padding-right: 100px;
}

label::before {
	margin-right: 10px;
}

#checkbox1, #checkbox2 {
	margin-left: 10px;
	margin-top: 0;
	vertical-align: middle;
}

.col-md-4 {
	padding-left: 0;
}

input#all_check {
	margin-left: 5px;
	vertical-align: middle;
	margin-top: 0;
}

.col-sm-5 {
	max-width: 400px;
	min-width: 400px;
	max-height: 50px;
	min-height: 50px;
}

.icon h2 {
	display: inline-block;
	margin-bottom: 0;
	margin-top: 0;
	vertical-align: middle;
}

div.icon {
	margin-bottom: 20px;
}

ul.img-list {
	list-style: none;
	margin-bottom: 0;
	cursor: pointer;
}

ul.img-list p {
	list-style: none;
	margin: -1px 0 0 0;
}

.btn-ttc5{
	margin-bottom: 3px;
}


li.col-md-3 {
	padding: 0;
	margin: auto;
}

img.col-md-3 {
	width: 80px;
}

.btn-danger {
	background-color: #ff0000;
	color: #FFF;
}
.btn-danger:hover , .btn-danger:focus{
	background-color: #ff0000;
	color: #FFF;
}
.nickname {
	color: #4a6;
	font-size: 13px;
}
.off {
	width: 80px;
	height: 54px;		
	border: 2px solid #ffffff;
	border-bottom: none;
	padding-top: 2px;
}
.on {
	width: 80px;
	height: 54px;		
	border: 2px dotted #00aaff;
	border-bottom: none;
	border-radius: 15px 15px 0 0;
	padding-top: 2px;
}
.no {
	width: 80px;
	height: 20px;	
	border: 2px solid #ffffff;
	border-top: none;
}
.yes {
	width: 80px;
	height: 20px;	
	border: 2px dotted #00aaff;
	border-radius: 0 0 15px 15px;
	border-top: none;
}
</style>
</head>

<body>
	<div class="container mycontainer">
		<div class="content ">
			<div class="find-id-header">
				<a href="${pageContext.request.contextPath}/main"> <img src="${pageContext.request.contextPath}/img/common/logo.png"></a>
				<div class="id-blue">
					<div class="square"></div>
					내 정보 수정
				</div>
			</div>
			<br /> <br /> <br />
			<div class="icon">
				<img src="${pageContext.request.contextPath}/img/common/reward_icon_posting.png" width="50">
				<h2>${output.getNickname()} 님</h2>
			</div>
			<form role="form">
				<fieldset>
					<div class="form-group">
						<div class="circle"></div>
						<span>리워드 아이콘 선택</span><br /> <br />
						<ul class="img-list btn-group">
							<li	class="pull-left off" id="writer"><img src="${pageContext.request.contextPath}/img/common/reward_icon_posting.png" height="50"
								class="col-md-3 col-sm-3 col-xs-3 "></li>
							<li	class="pull-left off" id="comment"><img src="${pageContext.request.contextPath}/img/common/reward_icon_comment.png" height="50"
								class="col-md-3 col-sm-3 col-xs-3 "></li>
							<li	class="pull-left off" id="influ"><img src="${pageContext.request.contextPath}/img/common/reward_icon_influencer.png" height="50"
								class="col-md-3 col-sm-3 col-xs-3 "></li>
							<li	class="pull-left off" id="review"><img src="${pageContext.request.contextPath}/img/common/reward_icon_review.png" height="50"
								class="col-md-3 col-sm-3 col-xs-3 "></li>
						</ul>
						<ul class="img-list text-center">

							<li class="col-md-3 col-sm-3 col-xs-3 no" id="one">
								<p>포스팅지기</p>
							</li>
							<li class="col-md-3 col-sm-3 col-xs-3 no" id="two">
								<p>베댓러</p>
							</li>
							<li class="col-md-3 col-sm-3 col-xs-3 no" id="three">
								<p>인플루언서</p>
							</li>
							<li class="col-md-3 col-sm-3 col-xs-3 no" id="four">
								<p>리뷰왕</p>
							</li>
						</ul>
						<br> <br>
						<div class="form-group">
							<div class="circle"></div>
							<span>닉네임</span><br /> <input type="text" id="user_subname" name="nickname"
								class="form-control" placeholder="한글,영문,숫자 최대10자" value="${output.getNickname()}"/>
							<button type="button" class="btn btn-primary btn-ms btn-ttc3 btn-ttc5">
								중복확인</button>
							<div class="nickname" style="display: none;"><b>&nbsp;사용 가능한 닉네임 입니다.</b></div>
						</div>
						
						<br>
						<div class="form-group">
							<div class="circle"></div>
							<span>이메일 주소</span><br /> <input type="email" id="user_eamil" name="email"
								class="form-control" placeholder="email@example.com" value="${output.email}"/>
						</div>
						<br />
						<div class="form-group">
							<div class="circle"></div>
							<span>기존 비밀번호 </span><br /> <input type="password" id="user_pw" name="x_password"
								class="form-control" placeholder="영문,숫자 조합하여 최소4자,최대20자" />
						</div>
						<br />
						<div class="form-group">
							<div class="circle"></div>
							<span>새 비밀번호 확인</span><br /> <input type="password" id="user_pw_new" name="new_password"
								class="form-control" placeholder="비밀번호를 한 번 더 입력해주세요." />
						</div>
						<br />
						<div class="form-group">
							<div class="circle"></div>
							<span>비밀번호 확인</span><br /> <input type="password" id="user_pw_ok" name="new_password2"
								class="form-control" placeholder="비밀번호를 한 번 더 입력해주세요." />
						</div>
						<br /> <br />
						<div class="form-group">
							<div class="circle"></div>
							<span>회사 주소</span><br /> <span>제공하신 정보는 위치 기반 정보 제공에
								사용됩니다.</span><br /> <span>건물 번호(번지수)까지만 기입해주세요.</span> <br /> <input
								type="text" id="user_adress" class="form-control" name="addr1"
								placeholder="우편번호" />
							<button type="button" class="btn btn-primary btn-ttc btn-ms btn-ttc5">
								주소검색</button>
						</div>
						<br /> <br />
						<a href="#" onClick="history.back()"><button type="button" class="btn btn-primary btn-block btn-ttc5" id="edit"
							data-toggle="modal">회원 정보 수정</button></a>
							</div>
				</fieldset>
			</form>

			<hr style="border: solid 0.5px #aaa;" width="100%">
			<br> <br>
			<div class="form-group">
				<h4>회원 탈퇴</h4>
				<br>
				<p>회원 탈퇴시 데이터 사용 및 복구가</p>
				<p>불가하오니 신중하게 선택하시기 바랍니다.</p>
				<p>그래도 탈퇴하시겠습니까?</p>
				<input id="check" type="checkbox" value=""> <label
					class=" control-label">위 내용을 확인하였으며, 이에 동의합니다.</label><br /> <br />
				<button type="button" class="btn btn-danger btn-ms btn-ttc5" id="out"
					data-toggle="modal"  >회원 탈퇴하기</button>
				<br />
			</div>

		</div>
		<br /> <br /> <br /> <br /> <br />
		
	</div>
	
	<script src=" ${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js">
		
	</script>
	<script type="text/javascript">
		$(function() {
			$("#writer").click(function() {
				$("#writer").addClass("on");
				$("#one").addClass("yes");
				$("#comment").removeClass("on");
				$("#two").removeClass("yes");
				$("#influ").removeClass("on");
				$("#three").removeClass("yes");
				$("#review").removeClass("on");
				$("#four").removeClass("yes");
			});
			
			$("#comment").click(function() {
				$("#writer").removeClass("on");
				$("#one").removeClass("yes");
				$("#comment").addClass("on");
				$("#two").addClass("yes");
				$("#influ").removeClass("on");
				$("#three").removeClass("yes");
				$("#review").removeClass("on");
				$("#four").removeClass("yes");
			});
			
			$("#influ").click(function() {
				$("#writer").removeClass("on");
				$("#one").removeClass("yes");
				$("#comment").removeClass("on");
				$("#two").removeClass("yes");
				$("#influ").addClass("on");
				$("#three").addClass("yes");
				$("#review").removeClass("on");
				$("#four").removeClass("yes");
			});
			
			$("#review").click(function() {
				$("#writer").removeClass("on");
				$("#one").removeClass("yes");
				$("#comment").removeClass("on");
				$("#two").removeClass("yes");
				$("#influ").removeClass("on");
				$("#three").removeClass("yes");
				$("#review").addClass("on");
				$("#four").addClass("yes");
			});
			
			$(".btn-ttc3").click(function() {
				$(".nickname").attr('style', 'display: inline-block;')
			});
			
			$("#edit").click(function() {
				alert("회원 정보가 수정되었습니다.")
			});
			
			var agree = false;
			
			$("#check").change(function() {				
				if ($("#check").is(":checked")) {
		            agree = true;
		        } else {
		            agree = false;
		        }
			});
			
			$("#out").click(function() {
				if (!agree) {
					alert("동의하지 않으시면 탈퇴가 불가능합니다.")
				} else {
					alert("정상적으로 탈퇴되었습니다.")
				}
			});
		});
		
		$(function() {
	        $("#out").click(function(e) {
	            e.preventDefault();  // 링크 클릭에 대한 페이지 이동 방지
	            
	            let current = $(this);  // 이벤트가 발생한 객체 자신 ==> <a>태그
	            let userno = current.data('userno');     // data-profno 값을 가져옴
	            let name = current.data('name');         // data-name 값을 가져옴
	           // let position = current.data('position'); // data-position 값을 가져옴
	            let target = name + " " + position;      // "이름 + 공백 + 직급"형식의 문자열
	            
	            // 삭제 확인
	            if (!confirm("정말 " + target + "님을(를) 삭제하시겠습니까?")) {
	                return false;
	            }
	            
	            // delete 메서드로 Ajax 요청 --> <form> 전송이 아니므로 직접 구현한다.
	            $.delete("${pageContext.request.contextPath}/common", {
	                "userno": userno
	            }, function(json) {
	                if (json.rt == "OK") {
	                    alert("삭제되었습니다.");
	                    // 삭제 완료 후 목록 페이지로 이동
	                    window.location = "${pageContext.request.contextPath}/";
	                }
	            });
	        });
	    });
	</script>
</body>

</html>