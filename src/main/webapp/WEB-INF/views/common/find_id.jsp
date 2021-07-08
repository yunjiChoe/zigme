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
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>직메 Zigme</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
    
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
  
	<!-- common.css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
<style type="text/css">
    body {
        margin-top: 100px;
    }

	div.container {
        width: auto;
        max-width: 450px;
        padding-top: 20px;
    }

.btn-primary {
	background-color: #4041fe;
}

.btn-primary:hover,
.btn-primary:focus {
	border-color: #4041fe;
	background-color: #4041fe;
	color: #FFF;
}

.form-group {
	padding: 0;
	margin: 15px 0;
}

.text-info, .text-primary {
	margin-top: 10px;
}
</style>
</head>

<body>
    <!-- .modal -->
    <div id="find-id-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <!-- .modal-dialog -->
        <div class="modal-dialog">
            <!-- .modal-content -->
            <div class="modal-content">
                <!-- 제목 -->
                <div class="modal-header">
                    <!-- 닫기버튼 -->
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <br>
                    <h4 class="modal-title  text-primary text-center" id="myModalLabel">아이디 찾기 결과</h4>
                </div>
                <!-- 내용 -->
                <div class="modal-body text-center">
                    <p>
                        메이트님의 아이디는
                    </p>
                    <h4 class="text-primary ">javajung</h4>
                    <p>
                        입니다.
                    </p>
                </div>
                <!-- 하단 -->
                <div class=" text-center">
                    <a href="${pageContext.request.contextPath}"> <button type="button" class="btn  btn-primary btn-lg">
                            확인
                        </button></a>
                </div>
                <br />
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class="container">
        <div class="content ">
            <div class="find-id-header">
                <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/common/logo.png"></a>
                <div class="id-blue">
                    <div class="square"></div>아이디 찾기
                    <div class="sub_desc">
                        <p>아이디 찾기를 위하여 가입하실 때 입력하신 이름과 이메일 주소를 입력해주세요.</p>
                    </div>
                </div>
            </div>
            <br />
            <hr style="border: solid 1px #aaa;" width="100%">
            <form role="form">
                <fieldset>
                    <div class="form-group">
                        <input type="text" id="user_name" class="form-control" placeholder="이름" />
                        <span class="text-info">이름을 입력해 주세요.</span>
                    </div>
                    <div class="form-group">
                        <input type="email" id="user_eamil" class="form-control" placeholder="email@example.com" />
                        <span class="text-info">이메일 주소를 입력해주세요.</span>
                    </div>
                    <br />
                    <button type="button" class="btn btn-primary btn-block" data-toggle="modal" href="#find-id-modal">
                        아이디 찾기
                    </button>
                </fieldset>
            </form>
        </div>
    </div>
    
</body>

</html>