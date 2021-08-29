<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>직메 Zigme</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- 폰트스타일 정의 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/ScoreDreamWebFont.css" />
<style type="text/css">
* {
	font-family: 'S-CoreDream-3Light';
}
/* ----------------------------------- 레이아웃 스타일 */
.sidebar {
	width: 20%;
	border-right: 1px solid #999;
	min-height: 800px;
	background-color: #ddd;
}

.body {
	width: 80%;
	min-height: 800px;
	background-color: #eee;
}

.body img {
	width: 100%;
}

.container {
	width: 1200px;
}

.navbar {
	width: auto;
	margin-bottom: 0;
	background-color: #ffffff;
	border: none;
}

/** 메뉴에 포함된 모든 링크에 대한 크기,배경 지정 및 글자 꾸미기 */
.top {
	padding: 0px;
	color: #ff0000;
	width: 200px;
	height: 48px;
	line-height: 20px;
	text-align: center;
	font-size: 16px;
	font-weight: 100;
	font-style: normal;
	font-family: 'S-CoreDream-6Bold';
}

.footer {
	width: auto;
	padding: 150px 0 0 0;
	font-size: 12px;
	text-align: center;
}

/* ----------------------------------- 레이아웃 스타일 end */
/* ----------------------------------- navbar */
/** 메인메뉴 폰트 컬러 재정의*/
.navbar-default .navbar-nav>li>a {
	color: #4041fe;
}

.menu-item a {
	color: #000000;
}

.menu-item-bumper {
	display: inline-block;
	width: 60px;
}

/** 서브메뉴가 펼쳐지더라도 다른 요소들 위에 떠 있어야 하므로, Position처리 */
.sub {
	width: 100%;
	background-color: #4041fe;
	position: absolute;
	top: 60px;
	z-index: 1000;
	border-radius: 10px 10px;
	padding: 0 5px 20px 0;
	text-align: center;
	-webkit-box-shadow: 2px 2px 15px rgba(0, 0, 0, 0.25);
	display: none;
}

.sub li a {
	display: inline-block;
	width: 180px;
	text-align: center;
	color: #ffffff;
	font-weight: 300;
	font-size: 100%;
	line-height: 1.8;
}

/* 서브 네비의 ▲ 모양 만들기 */
.sub a:before {
	content: '';
	position: absolute;
	left: 90px;
	top: -12px;
	width: 0;
	height: 0;
	border-left: 8px solid transparent;
	border-right: 8px solid transparent;
	border-bottom: 12px solid #4041fe;
}

.navbar-brand {
	position: relative;
	left: 30px;
	top: -12px;
}

.navbar-brand img {
	width: 130px;
}

/* sub navbar의 메롱현상 해결을 위한 영역 */
.event_bumper {
	height: 14px;
	background-color: #fff;
}

/** 서브메뉴의 기준점을 부모요소로 지정하기 위한 처리 */
.menu-item:hover {
	border-radius: 30px;
}

.menu-item .top:hover {
	color: #fff;
}

.navbar-collapse {
	width: 1200px;
}

/* ----------------------------------- navbar end */
/* ----------------------------------- user info dropbox */
#dropdownMenu1 {
	color: #4041fe;
	font-weight: bolder;
	font-size: 14px;
}

#user_infobtn {
	padding: 10px;
	border-radius: 20px;
	z-index: 100;
	-webkit-box-shadow: -2px -1px 8px rgba(0, 0, 0, 0.1);
}

#user_infobtn a {
	text-decoration: none;
}

#user_infobtn .dropdown-menu {
	color: #404040;
	font-weight: bold;
	min-width: 95px;
	width: 109px;
	border: 0;
	padding: 2 0;
	top: 43px;
	z-index: 0;
	border-radius: 20px;
	-webkit-box-shadow: -2px -1px 8px rgba(0, 0, 0, 0.1);
}

.dropdown-menu {
	padding: 0;
}

.dropdown-menu>li {
	padding: 0;
}

.dropdown-menu>li>a {
	background-clip: padding-box;
	padding: 5px 20px 0 20px;
	height: 30px;
}

.dropdown-menu .divider {
	height: 1px;
	margin: 0;
	overflow: hidden;
	background-color: #e5e5e5;
}

.dropdown-menu>li>a:hover {
	background-color: transparent;
}

.dropdown-menu>li:first-child:hover {
	background-color: #E5E5E5;
	border-top-right-radius: 20px;
	border-top-left-radius: 20px;
}

.dropdown-menu>li:nth-child(2):hover {
	background-color: #E5E5E5;
}

.dropdown-menu>li:last-child:hover {
	background-color: #E5E5E5;
	border-bottom-right-radius: 20px;
	border-bottom-left-radius: 20px;
}

.profile_icon {
	width: 16px;
	height: 16px;
}

/* ----------------------------------- user info dropbox end */
/* ----------------------------------- footer */
#footer_title {
	font-size: 13px;
	font-weight: bold;
	color: #0000ff;
}

.footer address {
	display: inline-block;
}

.footer address a {
	color: #000000;
}

/* ----------------------------------- footer end */
/* ---- 스크롤바 꾸미기 ----- */
::-webkit-scrollbar {
	width: 15px; /*스크롤바의 너비*/
}

::-webkit-scrollbar-thumb {
	border: 1px solid #4041fe;
	background-color: #fff; /*스크롤바의 색상*/
}

::-webkit-scrollbar-track {
	background-color: #ddd; /*스크롤바 트랙 색상*/
}

::-webkit-scrollbar-thumb:hover {
	background: #4041fe;
}
/* ----- 임시 -------*/
.impl_body {
	padding-top: 150px;
	text-align: center;
}
/* ------ 제목영역 스타일 지정 ------ */
.content {
	padding-top: 20px;
}

.sub_title {
	font-family: 'S-CoreDream-6Bold';
	text-align: center;
	font-size: 36px;
	font-weight: bold;
	color: #4041fe;
	padding: 35px 0;
	margin: auto;
}

#logout_button {
	background-color: #fff;
}
</style>
