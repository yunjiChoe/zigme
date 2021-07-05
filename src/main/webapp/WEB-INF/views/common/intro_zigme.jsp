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

.form-group {
	padding: 0 10px;
}

.checkbox {
	padding-left: 31px;
}

.modal-button {
	padding: 0 10px;
}

.btn-primary {
	background-color: #4041fe;
	margin-bottom: 10px;
}

.btn-primary:hover,
.btn-primary:focus {
	border-color: #4041fe;
	background-color: #4041fe;
	color: #FFF;
}
</style>
</head>

<body>
    <!-- .modal -->
    <div id="login-modal" class="modal fade" tabindex="-10" role="dialog" aria-labelldby="myModalLabel" aria-hidden="true">
        <!-- .modal-dialog -->
        <div class="modal-dialog modal-dialog-login">
            <!-- .modal-content -->
            <div class="modal-content">
                <!-- 제목 -->
                
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h1 class="modal-title" id="myModalLabel"><strong >로그인</strong></h1>
                </div>
                <!--내용 -->
                <div class="form-group">
                    <label for="user_id"></label>
                    <input type="text" id="user_id" class="form-control" placeholder="아이디" />
                </div>
                <div class="form-group">
                    <label for="user_pw"></label>
                    <input type="password" id="user_pw" class="form-control" placeholder="패스워드" />
                </div>
                <div class="checkbox">
                    <label><input type="checkbox">아이디 저장</label>
                </div>
                <div class="modal-button">
                    <a href="${pageContext.request.contextPath}/main"><button type="button" class="btn btn-primary btn-block "> 로그인 </button></a>
                   <a href="${pageContext.request.contextPath}/join"><button type="button" class="btn btn-primary btn-block btn-ttc1"> 회원가입 </button></a>
                </div>
                <!-- 하단-->
                <br>
                <div class="modal-footer1">
                    <a href="${pageContext.request.contextPath}/find_id"><span>아이디찾기</span></a>
                    <span>|</span>
                    <a href="${pageContext.request.contextPath}/find_pw"><span>패스워드찾기</span></a>
                </div>
                <br>
            </div>
            <!-- /.modal-content -->
        </div><!-- /.modal-dialod-->
    </div>
    <!-- /.modal -->
    <div class="intro">
        <a href="#login-modal" data-toggle="modal"><span >로그인</span></a>
        <a href="${pageContext.request.contextPath}/join"><span>회원가입</span></a>
    </div>
   
    <div class="intro-1"></div>
    <div class="container">
        <div class="row">
            <div class=" intro-content clear">
                <a href="#login-modal" data-toggle="modal"><img src="${pageContext.request.contextPath}/img/common/logo.png"></a>
            </div>
        </div>
    </div>
</body>

</html>