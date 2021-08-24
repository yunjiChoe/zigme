<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>직메 Zigme</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- ajax-helper -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugin/ajax/ajax_helper.css" />
<script
	src="${pageContext.request.contextPath}/plugin/ajax/ajax_helper.js"></script>


<!-- common.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/common.css" />

<style type="text/css">
#user_id, #user_subname {
	width: 69%;
	display: inline-block;
}

#jbody {
	margin-top: 30px;
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
	background:
		url(${pageContext.request.contextPath}/img/common/checkbox_circle-01.png)
		no-repeat 0 0;
	background-size: 20px;
	vertical-align: top;
}

.check-form input:checked+label::before {
	background:
		url(${pageContext.request.contextPath}/img/common/checkbox_circle_selected-01.png)
		no-repeat 0 0;
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
	background:
		url(${pageContext.request.contextPath}/img/common/checkbox_circle-01.png)
		no-repeat 0 0;
	background-size: 20px;
	vertical-align: top;
}

.ch-form input:checked+label::after {
	background:
		url(${pageContext.request.contextPath}/img/common/checkbox_circle_selected-01.png)
		no-repeat 0 0;
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
	min-height: 330px;
	padding-top: 20px;
}

.agree {
	padding-left: 18px;
	margin: auto;
	min-height: 220px;
	width: 400px;
	margin: auto;
}

#user_detailAddress, #user_extraAddress {
	width: 49%;
	display: inline-block;
}

.b {
	width: 800px;
}
/* 중복아이디 존재하지 않는경우 */
.id_input_re_1 {
	color: green;
	display: none;
}
/* 중복아이디 존재하는 경우 */
.id_input_re_2 {
	color: red;
	display: none;
}
</style>
</head>

<body id="jbody">
	<form role="form" id="join_form" method="post"
		action="${pageContext.request.contextPath}/common/join_ok.do">
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
						<p>반갑습니다.</p>
						<div id='result'></div>

						<p>메이트가 되신것을 환영합니다.</p>
					</div>
					<!-- 하단 -->
					<div class=" text-center">
						<button type="submit" class="btn  btn-primary btn-lg btn-ttc5">확인
						</button>

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
					<a href="${pageContext.request.contextPath}"> <img
						src="${pageContext.request.contextPath}/img/common/logo.png"></a>
					<div class="id-blue">
						<div class="square"></div>
						회원가입
					</div>
				</div>
				<br /> <br /> <br />

				<fieldset id="jfieldset">
					<div class="form-group">
						<div class="circle"></div>
						<label for="user_id">아이디</label><br /> <input type="text"
							name="id" id="user_id" class="form-control"
							placeholder="영문,숫자 조합하여 4자~20자"  />
						<button type="button" id="id_check" name="id_check"
							class="btn btn-primary btn-ms btn-ttc1 btn-ttc5 id_input">중복확인</button>

						<div class="form-group">
							<div class="nickname1" style="display: none;">
								<b id="idCheck"></b>
							</div>
						</div>
					</div>
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
						class="id_input_re_2">아이디가 이미 존재합니다.</span> <br>
					<div class="form-group">
						<div class="circle"></div>
						<label for="user_pw">비밀번호</label><br /> <input type="password"
							id="user_pw" name="password" class="form-control"
							placeholder="영문,숫자 조합하여 최소4자,최대20자" />
					</div>
					<br />
					<div class="form-group">
						<div class="circle"></div>
						<label for="user_repw">비밀번호 확인</label><br /> <input
							type="password" id="user_repw" name="passwordcheck"
							class="form-control" placeholder="비밀번호를 한 번 더 입력해주세요." /> <font
							id="chkNotice" size="2"></font> <br />
						<div class="form-group">
						</div>



							<div class="circle"></div>
							<label for="user_name">이름</label><br /> <input type="text"
								id="user_name" name="name" class="form-control"
								placeholder="한글,최소 2자, 최대20자" />
						</div>
						<br />
						<div class="form-group">
							<div class="circle"></div>
							<label for="user_nickname">닉네임</label><br /> <input type="text"
								id="user_subname" name="nickname" class="form-control"
								placeholder="한글,영문,숫자 최소2자,최대 5자" />
							<button type="button"
								class="btn btn-primary btn-ms btn-ttc4 btn-ttc5 " id="checkNick">중복확인</button>
							<div class="nickname" style="display: none;"></div>
						</div>
						<br /> <br />
						<div class="form-group">
							<div class="circle"></div>
							<label for="user_email">이메일</label><br /> <input type="email"
								id="user_eamil" name="email" class="form-control"
								placeholder="email@example.com" />
						</div>
						<span id="emailcheck"></span> <br />
						<div class="form-group ">
							<div class="check-form">
								<div class="circle"></div>
								<span for="gender"><b>성별</b></span><br /> <span>제공하신 정보는
									성별 맞춤 정보 제공에 사용됩니다.</span> <br /> <input type="radio" id="gender_m"
									name="gender" value="1" /> <label for="gender_m">남성</label> <input
									type="radio" id="gender_f" name="gender" value="2" /> <label
									for="gender_f">여성</label>
							</div>
						</div>
						<br />
						<div class="form-group">
							<div class="circle"></div>
							<label for="user_adress">회사 주소</label><br /> <span>제공하신
								정보는 위치 기반 정보 제공에 사용됩니다.</span><br /> <span>건물 번호(번지수)까지만
								기입해주세요.</span> <br /> <input type="text" id="user_postcode"
								class="form-control" name="postcode" placeholder="우편번호" />
							<button type="button"
								class="btn btn-primary btn-ttc btn-ms btn-ttc5"
								onclick="execDaumPostcode()">주소검색</button>


							<input type="text" class="form-control" id="user_address"
								name="addr1" placeholder="주소"> <input type="text"
								id="user_detailAddress" class="form-control" name="addr2"
								placeholder="상세주소"> <input type="text"
								id="user_extraAddress" class="form-control" placeholder="참고항목">
							<input type="hidden"  class="form-control" id="loc_xy" name="loc_xy" />

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



				<div class="form-agree">
					<div class="form-group agree ch-form">
						<input id="all_check" class="terms" type="checkbox"
							name="checkAll" ><label for="all_check"
							class="col-md-4  control-label">전체동의</label> <br>
						<div class="form-group ch-form">
							<div class="circle"></div>
							<input class="terms" id="checkbox1" type="checkbox"
								name="checkOne"><label for="checkbox1">직메:
								직장인메이트 이용약관 동의(필수)</label>
							<textarea class="form-control col-sm-5" disabled
								placeholder="" >직메: 직장인 메이트 서비스 및 제품(이하'서비스')을 이용해주셔서 감사합니다. 본 약관은 다양한 '직메:직장인메이트직장인 메이트 서비스 및 제품(이하'서비스')을 이용해주셔서 감사합니다.여러분을 환영합니다.
