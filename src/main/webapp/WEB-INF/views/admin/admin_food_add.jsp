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
	label[for] { display: inline-block; width: 100px; margin-bottom: 5px}
</style>

</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/admin.jsp" />

		<p class="sub_title">음식 추가</p>
		<div class="admin_link">
			<form id="addForm" action="${pageContext.request.contextPath}/admin/admin_food">
				<div>
					<label for="foodName">음식 이름: </label>
					<input type="text" name="foodName" id="foodName" />
				</div>
				<br>
				<div>
					<label for="foodCategory">업종: </label>
					<select name="foodCategory" id="foodCategory">
						<option value="">--선택--</option>
                        <option value="한식">한식</option>
                        <option value="양식">양식</option>
                        <option value="일식">일식</option>
                        <option value="중식">중식</option>
                        <option value="분식">분식</option>
                        <option value="그외">그외</option>
					</select>
				</div>
				<br>
				<div>
					<label for="foodWeather">선호 날씨: </label>
					<select name="foodWeather" id="foodWeather">
						<option value="">--선택--</option>
                        <option value="맑음">맑음</option>
                        <option value="흐림">흐림</option>
                        <option value="비">비</option>
                        <option value="눈">눈</option>
                        <option value="대기오염">대기오염</option>
					</select>
				</div>
				<br>
				<div>
					<label for="foodCondition">건강상태정보: </label>
					<select name="foodCondition" id="foodCondition">
						<option value="">--선택--</option>
                        <option value="감기몸살">감기몸살</option>
                        <option value="소화불량">소화불량</option>
                        <option value="숙취해소">숙취해소</option>
                        <option value="기력보충">기력보충</option>
                        <option value="다이어트">다이어트</option>
					</select>
				</div>
				<br>
				<div>
					<label for="delFoodflag">삭제여부: </label>
					<label><input type="radio" name="delFoodflag" id="delFoodflag_Y" value="Y"/> Y</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="delFoodflag" id="delFoodflag_N" value="N" checked/> N</label>
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
        // #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
        $("#addForm").ajaxForm({
            // 전송 메서드 지정
            method: "POST",
            // 서버에서 200 응답을 전달한 경우 실행됨
            success: function(json) {
                console.log(json);
                
                // json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
                if (json.rt == "OK") {
                    window.location = "${pageContext.request.contextPath}/admin/admin_food/view.do?foodNo=" + json.item.foodNo;
                }
            }
        });
    });
    </script>
</body>
</html>