<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

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
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- common.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />

<style type="text/css">
#user_id, #user_subname {
	width: 69%;
	display: inline-block;
}

#jbody {
	margin-top: 30px;
}

.form-group {
	margin: 0;
	padding: 10px;
}

.btn-primary {
	background-color: #4041fe;
}

.btn-primary:hover, .btn-primary:focus {
	border-color: #4041fe;
	background-color: #4041fe;
	color: #FFF;
}

.jcontainer {
	width: auto;
	max-width: 420px;
	padding-top: 20px;
}

#jfieldset {
	margin: 0 30px;
}

#user_id, #user_subname {
	width: 69%;
	display: inline-block;
}

.btn-ms {
	width: 29%;
}

#user_postcode {
	width: 49%;
	display: inline-block;
}

.btn-ttc {
	width: 49%;
}

.nickname {
	color: #4a6;
	font-size: 13px;
}

.nickname1 {
	color: #4a6;
	font-size: 13px;
}

/** 성별 체크박스 이미지 CSS */
.check-form {
	margin-top: 20px;
}

/** 버튼 이미지 */
.check-form label::before {
	content: '';
	display: inline-block;
	width: 20px;
	height: 20px;
	background: url(${pageContext.request.contextPath}/img/common/checkbox_circle-01.png) no-repeat 0 0;
	background-size: 20px;
	vertical-align: top;
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
	padding-right: 20px;
}

label::before {
	margin-right: 10px;
}

/** 여기까지 성별 CSS */
/** 동의서 CSS*/
.ch-form {
	margin-top: 20px;
}

/** 버튼 이미지 */
.ch-form label::after {
	content: '';
	display: inline-block;
	width: 20px;
	height: 20px;
	background: url(${pageContext.request.contextPath}/img/common/checkbox_circle-01.png) no-repeat 0 0;
	background-size: 20px;
	vertical-align: top;
}

.ch-form input:checked+label::after {
	background: url(${pageContext.request.contextPath}/img/common/checkbox_circle_selected-01.png) no-repeat
		0 0;
	background-size: 20px;
}

.ch-form input {
	position: absolute;
	overflow: hidden;
	width: 1px;
	height: 1px;
	margin: -1px;
	opacity: 0;
}

.ch-form label {
	padding-top: 10px;
	padding-right: 20px;
}

label::after {
	margin-left: 10px;
}

/** CCSSSS*/
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
	margin-left: 9px;
	max-width: 350px;
	min-width: 350px;
	max-height: 50px;
	min-height: 50px;
}

.btn-ttc5 {
	margin-bottom: 3px;
}

.btn1 {
	width: 300px;
	margin: auto;
}

.form-agree {
	width: auto;
	min-height: 330px;
	margin: 0 490px;
	padding-top: 20px;
	border-top: solid 1px #000;
	border-bottom: solid 1px #000;
}

.agree {
	padding-left: 18px;
	margin: auto;
	min-height: 220px;
	width: 400px;
	margin: auto;
}
#user_detailAddress,#user_extraAddress{
width: 49%;
display: inline-block;
}
</style>
</head>

