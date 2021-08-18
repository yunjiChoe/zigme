<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


     <!-- footer 영역 시작 -->
     <div class="footer">
       <span id="footer_title">(주)직장인 메이트</span>
       <br>
       <span>서울 서초구 서초대로 77길 55, 에이프로 스퀘어 3층 (서초동) | 사업자번호 : 120-00-67890</span>
       <br>
       <span>대표전화 : 1600-1234 | 팩스 : 050-6000-4646 | 대표메일 : <address><a href="mailto:zigme2021@gmail.com">zigme2021@gmail.com</a></address>
       <a href="${pageContext.request.contextPath}/admin">관리자</a>
       </span>
      </div>
	  <!-- // footer 영역 종료 --> 
	  
	   <!-- Javascript -->
	
      <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
       
   <script src="${pageContext.request.contextPath}/assets/js/session.js"></script>
      <script type="text/javascript">

        $(function() {

          // sub navbar slide
          $(".menu-item").hover(function() {
              $(this).find(".sub").slideToggle(300);
          });

         // main navbar menu hover img
         $(".menu-item").mouseover(function() {
            var img_name = $(this).data("imgname");

            $(this).css("background-image", "url(${pageContext.request.contextPath}/img/common/"+ img_name + ")");
            $(this).css("background-size", "100%");
            $(this).children().css("color","#fff");
         });

          $(".menu-item").mouseout(function() {
              $(".menu-item").css("background-image", "none");
              $(this).children().css("color", "#4041fe");
          });

        });
        window.onload = function () {
    		
        	var userno = $("#userNo").val();
        	if (userno == 0) {	// 입력되지 않았다면?
        		alert("로그인을 해주세요.");	// <-- 메시지 표시
        		window.location.href='http://localhost:8080/Zigme';
        					
        		
        	}
        	console.log('사용자가 웹페이지에 돌아왔습니다.');
        };

        </script>