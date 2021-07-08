package study.spring.zigme.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
public class HomeController {
   
   /**
    * 아이디찾기로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/find_id", method = RequestMethod.GET)
   public String findId(Model model, HttpServletRequest request) {
      return "common/find_id";
   }
   
   /**
    * 패스워드 재설정으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/find_pw_reset", method = RequestMethod.GET)
   public String findPwReset(Model model, HttpServletRequest request) {
      return "common/find_pw_reset";
   }
   
   /**
    * 패스워드찾기로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/find_pw", method = RequestMethod.GET)
   public String findPass(Model model, HttpServletRequest request) {
      return "common/find_pw";
   }
   
   /**
    * Zigme intro 로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String introZigme(Model model, HttpServletRequest request) {
      return "common/intro_zigme";
   }
   
   /**
    * 회원가입으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/join", method = RequestMethod.GET)
   public String join(Model model, HttpServletRequest request) {
      return "common/join";
   }
   
   /**
    * 메인페이지로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/main", method = RequestMethod.GET)
   public String mainZigme(Model model, HttpServletRequest request) {
      return "common/main";
   }
   
   /**
    * 내 정보 수정으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/myinfo", method = RequestMethod.GET)
   public String myInfo(Model model, HttpServletRequest request) {
      return "common/myinfo";
   }
   
   /**
    * 알림으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/noti", method = RequestMethod.GET)
   public String noti(Model model, HttpServletRequest request) {
      return "common/noti";
   }
   
   /**
    * 신고팝업으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/report_popup", method = RequestMethod.GET)
   public String reportPopup(Model model, HttpServletRequest request) {
      return "common/report_popup";
   }
   
   /**
    * 메이트들의 고민은 으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/help/help_chart", method = RequestMethod.GET)
   public String helpChart(Model model, HttpServletRequest request) {
      return "help/help_chart";
   }
   
   /**
    * 커뮤니티 글보기로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/help/help_comm_read", method = RequestMethod.GET)
   public String helpCommRead(Model model, HttpServletRequest request) {
      return "help/help_comm_read";
   }
   
   /**
    * 커뮤니티 글쓰기로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/help/help_comm_write", method = RequestMethod.GET)
   public String helpCommWrite(Model model, HttpServletRequest request) {
      return "help/help_comm_write";
   }
   
   /**
    * 커뮤니티 글목록으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/help/help_comm", method = RequestMethod.GET)
   public String helpComm(Model model, HttpServletRequest request) {
      return "help/help_comm";
   }
   
   /**
    * 커뮤니티 메인으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/help/help_main", method = RequestMethod.GET)
   public String helpMain(Model model, HttpServletRequest request) {
      return "help/help_main";
   }
   
   /**
    * 업종별-음식점 리스트로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/menu/menu_category_list", method = RequestMethod.GET)
   public String menuCategoryList(Model model, HttpServletRequest request) {
      return "menu/menu_category_list";
   }
   
   /**
    * 업종별-추천으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/menu/menu_category", method = RequestMethod.GET)
   public String menuCategory(Model model, HttpServletRequest request) {
      return "menu/menu_category";
   }
   
   /**
    * 선호음식순위로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/menu/menu_chart", method = RequestMethod.GET)
   public String menuChart(Model model, HttpServletRequest request) {
      return "menu/menu_chart";
   }
   
   /**
    * 건강상태별-음식점 리스트로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/menu/menu_condition_list", method = RequestMethod.GET)
   public String menuConditionList(Model model, HttpServletRequest request) {
      return "menu/menu_condition_list";
   }
   
   /**
    * 건강상태별-추천으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/menu/menu_condition", method = RequestMethod.GET)
   public String menuCondition(Model model, HttpServletRequest request) {
      return "menu/menu_condition";
   }
   
   /**
    * 메뉴 추천 메인으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/menu/menu_main", method = RequestMethod.GET)
   public String menuMain(Model model, HttpServletRequest request) {
      return "menu/menu_main";
   }
   
   /**
    * 날씨별-음식점 리스트 메인으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/menu/menu_weather_list", method = RequestMethod.GET)
   public String menuWeatherList(Model model, HttpServletRequest request) {
      return "menu/menu_weather_list";
   }
   
   /**
    * 날씨별-음식점 리스트 메인으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/menu/menu_weather", method = RequestMethod.GET)
   public String menuWeather(Model model, HttpServletRequest request) {
      return "menu/menu_weather";
   }   
   
   /**
    * 5분 스트레칭으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/util/util_5min", method = RequestMethod.GET)
   public String util5min(Model model, HttpServletRequest request) {
      return "util/util_5min";
   }
   
   /**
    * 알람페이지로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/util/util_alarm", method = RequestMethod.GET)
   public String utilAlarm(Model model, HttpServletRequest request) {
      return "util/util_alarm";
   }
   
   /**
    * 공돌려 결과화면으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/util/util_lotto_result", method = RequestMethod.GET)
   public String utilLottoResult(Model model, HttpServletRequest request) {
      return "util/util_lotto_result";
   }
   
   /**
    * 공돌려로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/util/util_lotto", method = RequestMethod.GET)
   public String utilLotto(Model model, HttpServletRequest request) {
      return "util/util_lotto";
   }
   
   /**
    * 부가기능 메인으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/util/util_main", method = RequestMethod.GET)
   public String utilMain(Model model, HttpServletRequest request) {
      return "util/util_main";
   }
   
   /**
    * [관리자]블록유저관리로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/admin/admin_blockUser", method = RequestMethod.GET)
   public String adminBlockUser(Model model, HttpServletRequest request) {
      return "admin/admin_blockUser";
   }
   
   /**
    * [관리자]업종관리DB로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/admin/admin_category", method = RequestMethod.GET)
   public String adminCategory(Model model, HttpServletRequest request) {
      return "admin/admin_category";
   }
   
   /**
    * [관리자]건강상태관리DB로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/admin/admin_condition", method = RequestMethod.GET)
   public String adminCondition(Model model, HttpServletRequest request) {
      return "admin/admin_condition";
   }
   
   /**
    * [관리자]음식관리DB로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/admin/admin_food", method = RequestMethod.GET)
   public String adminFood(Model model, HttpServletRequest request) {
      return "admin/admin_food";
   }
   
   /**
    * [관리자]메인으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/admin", method = RequestMethod.GET)
   public String adminMain(Model model, HttpServletRequest request) {
      return "admin/admin_main";
   }
   
   
   
}