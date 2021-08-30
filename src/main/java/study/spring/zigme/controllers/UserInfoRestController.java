package study.spring.zigme.controllers;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.AdminStats;
import study.spring.zigme.model.User;
import study.spring.zigme.service.AdminStatsService;
import study.spring.zigme.service.UserService;

@Slf4j
@RestController
public class UserInfoRestController {
	
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** UserService */
	@Autowired
	UserService userservice;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 관리자 유저통계를 쌓기 위함 **/ 
	@Autowired AdminStatsService adminstatsService;
	
	
	/** 내 정보 수정 action  */
	@RequestMapping(value = "/myinfo", method = RequestMethod.PUT)
	public Map<String, Object> myinfo_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "userNo", defaultValue = "0") int userNo,
			@RequestParam(value = "nickname", defaultValue = "") String nickname,
			@RequestParam(value = "email", defaultValue = "") String email,
			@RequestParam(value = "password", defaultValue = "") String password,
			@RequestParam(value = "postcode", defaultValue = "") String postcode,
			@RequestParam(value = "addr1", defaultValue = "") String addr1,
			@RequestParam(value = "addr2", defaultValue = "") String addr2,
			@RequestParam(value = "loc_xy", defaultValue = "") String loc_xy,
			@RequestParam(value = "outUserflag", defaultValue = "2") String outUserflag
			

	) {

		log.info("컨트롤러 확인");
		/** 컨트롤러에서 세션을 식별하기 위한 처리 */
		// 세션값은 request 내장객체를 통해서 HttpSession객체를 생성해야 접근할 수 있다.
		// --> Servlet과 동일함.
		HttpSession session = request.getSession();
		/** 1) 파라미터 유효성 검사 */
		 if (userNo == 0)       	{ return webHelper.getJsonWarning("회원정보가 조회되지 않습니다."); }
		 if (!regexHelper.isValue(password))     	{ return webHelper.getJsonWarning("비밀번호 입력되지 않습니다."); }
		// if (!regexHelper.isEngNumLenght(password))     	{ return webHelper.getJsonWarning("비밀번호 4자~20자 영문,숫자 조합입니다."); }	 
		 if (!regexHelper.isValue(nickname))     	{ return webHelper.getJsonWarning("닉네임 입력되지 않습니다."); }
		 if (!regexHelper.isKorEngNum(nickname))     	{ return webHelper.getJsonWarning("닉네임 입력되지 않습니다."); }
		 if (!regexHelper.isValue(email))     	{ return webHelper.getJsonWarning("이메일 입력되지 않았습니다."); }
		if (!regexHelper.isValue(postcode))     	{ return webHelper.getJsonWarning("우편번호가 입력되지 않았습니다."); }
		if (!regexHelper.isValue(addr1))     	{ return webHelper.getJsonWarning("본주소가 입력되지 않았습니다."); }
		if (!regexHelper.isValue(addr2))     	{ return webHelper.getJsonWarning("상세주소가 입력되지 않았습니다."); }
		if (!regexHelper.isValue(loc_xy))     	{ return webHelper.getJsonWarning("주소를 다시 입력해주세요."); }
		 
		
		/** 2) 데이터 조회하기 */
		User input = new User();
		input.setUserNo(userNo);
		input.setPassword(password);
		input.setNickname(nickname);
		input.setEmail(email);
		input.setPostcode(postcode);
		input.setAddr1(addr1);
		input.setAddr2(addr2);
		input.setLoc_xy(loc_xy);
		input.setOutUserflag(outUserflag);

		
		User zigme_user =null;

		try {
			// 데이터 수정
			zigme_user= userservice.editUser(input);
			// 수정된 결과 조회
			userservice.getUserItem(zigme_user);
		} catch (Exception e) {
			
		}
		session.setAttribute("zigme_user", zigme_user);
		model.addAttribute("zigme_user", zigme_user);
		/** 2) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item",zigme_user);
        return webHelper.getJsonData(data);
	}
	
	/** 삭제 처리 */
	@RequestMapping(value = "/user_out", method = RequestMethod.PUT)
	public Map<String, Object> user_out(HttpServletRequest request,
			@RequestParam(value = "userNo", defaultValue = "0") int userNo,
			@RequestParam(value = "id", defaultValue = "0") String id,
			@RequestParam(value = "outUserflag", defaultValue = "2") String outUserflag
			) {
		HttpSession session = request.getSession();
		session.invalidate();  // 세션 삭제
		
		log.info("탈퇴 컨트롤러 확인");
		/** 1) 파라미터 유효성 검사 */
		 if (userNo == 0)       	{ return webHelper.getJsonWarning("회원정보가 조회 되지않습니다."); }

		/** 2) 데이터 삭제하기 */
		User input = new User();
		input.setUserNo(userNo);
		input.setId(id);
		
		User zigme_user = null;
		
		// 유저통계 데이터 확인
		AdminStats today_stats = null;
		AdminStats to_date = new AdminStats();
		Calendar cal = Calendar.getInstance();
		
		String yy = String.valueOf(cal.get(Calendar.YEAR)); 
		String mm = String.valueOf(cal.get(Calendar.MONTH) + 1 < 10 ? "0" + (cal.get(Calendar.MONTH)+1) : (cal.get(Calendar.MONTH)+1));		
		String dd = String.valueOf(cal.get(Calendar.DAY_OF_MONTH) < 10 ? "0" + cal.get(Calendar.DAY_OF_MONTH) : cal.get(Calendar.DAY_OF_MONTH));
		to_date.setAdminStatisDate(yy + mm + dd);
		

		try {
			
			zigme_user = userservice.doOut(input); // 데이터 삭제
			
			// 오늘의 통계 정보를 select 하여 update  
			today_stats = adminstatsService.getstatsItem(to_date);
			
			// 없는 경우에 insert 
			if(today_stats==null) {
				adminstatsService.addstatsItem(to_date);
				today_stats = adminstatsService.getstatsItem(to_date);
			}
			
			today_stats.setAdminSecession(today_stats.getAdminSecession()+1); 
			adminstatsService.editstatsItem(today_stats);		
			
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> data = new HashMap<String, Object>();
       // data.put("item", output);
        return webHelper.getJsonData(data);
	}

}
