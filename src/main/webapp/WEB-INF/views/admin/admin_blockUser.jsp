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
<html lang="ko">

<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />

<style type="text/css">

h3 {
 	margin-left: 200px;
 }


#blockUser_reportList {
	border-left: none;
	border-right: none;
	width: 800px;	
}

#blockUser{
	width: 500px;
	/* 테이블의 바깥 테두리 */
	border: 1px solid #d5d5d5;
	/* 테이블 테두리 간의 간격을 제거하여 두 줄로 보이는 현상을 방지 */
	border-collapse: collapse;
}

#blockUserList {
	width: 500px;
	margin: auto;
	/* 테이블의 바깥 테두리 */
	border: 1px solid #d5d5d5;
	/* 테이블 테두리 간의 간격을 제거하여 두 줄로 보이는 현상을 방지 */
	border-collapse: collapse;
}

#blockUser_reportList th, #blockUser_reportList td {
	/* 테이블의 안쪽 테두리 */
	border: 1px solid #d5d5d5;
	text-align: center;
	margin-bottom: none;
}

#blockUser th, #blockUser td {
	/* 테이블의 안쪽 테두리 */
	border: 1px solid #d5d5d5;
	width: 33.33%;
	text-align: center;
}
#blockUserList th, #blockUserList td {
	/* 테이블의 안쪽 테두리 */
	border: 1px solid #d5d5d5;
	width: 33.33%;
	text-align: center;
} 



th {
	background-color: #eee;
	padding: 5px 0;
	
}

.input {
	text-align: center;
	border: 0;
	width: 100%;
	height: 30px;
	display: block;
}

/* 커서 모양 변경되는 것 방지*/
#category_rowNumber {
	cursor: default;
}

/*blockUser ID 입력박스 */
#blockUserIdBox {
	position: relative;
	margin: auto;
	background: #ffffff;
	width: 110px;
	border: 2px solid #d5d5d5;
	border-radius: .25em;
}

/* 줄바뀜 방지용 display속성 변경 */
.div_add, .div_del, .movePage {
	display: inline-block;
	text-decoration: underline;
}

/* 제목/내용 text-overflow시 생략 */
#blockUser_reportList .movePage {
	overflow:hidden; 
	text-overflow:ellipsis; 
	white-space:nowrap;
	width: 300px;
	vertical-align: middle;
}



</style>

</head>

