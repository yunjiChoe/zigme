<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/admin_style.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />

<style type="text/css">
	label[for] { display: inline-block; width: 150px; margin-bottom: 5px}
</style>

</head>
<body>
<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/admin.jsp" />

		<p class="sub_title">업종/건강상태 수정</p>
		<div class="admin_link">
			<form id="editForm" action="${pageContext.request.contextPath}/admin/admin_catecondi">
				<%-- action 페이지에서 사용할 WHERE 조건값을 hidden 필드로 숨겨서 전송한다. --%>
        		<input type="hidden" name="cateCondiNo" value="${output.cateCondiNo}" />
				<div>
					<label for="cateCondiName">업종/건강상태 이름: </label>
					<input type="text" name="cateCondiName" id="cateCondiName" value="${output.cateCondiName}"/>
				</div>
				<br>
				<div>
					<label for="cateCondiFlag">분류: </label>
					<label><input type="radio" name="cateCondiFlag" id="cateCondiFlag_S" value="S" <c:if test="${output.cateCondiFlag == 'S'}">checked</c:if>/> 업종</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="cateCondiFlag" id="cateCondiFlag_C" value="C" <c:if test="${output.cateCondiFlag == 'C'}">checked</c:if>/> 건강상태</label>
				</div>
				<hr/>
				<button type="submit">저장하기</button>
        		<button type="reset">다시작성</button>
			</form>
		</div>
	</div>
	
	<c:import url="../inc/footer.jsp" />
    
	<!--Google CDN 서버로부터 jQuery 참조 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/plugin/ajax/ajax_helper.js"></script>
    <!-- User Code -->
    <script>
    $(function() {
        // #editForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
        $("#editForm").ajaxForm({
            // 전송 메서드 지정
            method: "PUT",
            // 서버에서 200 응답을 전달한 경우 실행됨
            success: function(json) {
                // json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
                if (json.rt == "OK") {
                    window.location = "${pageContext.request.contextPath}/admin/admin_catecondi/view.do?cateCondiNo=" + json.item.cateCondiNo;
                }
            }
        });
    });
    </script>
</body>
</html>