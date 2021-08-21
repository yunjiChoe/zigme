<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">		
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">메뉴열기</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin"><img src="${pageContext.request.contextPath}/img/common/logo.png"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자</a>
      </div>
      
        
  
    <!-- admin_main navbar 시작 -->
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
          <li class="menu-item-bumper">&nbsp;</li>
          <li class="menu-item pull-left" data-imgname="sub_hover_bubble_home.png">
            <a id="top_fir" class="top"href="${pageContext.request.contextPath}/admin/admin_food/list.do">음식DB관리</a>
          </li>

          <li class="menu-item pull-left" data-imgname="sub_hover_bubble_helpme.png">
            <a id="top_sec" class="top" href="${pageContext.request.contextPath}/admin/admin_catecondi/list.do">업종·건강상태 관리</a>
          </li>

          <li class="menu-item pull-left" data-imgname="sub_hover_bubble_home.png">
            <a id="top_thi" class="top" href="${pageContext.request.contextPath}/admin/admin_image">이미지 관리</a>
          </li>

          <li class="menu-item pull-left" data-imgname="sub_hover_bubble_menu,util.png">
            <a id="top_for" class="top" href="${pageContext.request.contextPath}/admin/admin_blockUser">block유저관리</a>
          </li>
      </ul>

        <!-- 관리자 드롭박스 시작 -->
        <form class="navbar-form navbar-right">          
          <div class="dropdown clearfix" id="user_infobtn">
            <a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"><img src="${pageContext.request.contextPath}/img/common/reward_icon_admin.png" class="profile_icon" /> admin 님 
            <b class="caret"></b>
            </a>
            
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">내 정보수정</a></li>
              <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/main">직메 페이지</a></li>
              <li role="presentation" class="divider"></li>
              <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}">로그아웃</a></li>
            </ul>
          </div>
        </form>
        <!-- // 관리자 드롭박스 종료 -->
      </div> 
    </div> <!-- // navbar 종료 -->
    