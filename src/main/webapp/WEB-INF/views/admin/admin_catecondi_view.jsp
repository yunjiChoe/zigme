<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
</style>

</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/admin.jsp" />

		<p class="sub_title">업종/건강상태 정보</p>
		<div class="admin_view">
			<p>업종/건강상태 번호 : &nbsp;&nbsp;${output.cateCondiNo}</p>
			<p>업종/건강상태 이름 : &nbsp;&nbsp;${output.cateCondiName}</p>
			<p>업종/건강상태 분류 : &nbsp;&nbsp;${output.cateCondiFlag}</p>
		</div>
		<hr />
		<div class="admin_link">
			<a href="${pageContext.request.contextPath}/admin/admin_catecondi/list.do">[목록 보기]</a>&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/admin/admin_catecondi/add.do">[업종/건강 추가]</a>&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/admin/admin_catecondi/edit.do?cateCondiNo=${output.cateCondiNo}">[업종/건강 수정]</a>&nbsp;&nbsp;
			<a href="#" id="deletecatecondi" data-catecondino="${output.cateCondiNo}" data-catecondiname="${output.cateCondiName}">[업종/건강 삭제]</a>
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
        $("#deletecatecondi").click(function(e) {
            e.preventDefault();  // 링크 클릭에 대한 페이지 이동 방지
            
            let current = $(this);  // 이벤트가 발생한 객체 자신 ==> <a>태그
            let cateCondiNo = current.data('catecondino');     // data-catecondiNo 값을 가져옴
            let cateCondiName = current.data('catecondiname'); // data-catecondiName 값을 가져옴
            
            console.log(cateCondiNo);
            
            // 삭제 확인
            if (!confirm("정말 " + cateCondiName + "을(를) 삭제하시겠습니까?")) {
                return false;
            }
            
            // delete 메서드로 Ajax 요청 --> <form> 전송이 아니므로 직접 구현한다.
            $.delete("${pageContext.request.contextPath}/admin/admin_catecondi", {
                "cateCondiNo": cateCondiNo
            }, function(json) {
                if (json.rt == "OK") {
                    alert("삭제되었습니다.");
                    // 삭제 완료 후 목록 페이지로 이동
                    window.location = "${pageContext.request.contextPath}/admin/admin_catecondi/list.do";
                }
            });
        });
    });
    </script>
</body>
</html>