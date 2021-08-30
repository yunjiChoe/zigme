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
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>

 <!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- 폰트스타일 정의 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ScoreDreamWebFont.css" />

<!-- common.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
</head>
<body>
<div class="container">
		<form method="post" action="${pageContext.request.contextPath}/report/review.do" >
			<div class="repo_title">신고하기</div>
			<div>
					<div><label class="repo_label">작성자: </label><span id="repo_id"></span></div>  <input type="hidden" name="repo_id_input" id="repo_id_input" />
					<div><label class="repo_label">내 용: </label> <p id="repo_content"></p></div>   <input type="hidden" name="repo_content_input" id="repo_content_input" />
					<div><label class="repo_label">작성날짜: </label> <span id="repo_date"></span></div><input type="hidden" name="repo_date_input" id="repo_date_input" />
			<hr />
			<label class="repo_label">사유작성: </label><br>
			<textarea maxlength="100" name="repo_textarea" id="repo_textarea" placeholder="해당 신고는 직메 운영자에게 전달됩니다. 잦은 허위신고는 제제를 받을 수 있습니다."></textarea>
			</div>
			
			<hr />
			<div id="btn-div">
					<input type=submit class="btn btn-danger" value="신고하기" onclick="window.close();"/>
					<input type=button class="btn btn-default" value="취소" onclick="window.close();" />
			</div>
		</form>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		
		 $("#repo_id").html(opener.document.getElementById("report_id").value);
		 $("#repo_content").html(opener.document.getElementById("report_content").value);
		 $("#repo_date").html(opener.document.getElementById("report_date").value);
		 
		 // form 전송을 위한 값 세팅
		 $("#repo_id_input").attr("value", opener.document.getElementById("report_id").value);
		 $("#repo_content_input").attr("value", opener.document.getElementById("report_content").value);
		 $("#repo_date_input").attr("value", opener.document.getElementById("report_date").value);
		 
	});

</script>

</body>
</html>