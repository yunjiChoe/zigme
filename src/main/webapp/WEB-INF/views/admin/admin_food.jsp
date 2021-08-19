<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
</style>


</head>
<body>
   <div class="container">
      <!--  include :: container 바로 아래에 있어야합니다 -->      
      <c:import url="../inc/admin.jsp" />

      <p class="top_title">음식 DB 관리</p>
      
      <form method="get" action="${pageContext.request.contextPath}/admin/admin_food/list.do">
      	<label for="keyword">음식이름: </label>
      	<input type="search" name="keyword" placeholder="음식이름 검색" value="${keyword}" />
      	<button type="submit" id="searchfood">검색</button>
      </form>
         <!-- <table id="food" align="center">
            <thead>
               <tr>
                  <th>항목</th>
                  <th>음식명</th>
                  <th>업종명</th>
                  <th>선호날씨</th>
                  <th>건강상태정보</th>
                  <th>이미지</th>
                  <th>추가하기</th>
               </tr>
            </thead>
         
            <tbody>
               <tr class="food_category">
                  <td class=food_rowNumber>입력</td>
                  <td class="food_name"><input type='text' id="foodNameBox" class='input' name="food"></td>
                  <td class="food_categoryName"><select class="foods" name="by_category">
                        <option value="category_none">--선택--</option>
                        <option value="koreanfood">한식</option>
                        <option value="flourbasedfood">분식</option>
                        <option value="westernfood">양식</option>
                        <option value="japanesefood">일식</option>
                        <option value="chinesefood">중식</option>
                        <option value="etc">그 외</option>
                  </select></td>
                  <td><select class='weathers' name="by_weather">
                        <option value="weather_none">--선택--</option>
                        <option value="sunny">맑음</option>
                        <option value="cloudy">흐림</option>
                        <option value="rainy">비</option>
                        <option value="snowy">눈</option>
                        <option value="air">대기오염</option>
                  </select></td>
                  <td>
                     <select class="conditions" name="by_condition">
                           <option value="condition_none">--선택--</option>
                           <option value="cold">감기몸살</option>
                           <option value="indigestion">소화불량</option>
                           <option value="hangover">숙취해소</option>
                           <option value="goodforhealth">기력보충</option>
                           <option value="diet">다이어트</option>
                     </select>
                  </td>
                  <td class="food_Image">
                     <form action="upload" id="uploadForm" method="post"
                        enctype="multipart/form-data"> -->
                        <!--  display: none으로 변경하여 버튼 커스텀  -->
                        <!-- <input type="file" id="fileInput" name="file"
                           style="display: none" /> -->
                        <!-- 커스텀 버튼 추가 코드 -->
                        <!-- <div class="addfile" onclick="onclick=document.all.file.click()">
                           <div class="addBtn">첨부</div>
                        </div>
                     </form> -->
                     <!-- 파일 이름 표기 -->
                     <!-- <div class="file_name">
                        <span> <input type="text" name="uploaded" id="uploaded"
                           value="" readonly>
                        </span>
                     </div> 
                  </td>
                  <td><button type='submit' class='add btn btn-primary btn-sm'>추가</button></td>

               </tr>
            </tbody>
         </table>-->
            
            <hr/>
            <br>
            
         <table id="food_List">
            <thead>
               <tr>
                  <th width="50">번호</th>
                  <th width="150">음식 이름</th>
                  <th width="100">업종</th>
                  <th width="120">선호날씨</th>
                  <th width="180">건강상태정보</th>
                  <th width="100">삭제여부(Y/N)</th>
               </tr>
            </thead>
            <tbody id= "food_List_body">
            	<c:choose>
            		
            		<c:when test="${output == null || fn:length(output) == 0}">
            			<tr>
            				<td colspan="6" align="center">조회결과가 없습니다.</td>
            			</tr>
            		</c:when>
            		
            		<c:otherwise>
            			
            			<c:forEach var="item" items="${output}" varStatus="status">
            				
            				<c:set var="foodName" value="${item.foodName}" />
            				
            				
            				<c:url value="admin_food/view.do" var="viewUrl">
            					<c:param name="foodNo" value="${item.foodNo}" />
            				</c:url>
            				
            				<tr>
            					<td align="center">${item.foodNo}</td>
            					<td align="center"><a href="${viewUrl}">${foodName}</a></td>
            					<td align="center">${item.foodCategory}</td>
            					<td align="center">${item.foodWeather}</td>
            					<td align="center">${item.foodCondition}</td>
            					<td align="center">${item.delFoodflag}</td>
            				</tr>            				
            			</c:forEach>
            		</c:otherwise>
            	</c:choose>
            </tbody>
         </table>

   </div>
   <!-- //container 종료 -->
   <!-- 테스트 -->


   <!-- include :: Javascript 파일 포함 
      <script src="../assets/js/jquery.min.js"></script>
      <script src="../assets/js/bootstrap.min.js"></script> 
    -->   
   <c:import url="../inc/footer.jsp" />

   <script type="text/javascript">
	
  <%--//각각의 <select> id값을 'lower_food'+index로 구분하기 위해 인덱스 사용
      var foodName = '';   
      //추가버튼을 누르면 추가될 각각의 행들을 result라는 변수에 저장
      var result = '';
      
      $(function() {
         var filename = '';
         var index = 0;
         
         
         // 추가할 행의 첫번째 텍스트박스에 포커스 지정
         $("#foodNameBox").focus();

         /** 추가버튼 클릭시 */
         // `on` 함수는 앞으로 추가될 요소와
         // 처음부터 존재하고 있는 요소 모두에게 이벤트를 적용한다.
         $(document).on("click", ".add", function() {
            foodName = document.getElementById('foodNameBox').value;
            console.log(foodName);
            
            //업종별 select 매핑하기
            let foodSelect = document.querySelector('.foods');
            let value_food = foodSelect.options[foodSelect.selectedIndex].value;
            console.log(value_food);
            
            //날씨별 select 매핑하기
            let weatherSelect = document.querySelector('.weathers');
            let value_weather = weatherSelect.options[weatherSelect.selectedIndex].value;
            console.log(value_weather);
            
            //컨디션별 select 매핑하기
            let conditionSelect = document.querySelector('.conditions');
            let value_condition = conditionSelect.options[conditionSelect.selectedIndex].value;
            console.log(value_condition);
            
            //추가되는 행들의 태그들
            var result = "<td>" +(index+1)+ "</td><td>" +foodName+ "</td><td><select class= 'foods' name=by_category'>"
            +"<option value='category_none'>--선택--</option><option value='koreanfood'>한식</option>"
            +"<option value='flourbasedfood'>분식</option><option value='westernfood'>양식</option>"
            +"<option value='japanesefood'>일식</option><option value='chinesefood'>중식</option><option value='etc'>그 외</option>"
            +"</select></td>"
            +"<td><select class= 'weathers' name='by_weather'><option value='weather_none'>--선택--</option><option value='sunny'>맑음</option>"
            +"<option value='cloudy'>흐림</option><option value='rainy'>비</option><option value='snowy'>눈</option></select></td>"
            +"<td><select class= 'conditions' name='by_condition'><option value='condition_none'>--선택--</option><option value='cold'>감기몸살</option>"
            +"<option value='indigestion'>소화불량</option><option value='hangover'>숙취해소</option><option value='goodforhealth'>기력보충</option>"
            +"<option value='diet'>다이어트</option></select></td>"
            +"<td><form action='upload' id='uploadForm' method='post' enctype='multipart/form-data'>"
            +"<input type='file' id='fileInput' name='file' style='display: none'/><div class='addfile' onclick='onclick=document.all.file.click()'>"
            +"<div class='addBtn'>첨부</div></div></form><div class='file_name'><span><input type='text' name='uploaded' id='uploaded' value='' readonly>"
            +"</span></div></td>"
            +"<td><button class= 'edit btn btn-warning btn-sm'>수정</button><button class='remove btn btn-danger btn-sm'>삭제</button></td>";   
            
            //선택한 <option>별로 selected속성 지정하기
            var tr = $("<tr>").html(result);
            $("#food_List_body").append(tr);
            
            //상위테이블에서 선택한 업종명 selected로 바꿔주기
            $("#food_List_body").children().eq(index).children().eq(2).children().val(value_food).prop("selected", true);
            
            //상위테이블에서 선택한 날씨 selected로 바꿔주기
            $("#food_List_body").children().eq(index).children().eq(3).children().val(value_weather).prop("selected", true);
            
            //상위테이블에서 선택한 컨디션 selected로 바꿔주기
            $("#food_List_body").children().eq(index).children().eq(4).children().val(value_condition).prop("selected", true);
            
            console.log(filename);
            
            //상위테이블에서 첨부한 이미지 파일명을 하위 테이블에서 출력하기
            $("#food_List_body").children().eq(index).children().eq(5).children().eq(1).children().children().val(filename);
            
            //추가된 행중 드롭다운들 비활성화
            $("#food_List_body").find("select").attr("disabled", "true");
            
            //추가된 행중 첨부파일버튼 비활성화
            $("#food_List_body").find(".addBtn").attr("disabled", "true");
            index++;
            
            $("#foodNameBox").val('');
            
               });

         /** 수정버튼 클릭시 */
         $(document).on("click",".edit", function() {
        	 
        	 	  //첨부파일 버튼 비활성화 해제	
                  // 드롭다운요소 속성 비활성화 해제
                  $(this).closest("tr").find("select").removeAttr(
                        "disabled");
                  $(this).attr("class", "save btn btn-success btn-sm");
                  $(this).html("저장");
                  //선택한 행 영역 가시화
                  $(this).parent().parent().css("background-color",
                        "#d9f2fc");
                  // #foodNameBox의 테두리 다시 지정
                  $(this).parent().parent().children().find(
                        "#foodNameBox").css("border",
                        "2px solid #d5d5d5");
               });

         /** 저장버튼 클릭시 */
         $(document).on("click",".save",function() {
        		  // 드롭다운요소 속성 비활성화
        	 	  $(this).closest("tr").find("select").attr("disabled",
                  		true);
        	 	//선택한 행 영역 가시화
                  $(this).parent().prev().children("label").css("color",
                        "#808080");
                  $(this).attr("class", "edit btn btn-warning btn-sm");
                  $(this).html("수정");
                  //수정 중인 행 하늘색 배경으로 영역 가시화한 것 해제
                  $(this).parent().parent().css("background-color", "");
                  // #foodNameBox의 테두리 다시 없애주기
                  $(this).parent().parent().children().find(
                        "#foodNameBox").css("border", "0");
               });
         
         /** 삭제버튼 클릭시 */
         $(document).on("click", ".remove", function() {
            // 클릭된 버튼의 부모의 부모인 행을 제거한다.
            $(this).parent().parent().remove();
            counter--;
         });
         
         
         // 파일명 textbox에 띄우기 --------------------------------------------------------------------
            // input 요소 중에 name이 file 인 요소의 값이 바뀌었을때 
            $("input[name=file]").on("change", function() {      
               
               $('#uploaded').val('');                                  // 파일 이름 추출 전 초기화
               
               if(window.FileReader) {                         
                  filename = $(this)[0].files[0].name;                  // 최근 브라우저의 파일명 추출         
               } else { // old IE
                  filename = $(this).val().split('/').pop().split('\\').pop(); // 구 브라우저 파일명 추출
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
                  var fileSize = document.getElementById("fileInput").files[0].size;   // 파일 사이즈 get
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
      }); --%>
   </script>

</body>
</html>