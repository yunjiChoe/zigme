/**
 * 로그인을 하지 않고 홈페이지에 들어왔을 경우 intro페이지로 이동
 */
window.onload = function () {
		
	var userno = $("#userNo").val();
	if (userno == 0) {	// 입력되지 않았다면?
		alert("로그인을 해주세요.");	// <-- 메시지 표시
		window.location.href='http://localhost:8080/zigme';
					
		
	}
	console.log('사용자가 웹페이지에 돌아왔습니다.');
};