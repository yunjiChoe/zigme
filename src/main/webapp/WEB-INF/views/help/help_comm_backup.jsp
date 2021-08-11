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

  <!-- bootstrap -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
  
  <!-- help.css -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/help.css" />

  <!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
  <c:import url="../inc/header.jsp" />

<style type="text/css">

tr {
	cursor: pointer;
}

</style>

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

    <form id="comm_middle" class="form-inline pull-right">
       <div class="form-group">
           <select id="parent" class="form-control formcon-comm">
             <option value="">말머리</option>
             <option value="202010">도움</option>
             <option value="202011">꿀팁</option>
             <option value="202012">넋두리</option>
           </select>
       </div>
       <div class="form-group">
         <input type="text" name="title" id="title" placeholder="내용을 입력해주세요" />
       </div>
       <div class="form-group">
        <a href="#"><span class="glyphicon glyphicon-search"></span></a>
       </div>
    </form>

    <table class="help_comm_table">
                <thead>
                    <tr class="info help_comm_point">
                        <th >NO.</th>
                        <th >제목</th>
                        <th >글쓴이</th>
                        <th >작성일</th>
                        <th >추천</th>
                        <th >조회</th>
                    </tr>
               </thead>
               <tbody id="comm_table"></tbody>
               
            </table>
			<form id="comm_bottom help_comm_point" class="form-inline">
       		<div class="bottom_btns">
              <ul class="pagination">
              	<li class="disabled"><a href="#">&laquo;</a></li>
              	<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
              	<li><a href="#">2</a></li>
              	<li><a href="#">3</a></li>
              	<li><a href="#">4</a></li>
              	<li><a href="#">5</a></li>
              	<li><a href="#">&raquo;</a></li>              	
              </ul>
              
              	<button type="button" id="button_w" class="pull-right" onclick="writePage()">글쓰기</button>
       			</div>
    		</form>
    	</div>
	</div> <!-- //container 종료 -->
	
	<c:import url="../inc/footer.jsp" />
	
	<script type="text/javascript">
		function writePage() {
			window.location.href = "${pageContext.request.contextPath}/help/help_comm_write";
		}

		$(function() {
			
			var comm_txt = [""];
			var result = "";
			
			$(".writings").mouseover(function() {
				$(this).css("background-color", "#eee")
			});
			$(".writings").mouseout(function() {
				$(this).css("background-color", "#fff")
			});

			/*
			 *  JSON파일을 읽어와 각종 데이터를 세팅하는 함수 
			 */
			function data_load(count) {
				var notice_is = "";
				
				// 게시글 본문
				$.ajax({
					async : false, // 데이터를 읽어올 때까지 다음으로 넘어가지 않는다.
					url : '${pageContext.request.contextPath}/assets/data/comm_read.json',
					method : 'get',
					data : {},
					dataType : 'JSON',
					success : function(req) {
						comm_txt = req;
					},
					error : function() {
						alert("일시적인 오류가 발생하였습니다.");
					}
				});

			
			for(var i=0; i<count; i++) {
			
			if( comm_txt[i].user_nick == "관리자") notice_is = "hightlight";
			else notice_is = "";
			
			result += "<tr class='" + comm_txt[i].writer + "' onClick=\"location.href='${pageContext.request.contextPath}/help/help_comm_read?no=" + comm_txt[i].page_no + "'\">" 
				+ "<td>" + comm_txt[i].no + "</td><td class='content_left " + notice_is +  "'>" + comm_txt[i].title + "<span> (" + comm_txt[i].comm_count + ")</span></td>" 
				+ "<td>" + comm_txt[i].user_nick + "</td><td>" + comm_txt[i].date + "</td><td>" + comm_txt[i].up_count + "</td><td>" + comm_txt[i].view_count + "</td></tr>"
			}			
			
			$("#comm_table").html(result);
	}
			

			/** 함수 호출부 */
			data_load(13); // 페이지 JSON데이터 load 
		
	});
	</script>

</body>
</html>