<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->		
		<c:import url="../inc/admin.jsp" />
		
			<p class="top_title">block 유저 관리</p>
			
		<h3>신고 게시글/덧글 관리</h3>
		<table class="table" id="blockUser_reportList" align="center">
			<thead>
				<tr>
					<th class="th1">No.</th>
					<th>유형</th>
					<th>제목/내용</th>
					<th>ID</th>
					<th>신고날짜</th>
					<th>block 처리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="td1">1</td>
					<td>게시글</td>
					<td onClick= "location.href='${pageContext.request.contextPath}/help/help_comm_read'"> <div class="movePage">오는 길에 이런걸 봤습니다.</div></td>
					<td class="reportList_Id">taehyunKim12</td>
					<td>21-05-08</td>
					<td><div class="div_add">추가</div>/<div class="div_del">취소</div></td>
				</tr>
				<tr>
					<td class="td1">2</td>
					<td>댓글</td>
					<td onClick= "location.href='${pageContext.request.contextPath}/help/help_comm_read'"> <div class="movePage">아놔...... 그러니까 오늘 그 상사 녀석이 저한테 이런</div></td>
					<td class="reportList_Id">dasomAhn23</td>
					<td>21-05-07</td>
					<td><div class="div_add">추가</div>/<div class="div_del">취소</div></td>
				</tr>
				<tr>
					<td class="td1">3</td>
					<td>게시글</td>
					<td onClick= "location.href='${pageContext.request.contextPath}/help/help_comm_read'"> <div class="movePage">랄랄라룰ㄹ룰루닝기리링링</div></td>
					<td class="reportList_Id">heesunJung34</td>
					<td>21-05-07</td>
					<td><div class="div_add">추가</div>/<div class="div_del">취소</div></td>
				</tr>
			</tbody>
		</table>
		<br>
		<hr />
		
		<h3>block 유저 추가</h3>
		<table class="table" id="blockUser" align="center">
			<thead>
				<tr>
					<th>항목</th>
					<th>ID</th>
					<th>추가하기</th>
				</tr>
			</thead>
			<tbody>
				<tr class="blockUser_category">
					<td id=category_rowNumber>입력</td>
					<td class="category_name">
					<input type='text' id="blockUserIdBox" class='input'/>
					</td>
					<td><button type='button' id= "add_button"
					 class='add btn btn-primary btn-sm' height= "20">추가</button>
					</td>
				</tr>
				</tbody>
		</table>
			
		<br>
		<hr />
		
		<h3>block 유저 리스트</h3>
		<table class="table" id="blockUserList">
			<thead>	
				<tr>
					<th>번호</th>
					<th>ID</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id= "blockUserList_body">
			</tbody>
		</table>
	</div>
	<!-- //container 종료 -->



	<!-- include :: Javascript 파일 포함 
      <script src="../assets/js/jquery.min.js"></script>
      <script src="../assets/js/bootstrap.min.js"></script>
    -->	
	<c:import url="../inc/footer.jsp" />
	<script type="text/javascript">
	
	var delete_buttons = "<button type='button' class= 'delete_buttons'"
 						+"class='btn btn-success btn-sm' height= '20'>삭제</button>";
	
		$(function() {
			/** 제목/내용 마우스 오버시 커서 모양 변경 */
          $(".movePage").mouseover(function() {
        	  $(this).css("cursor", "pointer")
        	  });
          $(".movePage").mouseout(function() {
        	  $(this).css("cursor", "default")
        	  });
          
          /** block처리 추가 마우스오버시 커서 모양 변경 */
          $(".div_add").mouseover(function() {
        	  $(this).css("cursor", "pointer")
        	  });
          $(".div_add").mouseout(function() {
        	  $(this).css("cursor", "default")
        	  });
          
          /** block처리 취소 마우스오버시 커서 모양 변경 */
          $(".div_del").mouseover(function() {
        	  $(this).css("cursor", "pointer")
        	  });
          $(".div_del").mouseout(function() {
        	  $(this).css("cursor", "default")
        	  });
          
          /** block처리 취소(링크) 클릭시 해당 게시글/덧글의 신고 내역 삭제 */
          $(".div_del").click(function() {
				$(this.closest("tr")).remove();
			});
			
          /** block처리 추가(링크) 클릭시 해당 게시글/덧글의 신고 내역 하위 테이블에 추가 */
			$(document).on("click",".div_add", function() {
				var result = "<td>1</td><td>hyeony</td><td>" +delete_buttons+ "</td>"
				
				var tr = $("<tr>").html(result);
				 $("#blockUserList_body").append(tr);
				 
				 /** 하위 테이블에 추가시 상위 테이블 해당 행 삭제*/
				 $(this.closest("tr")).remove();
			});
          
			/** block처리 추가(버튼) 클릭시 해당 게시글/덧글의 신고 내역 하위 테이블에 추가 */
			 $(document).on("click","#add_button", function(){
				var id = document.getElementById('blockUserIdBox').value;
				
				if(id == null || id == '') {
					alert("id를 입력하세요");
					return;
				}
				
				var result = "<td>1</td><td>" +id+ "</td><td>" +delete_buttons+ "</td>"
				var tr = $("<tr>").html(result);
				 $("#blockUserList_body").append(tr);
				 
				$("#blockUserIdBox").val('');
			});
			
			$(document).on("click", ".delete_buttons", function(){
				$(this.closest("tr")).remove();
			});
        });
		
	</script>
</body>

</html>