<body id="jbody">
	<!-- .modal -->
	<div id="find-id-modal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<!-- .modal-dialog -->
		<div class="modal-dialog">
			<!-- .modal-content -->
			<div class="modal-content">
				<!--제목 -->
				<div class="modal-header">
					<!-- 닫기버튼 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<br>
					<h4 class="modal-title  text-info text-center" id="myModalLabel">회원가입
						완료</h4>
				</div>
				<!-- 내용 -->
				<div class="modal-body text-center">
					<p>반갑습니다. 정자바 님</p>
					<p>메이트가 되신것을 환영합니다.</p>
				</div>
				<!-- 하단 -->
				<div class=" text-center">
					<a href="${pageContext.request.contextPath}">
						<button type="button" class="btn  btn-primary btn-lg btn-ttc5">확인
						</button>
					</a>
				</div>
				<br />
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<div class="container jcontainer">
		<div class="content ">
			<div class="find-id-header">
				<a href="${pageContext.request.contextPath}/intro_zigme"> <img src="${pageContext.request.contextPath}/img/common/logo.png"></a>
				<div class="id-blue">
					<div class="square"></div>
					회원가입
				</div>
			</div>
			<br /> <br /> <br />
			<form role="form">
				<fieldset id="jfieldset">
					<div class="form-group">
						<div class="circle"></div>
						<span>아이디</span><br /> <input type="text" id="user_id"
							class="form-control" placeholder="영문,숫자 조합하여 4자~20자" />
						<button type="button"
							class="btn btn-primary btn-ms btn-ttc1 btn-ttc5">중복확인</button>
						<div class="nickname1" style="display: none;">
							<b>&nbsp;사용 가능한 아이디 입니다.</b>
						</div>
					</div>

					<br>
					<div class="form-group">
						<div class="circle"></div>
						<span>비밀번호</span><br /> <input type="password" id="user_pw"
							class="form-control" placeholder="영문,숫자 조합하여 최소4자,최대20자" />
					</div>
					<br />
					<div class="form-group">
						<div class="circle"></div>
						<span>비밀번호 확인</span><br /> <input type="password" id="user_pw"
							class="form-control" placeholder="비밀번호를 한 번 더 입력해주세요." />
					</div>
					<br />
					<div class="form-group">
						<div class="circle"></div>
						<span>이름</span><br /> <input type="text" id="user_name"
							class="form-control" placeholder="한글,최소 2자, 최대20자" />
					</div>
					<br />
					<div class="form-group">
						<div class="circle"></div>
						<span>닉네임</span><br /> <input type="text" id="user_subname"
							class="form-control" placeholder="한글,영문,숫자 최대10자" />
						<button type="button"
							class="btn btn-primary btn-ms btn-ttc4 btn-ttc5">중복확인</button>
						<div class="nickname" style="display: none;">
							<b>&nbsp;사용 가능한 닉네임 입니다.</b>
						</div>
					</div>
					<br /> <br />
					<div class="form-group">
						<div class="circle"></div>
						<span>이메일 주소</span><br /> <input type="email" id="user_eamil"
							class="form-control" placeholder="email@example.com" />
					</div>
					<br />
					<div class="form-group ">
						<div class="check-form">
							<div class="circle"></div>
							<span>성별</span><br /> <span>제공하신 정보는 성별 맞춤 정보 제공에 사용됩니다.</span>
							<br /> <input type="radio" id="gender_m" name="gender" value="M" />
							<label for="gender_m">남성</label> <input type="radio"
								id="gender_f" name="gender" value="F" /> <label for="gender_f">여성</label>
						</div>
					</div>
					<br />
					<div class="form-group">
						<div class="circle"></div>
						<span>회사 주소</span><br /> <span>제공하신 정보는 위치 기반 정보 제공에
							사용됩니다.</span><br /> <span>건물 번호(번지수)까지만 기입해주세요.</span> <br /> <input
							type="text" id="user_postcode" class="form-control"
							placeholder="우편번호" />
						<button type="button"
							class="btn btn-primary btn-ttc btn-ms btn-ttc5"
							onclick="execDaumPostcode()">주소검색</button>

						
							<input type="text" class="form-control" id="user_address"placeholder="주소"> 
							<input type="text"id="user_detailAddress" class="form-control" placeholder="상세주소"> 
							<input type="text" id="user_extraAddress" class="form-control" placeholder="참고항목">

					</div>
					<div id="wrap"
						style="display: none; border: 1px solid; width: 500px; height: 500px; margin: 5px 0; position: relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
				</fieldset>
				<br /> <br /> <br />

			</form>
		</div>
	</div>
	<div class="form-agree">
		<div class="form-group agree ch-form">
			<input id="all_check" class="terms" type="checkbox" name="checkAll"><label
				for="all_check" class="col-md-4  control-label">전체동의</label> <br>
			<div class="form-group ch-form">
				<div class="circle"></div>
				<input class="terms" id="checkbox1" type="checkbox" name="checkOne"><label
					for="checkbox1">직메: 직장인메이트 이용약관 동의(필수)</label>
				<textarea class="form-control col-sm-5" disabled
					placeholder="직메: 직장인 메이트 서비스 및 제품(이하'서비스')을 이용해주셔서 감사합니다. 본 약관은 다양한 '직메:직장인메이트직장인 메이트 서비스 및 제품(이하'서비스')을 이용해주셔서 감사합니다. 본 약관ㅇ ㄴ다양한 '직메:직장인메이트" /></textarea>
			</div>
			<br /> <br />
			<div class="form-group ch-form">
				<div class="circle"></div>
				<input class="terms" id="checkbox2" type="checkbox" name="checkOne"><label
					for="checkbox2">개인정보 수집 및 이용 동의(필수)</label>
				<textarea class="form-control col-sm-5" disabled
					placeholder="개인정보보호법에 따라 '직메'에  회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의수집 및 이용목적개인정보보호법에 따라 '직메'에  회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의수집 및 이용목적" /></textarea>
			</div>
		</div>
	</div>
	<br />
	<br />
	<div class="btn1">
		<button type="button" class="btn btn-primary btn-block btn-ttc5"
			data-toggle="modal" href="#find-id-modal">회원가입</button>
		<br /> <br /> <br />
	</div>
	<script src=" ${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js">
		
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		// 우편번호 찾기 찾기 화면을 넣을 element
		    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("user_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("user_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_postcode').value = data.zonecode;
                document.getElementById("user_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_detailAddress").focus();
            }
        }).open();
    }
		
		
		

		/* 체크박스 중에 하나라도 체크해제하면 전체 동의 해제 */
		function allCheckFunc(obj) {
			$("[name=checkOne]").prop("checked", $(obj).prop("checked"));
		}

		/* 체크박스 체크시 전체선택 체크 여부 */
		function oneCheckFunc(obj) {
			var allObj = $("[name=checkAll]");
			var objName = $(obj).attr("name");

			if ($(obj).prop("checked")) {
				checkBoxLength = $("[name=" + objName + "]").length;
				checkedLength = $("[name=" + objName + "]:checked").length;

				if (checkBoxLength == checkedLength) {
					allObj.prop("checked", true);
				} else {
					allObj.prop("checked", false);
				}
			} else {
				allObj.prop("checked", false);
			}
		}
		$(function() {
			$("#all_check").change(function() {
				$(".terms").prop('checked', $(this).prop('checked'));
			});

			$("[name=checkOne]").each(function() {
				$(this).click(function() {
					oneCheckFunc($(this));
				});
			});

			/*중복확인 버튼누르면 밑에 글씨 나오는 이벤트*/
			$(".btn-ttc4").click(function() {
				$(".nickname").attr('style', 'display: inline-block;')
			});
			$(".btn-ttc1").click(function() {
				$(".nickname1").attr('style', 'display: inline-block;')
			});
		});
	</script>
</body>

</html>