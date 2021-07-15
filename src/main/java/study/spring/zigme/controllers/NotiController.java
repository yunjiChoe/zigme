/**
 * Noti Test 용으로 controller를 만들어봤습니다. 테스트 후 필요 없으면 삭제 예정 
 * 작업자 : 솔
 * DATE : 2021-07-12
 */

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
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
public class NotiController {

   
   /**
    * 알림으로 진입하기 위한 메서드
    * @param model
    * @param request
    * @return String
    */
   @RequestMapping(value = "/noti_test", method = RequestMethod.GET)
   public String noti(Model model, HttpServletRequest request) {
      return "common/noti_test";
   }

 
   /**
    * 알림에서 조회된 목록 클릭 시 해당 글의 페이지로 이동하기 위한 메서드
    * @param ??
    * @param request
    * @return ??
    */
   @RequestMapping(value = "/help_comm_read", method = RequestMethod.GET)
   public String notiCheck(Locale locale, Model model,
		   HttpServletRequest request, HttpServletResponse response,
		   @RequestParam(value="4", defaultValue = "") String no) {
	   return "${pageContext.request.contextPath}/help_comm_read";
   }
   
   



   

   
   
}