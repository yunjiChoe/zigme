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
    <form>
        <div class="input-group input-group-lg">
            <input type="text" class="form-control editor_title" name="editor_title" placeholder="제목을 입력하세요." />
            <span class="input-group-addon">
                <select class="editor_cate" name="mal">
                <option value="">말머리</option>
                <option value="학생">도움</option>
                <option value="회사원">꿀팁</option>
                <option value="기타">넋두리</option>
            </select>
            </span>
        </div>
        <hr />
        <div id="editor" data-editor="ClassicEditor" data-collaboration="false">
        <main>
            <div class="centered">
                <div class="row row-editor">
                    <div class="editor">
                        
                            <figure class="image image-style-side">
                            </figure>
                    </div>
                </div>
            </div>
        </main>
        </div>
    <br />
    <div class="input-group" id="write_buttons">
    <button type="button" id="write_cancel" class="btn btn-warning">취소</button>
    <span>&nbsp;</span>
    <!--  추후 submit 으로 버튼 수정필요 -->
    <button type="button" id="write_submit" class="btn btn-info">등록</button> 
    </div>
    </form>
	</div>
	
    <c:import url="../inc/footer.jsp" />
    
    <script src="${pageContext.request.contextPath}/plugin/editor/js/ckeditor.js"></script>

    <script>ClassicEditor
      .create( document.querySelector( '.editor' ), {

        toolbar: {
          items: [
            'bold',
            'italic',
            'underline',
            '|',
            'undo',
            'redo',
            '|',
            'alignment',
            'fontFamily',
            'fontSize',
            'fontBackgroundColor',
            'fontColor'
          ]
        },
        language: 'ko',
        licenseKey: '',


      } )
      .then( editor => {
        window.editor = editor;
      } )
      .catch( error => {
        console.error( 'Oops, something went wrong!' );
        console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
        console.warn( 'Build id: movktqy00cii-6cl6jsxaig66' );
        console.error( error );
      } );
  </script>
  
  <script type="text/javascript">
  $(function() {
	  
	  $("#write_submit").click(function() {
	      alert("등록되었습니다.");
	      window.location.href = "${pageContext.request.contextPath}/help/help_comm";
	  });
	  
	  $("#write_cancel").click(function() {
	      window.location.href = "${pageContext.request.contextPath}/help/help_comm";
	  });
	  
  });
  
  </script>
  
</body>
</html>