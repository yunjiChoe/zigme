 <!--  
 - @filename    : view.jsp
 - @description : 교수 정보를 보여줍니다.
 - @author      : 정희선(gmltjs9923@gmail.com)
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>직메 Zigme</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- common.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />

<style type="text/css">
</style>
</head>
<body>
    <h1>교수정보</h1>
    <p>교수번호: ${output.profno}</p>
    <p>교수이름: ${output.name}</p>
    <p>아이디: ${output.userid}</p>
    <p>직급: ${output.position}</p>
    <p>급여: ${output.sal}</p>
    <p>입사일: ${output.hiredate}</p>
    <p>보직수당: ${output.comm}</p>
    <p>학과이름: ${output.dname}</p>
    <p>학과위치: ${output.loc}</p>
    <hr />
    <a href="${pageContext.request.contextPath}/professor/list.do">[목록보기]</a>
    <a href="${pageContext.request.contextPath}/professor/add.do">[교수추가]</a>
    <a href="${pageContext.request.contextPath}/professor/edit.do?profno=${output.profno}">[교수수정]</a>
    <a href="${pageContext.request.contextPath}/professor/delete_ok.do?profno=${output.profno}">[교수삭제]</a>
</body>
</html>
