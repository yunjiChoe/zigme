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
<html lang="ko" dir="ltr">

<head>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugin/editor/css/styles.css" />
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
	
	<!-- bootstrap -->
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
	 
	 <!-- help.css -->
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/help.css" />
	 <!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
	 <c:import url="../inc/header.jsp" />

</head>
<body>
    <div class="container">
      <!--  include :: container 바로 아래에 있어야합니다 -->
	  <c:import url="../inc/navbar.jsp" />

    <p class="sub_title">커뮤니티 글쓰기</p>
    <br />
    <form id="addPostForm" action="${pageContext.request.contextPath}/help">
        <div class="input-group input-group-lg">
            <input type="text" class="form-control editor_title" name="postTitle" placeholder="제목을 입력하세요." />
            <span class="input-group-addon">
                <select class="editor_cate" name="postSubtitle">
                <option value="">말머리</option>
                <option value="도움">도움</option>
                <option value="꿀팁">꿀팁</option>
                <option value="넋두리">넋두리</option>
            	</select>
            </span>
        </div>
        
        <hr />
        
        <div>
        	<input type="text" id="postContent" name="postContent" placeholder="내용을 입력하세요." />
        </div>
        <hr />
    	<div class="input-group" id="write_buttons">
    		<button type="reset" id="write_cancel" class="btn btn-warning">취소</button>
    		<span>&nbsp;</span>
    		<!--  추후 submit 으로 버튼 수정필요 -->
    		<button type="submit" id="write_submit" class="btn btn-info">등록</button> 
    	</div>
    </form>
	</div>
	
    <c:import url="../inc/footer.jsp" />
    <!--Google CDN 서버로부터 jQuery 참조 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/ajax/ajax_helper.js"></script>
    <!-- User Code -->
    <script>
    $(function() {
        // #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
        $("#addPostForm").ajaxForm({
            // 전송 메서드 지정
            method: "POST",
            // 서버에서 200 응답을 전달한 경우 실행됨
            success: function(json) {
                console.log(json);
                
                // json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
                if (json.rt == "OK") {
                    window.location = "${pageContext.request.contextPath}/help_ajax/help_comm_read.do?postNo="+ json.item.postNo;
                }
            }
        });
    });
    </script>

</body>
</html>