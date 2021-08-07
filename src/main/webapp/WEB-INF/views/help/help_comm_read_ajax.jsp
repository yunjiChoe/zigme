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
<!doctype html>
<html>
<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->


<!-- Styles -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/plugin/comments/css/jquery-comments.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<!-- Data -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/plugin/comments/data/comments-data.js"></script>

<!-- Libraries -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/plugin/textcomplete/jquery.textcomplete.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/plugin/comments/js/jquery-comments.js"></script>

<!-- 공통 Header/Footer include시 jquery.min.js와 충돌이슈 발생  -->
<!-- 별도의 Header/Footer 파일 생성하여 include -->
<c:import url="../inc/help_comm_read_inc/help_comm_read_header.jsp" />

<!-- help.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/help.css" />


<!-- Init jquery-comments -->
</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content">
			<div id="comm_upper">
				<p class="sub_title">커뮤니티</p>
				<p>직장내 고민을 서로에게 털어놓고 직장생활 노하우 나눔터!</p>
			</div>

			<div id="read_button_group">
				<div id="read_buttons1" class="input-group">
					<span class="btns_padding"><button type="button"
							id="writings" class="btn btn-warning">목록</button></span>
				</div>
				<div id="read_buttons2" class="pull-right">
					<span class="links"><a
						href="${pageContext.request.contextPath}/help_ajax/help_comm_edit.do?postNo=${output.postNo}"
						class="help_read_a">수정</a></span>&nbsp; <span class="links"><a
						href="#" id="deletePost" data-postNo="${output.postNo}"
						data-postTitle="${output.postTitle}"
						data-postSubtitle="${output.postSubtitle}" class="help_read_a">삭제</a></span>
				</div>
			</div>


			<div id="content">
				<div id="content_group">
					<div id="content_title">
						<h1>
							<span>[${output.postSubtitle}]</span>${output.postTitle}</h1>
					</div>
					<span id="content_nick" class="content_sub">${output.nickname}</span>
					<span id="content_date" class="content_sub">${output.postRegdate}</span>
				</div>


				<div id="content_body">${output.postContent}</div>
			</div>

			<!-- <div id="comments-container"></div>-->

			<div>
				<label for="content">comment</label>
				<form name="commentInsertForm">
					<div class="input-group">
						<input type="hidden" name="postNo" value="${output.postNo}" /> <input
							type="text" class="form-control" id="commContent"
							name="commContent" placeholder="내용을 입력하세요." /> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button"
								name="commentSubmit">등록</button>
						</span>
					</div>
				</form>
			</div>

			<div id="comment_list">
				<c:choose>
					<%-- 조회결과가 없는 경우 --%>
					<c:when test="${output_comm == null || fn:length(output_comm) == 0}">						
							조회결과가 없습니다.						
					</c:when>
					<%-- 조회결과가 있는  경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output_comm}" varStatus="status">

							<%-- 상세페이지로 이동하기 위한 URL --%>
							<c:url value="/help_ajax/help_comm_read.ajax" var="viewUrl">
							</c:url>
							<%-- 추후에 추가할 예정임 --%>

							<div style="cursor: pointer;"
								onClick=" location.href='${viewUrl}'">
								<div class = "pull-right" >
									<span>${item.nickname}</span>
									<span>${item.commRegdate}</span>
								</div>
								<div>
									${item.commContent}
								</div>
								<div class = "pull-left">
									${item.commUpCount }
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<div></div>

	<!-- 공통 Header/Footer include시 jquery.min.js와 충돌이슈 발생  -->
	<!-- 별도의 Header/Footer 파일 생성하여 include -->
	<c:import url="../inc/help_comm_read_inc/help_comm_read_footer.jsp" />

	<!-- Handlebar 템플릿 코드 -->
	<script id="comm-list-tmpl" type="text/x-handlebars-template">
	{{#each item}}
          <div>
								<div>
									{{nickname}}
									{{commRegdate}}
								</div>
								<div>
									{{commContent}}
								</div>
								<div>
									{{commUpCount}}
								</div>
							</div>		
	{{/each}}
	</script>
	<!--   <script src="../assets/js/jquery.min.js"></script> 충돌나는 것 같음 -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

	<!--  AjaxHelper -->
	<script
		src="${pageContext.request.contextPath}/assets/ajax/ajax_helper.js"></script>

	<script type="text/javascript">
     
	  $(function() {
		  var source = $("comm-list-tmpl").html();   // 템플릿 코드 가져오기
          var template = Handlebars.compile(source);  // 템플릿 코드 컴파일
          var result = template(json);    // 템플릿 컴파일 결과물에 json 전달
          $("#comment_list").append(result);      // 최종 결과물을 #list 요소에 추가한다.
		  
		  
			 $("#writings").click(function() {
	          window.location.href = "${pageContext.request.contextPath}/help_ajax/help_comm.do";
	        });
			 
			 $("#deletePost").click(function(e) {
				 e.preventDefault();	//링크 클릭에 대한 페이지 이동 방지
				 
				 let current = $(this);	//이벤트가 발생한 객체 자신 --> <a>태그
				 console.log(current);
				 let postNo = "${output.postNo}";
				 let target = "(" +postNo+ ") 의 게시글";
				 
				 //삭제확인
				 if(!confirm("정말 " +target+ "을 삭제하겠습니까?")) {
					 return false;
				 } 
				 
				console.log(target);
				 
				 //delete 메서드를 Ajax 요청 --> <form> 전송이 아니므로 직접 구현한다.
				 $.delete("${pageContext.request.contextPath}/help",{
					 "postNo":postNo
				 }, function(json){
					 if(json.rt == "OK") {
						 alert("삭제되었습니다.");
						 //삭제 완료후 목록 페이지로 이동
						 window.location = "${pageContext.request.contextPath}/help_ajax/help_comm.do"
					 }
			 });
			 });
		 
			 /** 이전글/다을 글 버튼은 나중에.....ㅠ
			 $("#next_writing").click(function() {
	    	  var count = ${output.postNo};
	    	  console.log(count);
	    	  
	    	  if(count == 1000000 ) { alert("마지막 페이지 입니다."); return; }
	    	  window.location.href = "${pageContext.request.contextPath}/help_ajax/help_comm_read.do?postNo="+ ${nextNum};
			 });
			 
	      
		   $("#prev_writing").click(function() {
	    	  var count = ${output.postNo};
	    	  
	    	  if(count == 1) { alert("첫번째 페이지 입니다."); return; }	
	    	  window.location.href = "${pageContext.request.contextPath}/help_ajax/help_comm_read.do?postNo="+ ${prevNum};
		   });
		   */ 	
			
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
          
          /**
          //댓글과 수정과 관련된 script문들
          var saveComment = function(data) {

              // Convert pings to human readable format
              $(Object.keys(data.pings)).each(function(index, userId) {
                  var fullname = data.pings[userId];
                  var pingText = '@' + fullname;
                  data.content = data.content.replace(new RegExp('@' + userId, 'g'), pingText);
              });

              return data;
          }
          $('#comments-container').comments({
              profilePictureURL: '${pageContext.request.contextPath}/img/common/reward_icon_influencer.png',
              currentUserId: 1,
              roundProfilePictures: false,
              textareaRows: 1,
              enableAttachments: false,
              enableHashtags: false,
              enablePinging: false,
              scrollContainer: $(window),
          
              getComments: function(success, error) {
                  setTimeout(function() {
                      success(commentsArray);
                  }, 500);
              },
              postComment: function(data, success, error) {
                  setTimeout(function() {
                      success(saveComment(data));
                  }, 500);
              },
              putComment: function(data, success, error) {
                  setTimeout(function() {
                      success(saveComment(data));
                  }, 500);
              }
          });
        });
	  
	  */
        </script>
</body>
</html>
