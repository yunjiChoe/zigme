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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

<!-- common.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/common.css" />

<style type="text/css">
#user_id, #user_subname {
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

.btn-danger:hover, .btn-danger:focus {
	background-color: #ff0000;
	color: #FFF;
}

.btn-primary:hover, .btn-primary:focus {
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
	background:
		url(${pageContext.request.contextPath}/img/common/checkbox_circle-01.png)
		no-repeat 0 0;
	background-size: 20px;
	vertical-align: top;
}

.check-form {
	margin-top: 20px;
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

.btn-ttc5 {
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

.btn-danger:hover, .btn-danger:focus {
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

#user_postcode {
	width: 49%;
	display: inline-block;
}

#user_detailAddress, #user_extraAddress {
	width: 49%;
	display: inline-block;
}
</style>
</head>

<body>
	<div class="container mycontainer">
		<div class="content ">
			<div class="find-id-header">
				<a href="${pageContext.request.contextPath}/main"> <img
					src="${pageContext.request.contextPath}/img/common/logo.png"></a>
				<div class="id-blue">
					<div class="square"></div>
					내 정보 수정
				</div>
			</div>
			<br /> <br /> <br />
			<div class="icon">
				<img
					src="${pageContext.request.contextPath}/img/common/reward_icon_influencer.png"
					width="50">
				<h2>${zigme_user.nickname}님</h2>
				<input type="hidden" name="userNo" value="${zigme_user.userNo}" id="userNo">
				<input type="hidden" name="id" value="${my_session}" id="user_id">
			</div>
			<form role="form" action="" method="get">
				<fieldset>
					<div class="form-group">
						<div class="circle"></div>


						<span>닉네임</span><br /> <input type="text" id="user_subname"
							name="nickname" class="form-control" placeholder="한글,영문,숫자 최대10자"
							value="${zigme_user.nickname}" />
						<button type="button"
							class="btn btn-primary btn-ms btn-ttc3 btn-ttc5" id="checkNick">
							중복확인</button>

						
					</div>

					<br>
					<div class="form-group">
						<div class="circle"></div>
						<span>이메일 주소</span><br /> <input type="email" id="user_eamil"
							name="email" class="form-control" placeholder="email@example.com"
							value="${zigme_user.email}" />
					</div>
					<br />
					<div class="form-group">
						<div class="circle"></div>
						<span>기존 비밀번호 </span><br /> <input type="password" id="user_pw"
							name="password" class="form-control"
							placeholder="영문,숫자 조합하여 최소4자,최대20자" />
					</div>
					<br />
					<div class="form-group">
						<div class="circle"></div>
						<span id="aa">비밀번호 변경</span><br /> <input type="password"
							id="user_pw_new" name="new_password" class="form-control"
							placeholder="재설정 하실 비밀번호를 입력해주세요."  />
					</div>
					<br />
					<div class="form-group">
						<div class="circle"></div>
						<span>비밀번호 확인</span><br /> <input type="password" id="user_pw_ok"
							name="new_password2" class="form-control"
							placeholder="변경하시는 비밀번호를 한 번 더 입력해주세요."  disabled="disabled" />
							<font
							id="chkNotice" size="2"></font> <br />
					</div>
					<br /> <br />
					<div class="form-group">
						<div class="circle"></div>
						<label for="user_adress">회사 주소</label><br /> <span>제공하신
							정보는 위치 기반 정보 제공에 사용됩니다.</span><br /> <span>건물 번호(번지수)까지만 기입해주세요.</span>
						<br /> <input type="text" id="user_postcode" class="form-control"
							name="postcode" placeholder="${zigme_user.postcode}" value="${zigme_user.postcode}" />
						<button type="button"
								class="btn btn-primary btn-ttc btn-ms btn-ttc5"
								onclick="DaumPostcode()">주소검색</button>

						<input type="text" class="form-control" id="user_address"
							name="addr1" placeholder="${zigme_user.addr1}" value="${zigme_user.addr1}"> <input
							type="text" id="user_detailAddress" class="form-control"
							name="addr2" placeholder="${zigme_user.addr2}" value="${zigme_user.addr2}"> <input
							type="text" id="user_extraAddress" class="form-control"
							placeholder="참고항목"> <input type="hidden"
							class="form-control" id="loc_xy" name="loc_xy" value="${zigme_user.loc_xy}"/>

					</div>
					<div id="wrap"
						style="display: none; border: 1px solid; width: 500px; height: 500px; margin: 5px 0; position: relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
					<br /> <br /> <!-- <a href="#" onClick="history.back()"> -->
			<a href="#" onClick="location.reload()"> 			<button type="button" class="btn btn-primary btn-block btn-ttc5"  
							id="edit" data-toggle="modal">회원 정보 수정</button></a>
					
				</fieldset>
			</form>
		</div>


		<hr style="border: solid 0.5px #aaa;" width="100%">
		<br> <br>
		<div class="form-group">
			<h4>회원 탈퇴</h4>
			<br>
			<p>회원 탈퇴시 데이터 사용 및 복구가</p>
			<p>불가하오니 신중하게 선택하시기 바랍니다.</p>
			<p>그래도 탈퇴하시겠습니까?</p>
			<input id="check" type="checkbox" name="outUserflag"
				value="${zigme_user.outUserflag}"> <label
				class=" control-label">위 내용을 확인하였으며, 이에 동의합니다.</label><br /> <br />
			<button type="button" class="btn btn-danger btn-ms btn-ttc5" id="out"
				data-toggle="modal">회원 탈퇴하기</button>
			<br />
		</div>

	</div>
	<br />
	<br />
	<br />
	<br />
	<br />


	
	<script
		src=" ${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		  <script src="${pageContext.request.contextPath}/assets/js/session.js"></script>
	<script type="text/javascript">
	
	// 우편번호 찾기 찾기 화면을 넣을 element
	var addr = ''; // 주소 변수
	var extraAddr = ''; // 참고항목 변수
	var x='';
	var y='';
	
	function DaumPostcode() {
		new daum.Postcode({
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
	
	
	

		/** 탈퇴동의 체크 박스 여부 '1' = 'Y' , '2' ='N' */
		$(function() {
	        $("#check").click(function(e) {
	        	var value  = document.getElementById("check").value; 
	        	
	        	if(value == "N"){
	        		$('#check').attr('value','1'); 
	        	}else
	        	$('#check').attr('value','2');
	        });
		
		});
		
		
		
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
		
		
		
		   /** 비밀번호 일치 여부 */
		   $(function() {
		      
		      $('#user_pw_new').keyup(function() {
		         $('#user_pw').attr("disabled","disabled");
		          $('#user_pw_ok').removeAttr("disabled");
		         $('#chkNotice').html('');
		      });
		      

		      $('#user_pw_ok').keyup(function() {

		         if ($('#user_pw_new').val() != $('#user_pw_ok').val()) {
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
			    $("#edit").click(function() {
			    	var nickname = document.getElementById("user_subname").value;
					var email = document.getElementById("user_eamil").value;
					var password =  $('#user_pw').val();
					var new_password =  $('#user_pw_new').val();
				
			       var postcode = document.getElementById("user_postcode").value;
			        var addr1 =document.getElementById("user_address").value;
			        var addr2 =document.getElementById("user_detailAddress").value;
			        var loc_xy =document.getElementById("loc_xy").value;
			        var outUserflag = document.getElementById("check").value; 
			        var userNo = ${zigme_user.userNo};
			       console.log(userNo);
			       console.log(loc_xy);
			       
			       
			     
						// 입력값을 취득하고, 내용의 존재여부를 검사한다.
						var nickname = $("#user_subname").val();
						
						if (!nickname) {	// 입력되지 않았다면?
							alert("닉네임을 입력해주세요.");	// <-- 메시지 표시
							$("#user_subname").focus();			// <-- 커서를 강제로 넣기
							return false;					// <-- 실행 중단
						}
						if (!email) {	// 입력되지 않았다면?
							alert("이메일을 입력해주세요.");	// <-- 메시지 표시
							$("#email").focus();			// <-- 커서를 강제로 넣기
							return false;					// <-- 실행 중단
						}
						if (!postcode) {	// 입력되지 않았다면?
							alert("주소를 입력해주세요.");	// <-- 메시지 표시
							$("#email").focus();			// <-- 커서를 강제로 넣기
							return false;					// <-- 실행 중단
						}
						
						if (!password) {	// 입력되지 않았다면?
							alert("비밀번호를 입력해주세요.");
							$('#user_pw').removeAttr("disabled");// <-- 메시지 표시
							$("#user_pw").focus();			// <-- 커서를 강제로 넣기
							return false;					// <-- 실행 중단
						}

						
						if (new_password) {	// 입력값이 있다면
							
							password =$('#user_pw_new').val();	// <-- 메시지 표시
							console.log( password)	;
						}		
			    	
    $.ajax({
				            url:'${pageContext.request.contextPath}/myinfo', //Controller에서 인식할 주소
				            type:'PUT', //PUT 방식으로 전달
				            data:{ "nickname" :nickname,"email" :email,"password": password ,"postcode" :postcode,"loc_xy" :loc_xy,
				            	"addr1" :addr1,"addr2" :addr2,"userNo" :userNo, " outUserflag":  outUserflag},
				            
				           success: function(json) {
				        	   console.log(json);
								// 사용 가능한 아이디인 경우 --> req = { result: "OK" }
								// 사용 불가능한 아이디인 경우 --> req = { result: "FAIL" }
								if (json.rt =="OK" ) {
								
									//console.log(json.item.userno);
									alert("수정 완료.");
								}
				            }
				        });
			    });
			});
		 
		 
		 
		 $(function() {
			 var agree = false;
			 
			 $("#check").change(function() {
				 
				 
			
					if ($("#check").is(":checked")) {
			            agree = true;
			        } else {
			            agree = false;
			        }
			 });
			 
			 
			    //out 버튼을 클릭했을 때 
			    $("#out").click(function() {
			    	
			    	var nickname = document.getElementById("user_subname").value;
			    	var retVal = confirm("정말 " + nickname + "님을(를) 삭제하시겠습니까?");
			        var id =document.getElementById("user_id").value;
			        var userNo = document.getElementById("userNo").value;
			        var outUserflag = document.getElementById("check").value;
			       console.log(userNo);
			       console.log(id);
			       
			       if (!agree) {
						alert("동의하지 않으시면 탈퇴가 불가능합니다.");
						return false;
		            }	else if(retVal ==false) {
		            	return false;
	
		            }
						 $.ajax({
						    	
						    	
					            url:'${pageContext.request.contextPath}/user_out', //Controller에서 인식할 주소
					            type:'PUT', //POST 방식으로 전달
					            data:{'id' : id , 'userNo' :userNo,'outUserflag':outUserflag},
					            
					           success: function(json) {
									// 사용 가능한 아이디인 경우 --> req = { result: "OK" }
									// 사용 불가능한 아이디인 경우 --> req = { result: "FAIL" }
									if (json.rt == "OK") {
										
										alert("탈퇴가 완료되었습니다.");
										window.location = "${pageContext.request.contextPath}/" ;
										
									} else {
										alert("탈퇴에 실패 했습니다.");
										
									}
					            }
					     
						}); // end $.get
				
			    });
			});
			
		  
		
		
	</script>
	
</body>

</html>