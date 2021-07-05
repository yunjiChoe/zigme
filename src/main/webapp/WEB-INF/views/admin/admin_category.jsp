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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/admin_style.css" />

<style type="text/css">
</style>

</head>

<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->		
		<c:import url="../inc/admin.jsp" />

		<p class="top_title">업종 관리</p>
		<table id="category" align="center">
			<thead>
				<tr>
					<th>항목</th>
					<th>업종명</th>
					<th>이미지</th>
					<th id="admin_category">추가하기</th>
				</tr>
			</thead>
			<tbody>
				<tr class="category_category">
					<td class=category_rowNumber>입력</td>
					<td class="category_name">
						<input type='text' id="categoryNameBox" class='category_input' autofocus></td>
					<td class="category_image">
						<form action="upload" id="uploadForm" method="post" enctype="multipart/form-data">
						<!--  display: none으로 변경하여 버튼 커스텀  -->
					<input type="file" id="fileInput" name="file" style="display: none"/>
						<!-- 커스텀 버튼 추가 코드 -->
						<div class="addfile" onclick="onclick=document.all.file.click()">
							<div class="addBtn">첨부</div>
						</div>
				</form>
					
					<!-- 파일 이름 표기 -->
					<div class="file_name">
						<span>
							<input type="text" name="uploaded" id="uploaded" value="" readonly>
						</span>
					</div>
						<!-- // 파일 이름 표기 -->
					</td>
					<td><button type='button' class='add btn btn-primary btn-sm'>추가</button>
					</td>
				</tr>
				<tr id=category_emptyTr>
					<td class=category_emptyTd></td>
					<td class=category_emptyTd></td>
					<td class=category_emptyTd></td>
					<td class=category_emptyTd></td>
				</tr>
				<tr id="categoryList">
					<th>번호</th>
					<th>업종명</th>
					<th>이미지</th>
					<th>수정/삭제</th>
				</tr>
				<tr id=categoryList_emptyTr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
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
		$(function() {
			var counter = 0;

			// 파일명 textbox에 띄우기 --------------------------------------------------------------------
			// input 요소 중에 name이 file 인 요소의 값이 바뀌었을때 
			$("input[name=file]").on("change", function() {		
				
				$('#uploaded').val(''); 											// 파일 이름 추출 전 초기화
				
				if(window.FileReader) { 								
					var filename = $(this)[0].files[0].name;						// 최근 브라우저의 파일명 추출			
				} else { // old IE
					var filename = $(this).val().split('/').pop().split('\\').pop(); // 구 브라우저 파일명 추출
				}
				
				// 파일 확장자 확인 -----------------------------------------------------------------------------
				var ext = filename.split('.').pop().toLowerCase();
				
				// 업로드 가능한 확장자 배열처리, 이 외의 확장자에 대해 알람 창 띄우기
				if($.inArray(ext, ['jpg', 'jpeg', 'gif', 'png']) == -1) {
					alert('jpg, gif, png 파일만 등록이 가능합니다.');
					$('#fileInput').val('');
					return;
				}
				
				// 파일 크기 확인
				if (filename != ''){
					var size = 3;  
					var fileSize = document.getElementById("fileInput").files[0].size;	// 파일 사이즈 get
					var maxSize = size * 1024 * 1024 // 3MB
					
					if (fileSize > maxSize) {
						alert("첨부파일 사이즈는 " + size + "MB 이내로 등록 가능합니다.");
						$('#fileInput').val('');
						return;
					}
				}
				
				// 추출한 파일명 삽입
				$("#uploaded").val(filename);		
			
			});

			/** 추가버튼 클릭시 */
			// `on` 함수는 앞으로 추가될 요소와
			// 처음부터 존재하고 있는 요소 모두에게 이벤트를 적용한다.
			$(document).on(
					"click",
					".add",
					function() {
						counter++;

						// 행 추가시 처음 있던 행은 안보이게 처리
						$("#categoryList_emptyTr")
								.attr("style", "display:none");
						
						// 복제할 요소를 찾는다.
						var item = $(this).parents('.category_category');
						
						// 찾은 요소를 복제한다.
						var clone = item.clone();
						
						// 복제된 요소를 #category_emptyListTr 뒤에 삽입한다.
						var clonedRow = clone
								.insertAfter("#categoryList_emptyTr");
						
						// 복제된 tr의 자식요소 중 첫 번째 td의 내용 비우기
						clone.children().first().empty();
						
						// 비워진 첫 번째 td에 새로운내용(순번) 추가하기
						clone.children().first().prepend(counter);
						
						// 순번td의 커서 text로 되는 것 기본값으로 변경해주기
						clone.children().first().css("cursor", "default");
						
						// 복제된 tr의 자식요소 중 마지막 td의 내용 비우기
						clone.children().last().empty();
						
						// 마지막 td에 추가할 내용 생성
						var generateEditBtn = $("<button>수정</button>");
						var generateRemoveBtn = $("<button>삭제</button>");
						
						// 생성한버튼에 속성 추가
						generateEditBtn.attr("class",
								"edit btn btn-warning btn-sm");
						generateRemoveBtn.attr("class",
								"remove btn btn-danger btn-sm");
						
						// 비워진 마지막 td에 새로운내용(수정,삭제버튼) 추가하기
						clone.children().last().prepend(generateEditBtn);
						clone.children().last().append(generateRemoveBtn);
						
						// 추가버튼 클릭시 입력받은 행의 값 가져오기
						$('.category_category').find("input").val();
						
						//복제한 행의 자식요소 중 input요소 테두리 제거하기
						$(clone).children().children("input")
								.css("border", "0");
						$("#categoryImage_add").css("cursor", "default");
						$("#uploaded").css("border", "none");
						
						//추가버튼 클릭시 기존 행의 내용 모두 비우기
						$(".category_category").find("input").empty();
					});

			/** 수정버튼 클릭시 */
			$(document).on(
					"click",
					".edit",
					function() {
						// 인풋요소들 다시 활성화
						$(this).parent().prev().prev().children().removeAttr(
								"disabled");
						$(this).parent().prev().children().eq(0).removeAttr(
								"style");
						$(this).parent().prev().children().eq(0).removeAttr(
								"disabled");
						$(this).parent().prev().children().eq(0).eq(0)
								.removeAttr("disabled");
						
						//수정버튼 다시 저장 버튼으로 바꿔주기
						$(this).attr("class", "save btn btn-success btn-sm");
						$(this).html("저장");
						
						// 클릭한 버튼이 속한 행 하늘색 배경으로 영역 가시화
						$(this).parent().parent().css("background-color",
								"#d9f2fc");
						// #categoryNameBox의 테두리 다시 지정해주기
						$(this).parent().parent().children().find(
								"#categoryNameBox").css("border",
								"2px solid #d5d5d5");
					});

			/** 저장버튼 클릭시 */
			$(document).on(
					"click",
					".save",
					function() {
						// 인풋요소들 비활성화 하기
						$(this).parent().prev().prev().children().attr(
								"disabled", "true");
						$(this).parent().prev().children().eq(0).css("color",
								"#808080");
						$(this).parent().prev().children().eq(0).css("cursor",
								"default");
						
						// 버튼 클래스 속성 추가
						$(this).attr("class", "edit btn btn-warning btn-sm");
						// 버튼 내용 바꿔주기
						$(this).html("수정");
						// 선택한 행 영역 가시화
						$(this).parent().parent().css("background-color",
								"#ffffff");
						//#categoryNameBox의 테두리 다시 없애주기
						$(this).parent().parent().children().find(
								"#categoryNameBox").css("border", "0");
					});

			/** 삭제버튼 클릭시 */
			$(document).on("click", ".remove", function() {
				// 클릭된 버튼의 부모의 부모인 행을 제거한다.
				$(this).parent().parent().remove();
				counter--;
			});
		});
	</script>
</body>

</html>