ZIGME 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 ZIGME 서비스의 이용과 관련하여 ZIGME 서비스를 제공하는 ZIGME 주식회사(이하 ‘ZIGME’)와 이를 이용하는 ZIGME 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 ZIGME 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
ZIGME 서비스를 이용하시거나 ZIGME 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
다양한 ZIGME 서비스를 즐겨보세요.
ZIGME는 www.ZIGME.com을 비롯한 ZIGME 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션등을 회원으로 가입하시면 ZIGME 서비스를 보다 편리하게 이용할 수 있습니다.

여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다.
본 약관은 한국어를 정본으로 합니다. 본 약관 또는 ZIGME 서비스와 관련된 여러분과 ZIGME와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 ZIGME 서비스와 관련하여 여러분과 ZIGME 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다.</textarea>
						</div>
						<br /> <br />
						<div class="form-group ch-form">
							<div class="circle"></div>
							<input class="terms" id="checkbox2" type="checkbox"
								name="checkOne"><label for="checkbox2">개인정보 수집 및
								이용 동의(필수)</label>
							<textarea class="form-control col-sm-5" disabled ="disabled"
								placeholder="" >개인정보보호법에 따라 직메에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
 수집하는 개인정보 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 직메 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 직메는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
회원가입 시점에 직메가 이용자로부터 수집하는 개인정보는 개인적으로 사용하지 않습니다.
참고로 직메는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.</textarea>
						</div>
					</div>

				</div>



				<div class="btn1">
					<button type="submit" id="join"
						class="btn btn-primary btn-block btn-ttc5 join_button"
						data-toggle="modal">회원가입</button>
					<br /> <br /> <br />
				</div>
			</div>
		</div>
	</form>




	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script type="text/javascript">
	
	
	
	window.onbeforeunload = function(e){
		document.getElementById("user_address").value = "";
		document.getElementById("user_postcode").value = "";
		document.getElementById("user_detailAddress").value = "";
	}



		// 우편번호 찾기 찾기 화면을 넣을 element
		var addr = ''; // 주소 변수
		var extraAddr = ''; // 참고항목 변수
		var x='';
		var y='';
		
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {			
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							

							
							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
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
							document.getElementById("user_detailAddress")
									.focus();
							//------------------------------------------------------------------------
							/** 주소 x,y 좌표로 변환 하는 API */
							var q =  document.getElementById("user_address").value; //검색 내용
							 console.log(q);
							    //ajax 시작
								$.ajax({
									url : 'https://dapi.kakao.com/v2/local/search/address.json',
									headers : { 'Authorization' : 'KakaoAK 1ddad6942cf2073a924b3e0c0a3b66bf'	},
									type: 'GET',
									data : { 'query' : q },
									success : function(data){
										//호출 성공하면 작성할 내용
							            if(data != 0 ){ // 값이 있으면
										 x = data.documents[0].x;
							           	 y = data.documents[0].y;
							             console.log(x);
							             console.log(y);
										 document.getElementById("loc_xy").value = x +", "+ y;
							            
							           
							             
							             }		
							            
									}, 
									error:function(request,status,error){
									    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									}
								}).done(function(data){
									console.log(data);

								 }); // 좌표 변환 end
								
								
							
						}
					}).open();
		}
		

			 
		  
			 
				
	

		//----------------------------------------------------------------------
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

		});
		/** 회원가입 완료시 닉네임이 팝업으로 값이 따라가도록 funtion줌 
		function printName() {
			const name = document.getElementById('user_subname').value;
			document.getElementById("result").innerText = name;
		}*/
		
	    
		
		
		//------------------------------------------------------------------------
		/** 아이디 중복 확인 */
		$(function() {
			
			
			
			
			
		    //idck 버튼을 클릭했을 때 
		    $("#id_check").click(function() {
		        
		    	
			        var id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
			        if (!id) {	// 입력되지 않았다면?
						alert("아이디을 입력해주세요.");	// <-- 메시지 표시
						$("#user_id").focus();			// <-- 커서를 강제로 넣기
						return false;					// <-- 실행 중단
					}
			        
			        
			        $.ajax({
			            url:'${pageContext.request.contextPath}/common', //Controller에서 인식할 주소
			            type:'POST', //POST 방식으로 전달
			            data:{id : id},
			            
			           success: function(req) {
							// 사용 가능한 아이디인 경우 --> req = { result: "OK" }
							// 사용 불가능한 아이디인 경우 --> req = { result: "FAIL" }
							if (req.result == "0") {
								alert("사용 가능한 아이디 입니다.");
							} else {
								alert("사용할 수 없는 아이디 입니다.");
								$("#user_id").val("");
								$("#user_id").focus();
							}
			            }
			        });
		    });
		});
			      
		//------------------------------------------------------------------
		/** 닉네임 중복 확인 */
		$(function() {
			
			/** 버튼 클릭시 이벤트 */
			$("#checkNick").click(function() {
				// 입력값을 취득하고, 내용의 존재여부를 검사한다.
				var nickname = $("#user_subname").val();
				
				if (!nickname) {	// 입력되지 않았다면?
					alert("닉네임을 입력해주세요.");	// <-- 메시지 표시
					$("#user_subname").focus();			// <-- 커서를 강제로 넣기
					return false;					// <-- 실행 중단
				}

				// 위의 if문을 무사히 통과했다면 내용이 존재한다는 의미이므로,
				// 입력된 내용을 Ajax를 사용해서 웹 프로그램에게 전달한다.
				$.ajax({
			            url:'${pageContext.request.contextPath}/common/ni', //Controller에서 인식할 주소
			            type:'POST', //POST 방식으로 전달
			            data:{nickname : nickname},
			            
			           success: function(req) {
							// 사용 가능한 아이디인 경우 --> req = { result: "OK" }
							// 사용 불가능한 아이디인 경우 --> req = { result: "FAIL" }
							if (req.result == "0") {
								alert("사용 가능한 닉네임 입니다.");
							} else {
								alert("사용할 수 없는 닉네임 입니다.");
								$("#user_subname").val("");
								$("#user_subname").focus();
							}
			            }
			     
				}); // end $.get
			}); // end click
		});
		
		
		



		
		
		//-------------------------------------------------------------------------
		/** 비밀번호 일치 여부 */
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
	
		
		
		
		
	</script>
</body>

</html>