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
        <a class="navbar-brand" href="${pageContext.request.contextPath}/main"><img src="${pageContext.request.contextPath}/img/common/logo.png"></a>
      </div>  
  
    <!-- main navbar 시작 -->
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
          <li class="menu-item-bumper">&nbsp;</li>
          <li class="menu-item pull-left" data-imgname="sub_hover_bubble_home.png">
            <a id="top_fir" class="top"href="${pageContext.request.contextPath}/main">홈으로</a>
          </li>

          <li class="menu-item pull-left" data-imgname="sub_hover_bubble_menu,util.png">
            <a id="top_sec" class="top" href="${pageContext.request.contextPath}/menu/menu_main">메뉴추천</a>
            <div class="event_bumper">&nbsp;</div>
            <ul class="sub pull-left">
              <li><a href="#"></a></li>
              <li><a href="${pageContext.request.contextPath}/menu/menu_category ">업종별</a></li>
              <li><a href="${pageContext.request.contextPath}/menu/menu_weather ">날씨별</a></li>
              <li><a href="${pageContext.request.contextPath}/menu/menu_condition ">건강상태별</a></li>
              <li><a href="${pageContext.request.contextPath}/menu/menu_chart ">선호음식순위</a></li>
            </ul>
          </li>

          <li class="menu-item pull-left" data-imgname="sub_hover_bubble_helpme.png">
            <a id="top_thi" class="top" href="${pageContext.request.contextPath}/help/help_main ">직장생활, 도와줘!</a>
            <div class="event_bumper">&nbsp;</div>
            <ul class="sub pull-left">
              <li><a href="#"></a></li>
              <li><a href="${pageContext.request.contextPath}/help_ajax/help_comm.do ">커뮤니티</a></li>
              <li><a href="${pageContext.request.contextPath}/help/help_chart ">메이트들의 고민은?</a></li>
            </ul>
          </li>

          <li class="menu-item pull-left" data-imgname="sub_hover_bubble_menu,util.png">
            <a id="top_for" class="top" href="${pageContext.request.contextPath}/util/util_main ">부가기능</a>
            <div class="event_bumper">&nbsp;</div>
            <ul class="sub pull-left">
              <li><a href="#"></a></li>
              <li><a href="${pageContext.request.contextPath}/util/util_alarm.do?type=${zigme_user.userNo}">알람</a></li>
              <li><a href="${pageContext.request.contextPath}/util/util_5min ">5분 스트레칭</a></li>
              <li><a href="${pageContext.request.contextPath}/util/util_lotto ">돌려돌려 공돌려</a></li>
            </ul>
          </li>
      </ul>

        <!-- 유저 드롭박스 시작 -->
        <form class="navbar-form navbar-right" method="post" action="${pageContext.request.contextPath}/common/logout.do" name="user_logout">          
          <div class="dropdown clearfix" id="user_infobtn">
            <a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"><img src="${pageContext.request.contextPath}/img/common/reward_icon_influencer.png" class="profile_icon" /> 
            ${zigme_user.nickname} 님 
           <input type="hidden" name="session" value="${my_session}" id="my_session">
           <input type="hidden" name="userno" value="${zigme_user.userNo}" id="userNo">
            
            <b class="caret"></b> 
            </a>
            
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
              <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/myinfo">내 정보수정</a></li>
              <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/noti">알림</a></li>
              <li role="presentation" class="divider"></li>
              <li role="presentation" id="logout"><a role="menuitem" tabindex="-1"><button  id="logout_button">로그아웃</button></a></li>
              
            </ul>
          </div>
        </form>
        <!-- // 유저 드롭박스 종료 -->
      </div> 
    </div> <!-- // navbar 종료 --> 
