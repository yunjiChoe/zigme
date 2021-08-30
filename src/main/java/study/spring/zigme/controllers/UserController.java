package study.spring.zigme.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.helper.MailHelper;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.AdminStats;
import study.spring.zigme.model.Scheduler;
import study.spring.zigme.model.User;
import study.spring.zigme.service.AdminStatsService;
import study.spring.zigme.service.UserService;

@Slf4j
@Controller
public class UserController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** UserService */
	@Autowired
	UserService userservice;
	
	/** 관리자 유저통계를 쌓기 위함 **/ 
	@Autowired AdminStatsService adminstatsService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 작성 폼 페이지 */
	@RequestMapping(value = "/common/join.do", method = RequestMethod.GET)
	public ModelAndView add(Model model) {
		/** 목록 조회하기 */
		List<User> output = null;

		try {
			output = userservice.getUserList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);

		return new ModelAndView("common/join");
	}

	/** 회원가입 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/common/join_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model, HttpServletResponse response,
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "password", defaultValue = "") String password,
			@RequestParam(value = "passwordcheck", defaultValue = "") String passwordcheck,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "nickname", defaultValue = "") String nickname,
			@RequestParam(value = "email", defaultValue = "") String email,
			@RequestParam(value = "gender", defaultValue = "") String gender,
			@RequestParam(value = "postcode", defaultValue = "") String postcode,
			@RequestParam(value = "addr1", defaultValue = "") String addr1,
			@RequestParam(value = "addr2", defaultValue = "") String addr2,
			@RequestParam(value = "loc_xy", defaultValue = "") String loc_xy,
			@RequestParam(value = "blockUserflag", defaultValue = "2") String blockUserflag,
			@RequestParam(value = "outUserflag", defaultValue = "2") String outUserflag,
			@RequestParam(value = "checkAll", defaultValue = "") String checkAll) {

		/** 1) 사용자가 입력한 파라미터 유효성 검사 */

		if (!regexHelper.isValue(id)) {
			return webHelper.redirect(null, "아이디를 입력하세요");
		}
		if (!regexHelper.isEngNumLenght(id)) {
			return webHelper.redirect(null, "아이디는 영어와 숫자 4~20자로 입력해주세요.");
		}
		if (!regexHelper.isValue(password)) {
			return webHelper.redirect(null, " 비밀번호를 입력하세요");
		}
		if (!regexHelper.isEngNumLenght(password)) {
			return webHelper.redirect(null, "비밀번호 4자~20자 영문,숫자 조합입니다.");
		}

		if (!regexHelper.isValue(name)) {
			return webHelper.redirect(null, "이름을 입력하세요");
		}
		if (!regexHelper.isKorLenght(name)) {
			return webHelper.redirect(null, "이름은 한글만 가능합니다");
		}
		if (!regexHelper.isValue(nickname)) {
			return webHelper.redirect(null, "닉네임을 입력하세요");
		}
		if (!regexHelper.isKorEngNum(nickname)) {
			return webHelper.redirect(null, "닉네임은 한글,영어,숫자 2자~5자 조합만 가능합니다.");
		}
		if (!regexHelper.isValue(email)) {
			return webHelper.redirect(null, "이메일을 입력하세요");
		}
		if (!regexHelper.isEmail(email)) {
			return webHelper.redirect(null, "이메일 형식으로 입력하세요");
			
		}
		if (!regexHelper.isValue(postcode)) {
			return webHelper.redirect(null, "이메일 형식으로 입력하세요");
		}
		if (!regexHelper.isValue(addr1)) {
			return webHelper.redirect(null, "상세주소을 입력하세요");
		}

		if (!regexHelper.isValue(addr2)) {
			return webHelper.redirect(null, "상세주소을 입력하세요");
		}
		if (!regexHelper.isValue(loc_xy)) {
			return webHelper.redirect(null, "주소를 다시 한번 입력해주세요.");
		}
		

		if (!regexHelper.isValue(checkAll)) {
			return webHelper.redirect(null, "약관에 동의해주세요.");
		}

		/** 2) 데이터 저장하기 */
		User input = new User();
		input.setId(id);
		input.setPassword(password);
		input.setName(name);
		input.setNickname(nickname);
		input.setEmail(email);
		input.setGender(gender);
		input.setPostcode(postcode);
		input.setAddr1(addr1);
		input.setAddr2(addr2);
		input.setLoc_xy(loc_xy);
		input.setBlockUserflag(blockUserflag);
		input.setOutUserflag(outUserflag);
		
		// 유저통계 데이터 확인
		AdminStats today_stats = null;
		AdminStats to_date = new AdminStats();
		Calendar cal = Calendar.getInstance();
		
		String yy = String.valueOf(cal.get(Calendar.YEAR)); 
		String mm = String.valueOf(cal.get(Calendar.MONTH) + 1 < 10 ? "0" + (cal.get(Calendar.MONTH)+1) : (cal.get(Calendar.MONTH)+1));		
		String dd = String.valueOf(cal.get(Calendar.DAY_OF_MONTH) < 10 ? "0" + cal.get(Calendar.DAY_OF_MONTH) : cal.get(Calendar.DAY_OF_MONTH));
		to_date.setAdminStatisDate(yy + mm + dd);

		try {
			userservice.addUser(input);
			
			// 오늘의 통계 정보를 select 하여 update  
			today_stats = adminstatsService.getstatsItem(to_date);
			
			// 없는 경우에 insert 
			if(today_stats==null) {
				adminstatsService.addstatsItem(to_date);
				today_stats = adminstatsService.getstatsItem(to_date);
			}
			
			today_stats.setAdminJoin(today_stats.getAdminJoin()+1); 
			adminstatsService.editstatsItem(today_stats);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/";
		return webHelper.redirect(redirectUrl, "새로운 메이트님 환영합니다!");
	}

	/** 수정 폼 페이지 */
	@RequestMapping(value = "/common/myinfo.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model, HttpServletRequest request,
			@RequestParam(value = "userno", defaultValue = "0") int userno) {

		
		/** 1) 파라미터 유효성 검사 */
		if (userno == 0) {
			return webHelper.redirect(null, "회원 조회번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		User input = new User();
		input.setUserNo(userno);

		User output = null;

		List<User> userList = null;

		try {
			output = userservice.getUserItem(input);
			userList = userservice.getUserList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("deptList", userList);
		return new ModelAndView("/myinfo");
	}

	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/common/myinfo_ok.do", method = RequestMethod.POST)
	public ModelAndView edit_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "userno", defaultValue = "0") int userno,
			@RequestParam(value = "nickname", defaultValue = "") String nickname,
			@RequestParam(value = "email", defaultValue = "") String email,
			@RequestParam(value = "x_password", defaultValue = "") String x_password,
			@RequestParam(value = "new_password", defaultValue = "") String new_password,
			@RequestParam(value = "new_password2", defaultValue = "") String new_password2,
			@RequestParam(value = "postcode", defaultValue = "") String postcode,
			@RequestParam(value = "addr1", defaultValue = "") String addr1,
			@RequestParam(value = "addr2", defaultValue = "") String addr2,
			@RequestParam(value = "loc_xy", defaultValue = "") String loc_xy,
			@RequestParam(value = "blockUserflag", defaultValue = "2") String blockUserflag,
			@RequestParam(value = "outUserflag", defaultValue = "2") String outUserflag) {

		
		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		if (userno == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다");
		}
		

		if (!regexHelper.isValue(x_password)) {
			return webHelper.redirect(null, " 현재 비밀번호를 입력하세요");
		}
		
		
		if (!regexHelper.isValue(new_password)) {
			return webHelper.redirect(null, " 새 비밀번호를 입력하세요");
		}
		if (!regexHelper.isValue(new_password2)) {
			return webHelper.redirect(null, "  비밀번호 확인해주세요.");
		}

		if (!regexHelper.isValue(nickname)) {
			return webHelper.redirect(null, "닉네임을 입력하세요");
		}
		if (!regexHelper.isKorEng(nickname)) {
			return webHelper.redirect(null, "닉네임은 한글, 영어 조합만 가능합니다.");
		}
		if (!regexHelper.isValue(email)) {
			return webHelper.redirect(null, "이메일을 입력하세요");
		}
		if (!regexHelper.isEmail(email)) {
			return webHelper.redirect(null, "이메일 형식으로 입력하세요");
		}
		if (!regexHelper.isValue(postcode)) {
			return webHelper.redirect(null, "이메일 형식으로 입력하세요");
		}
		if (!regexHelper.isValue(addr1)) {
			return webHelper.redirect(null, "상세주소을 입력하세요");
		}
		
		if (!regexHelper.isValue(addr2)) {
			return webHelper.redirect(null, "상세주소을 입력하세요");
		}

		/** 2) 데이터 수정하기 */
		// 저장할 값들을 Beans에 담는다.
		User input = new User();
		input.setUserNo(userno);
		input.setPassword(new_password);
		input.setNickname(nickname);
		input.setEmail(email);
		input.setPostcode(postcode);
		input.setAddr1(addr1);
		input.setAddr2(addr2);
		input.setLoc_xy(loc_xy);
		input.setBlockUserflag(blockUserflag);
		input.setOutUserflag(outUserflag);
		
		

		User output = null;

		try {
			userservice.editUser(input);
			

			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/main";
		return webHelper.redirect(redirectUrl, "수정되었습니다");
	}

	

	/** 로그인 작성 폼 페이지 */
	@RequestMapping(value = "/inc/navbar.do", method = RequestMethod.GET)
	public ModelAndView login(Model model, HttpServletRequest request,

			@RequestParam(value = "userno", defaultValue = "0") int userno,
			@CookieValue(value="id", defaultValue="") String myCookie) {
		
		
		User input = new User();
		input.setUserNo(userno);

		User output = null;

		List<User> userList = null;

		try {
			output = userservice.getUserItem(input);
			userList = userservice.getUserList(null);
			// 저장시에 URLEncoding이 적용되었으므로 URLDecoding이 별도로 필요함
            myCookie = URLDecoder.decode(myCookie, "utf-8");
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		// 추출한 값을 View에게 전달
        model.addAttribute("my_cookie", myCookie);
		return new ModelAndView("admin/admin_main");
	}

	/** 로그인 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/common/login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model, HttpServletRequest request,HttpServletResponse response, 
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "password", defaultValue = "") String password
	) {

		  /** 1) request 객체를 사용해서 세션 객체 만들기 */
        // --> import javax.servlet.http.HttpSession;
        HttpSession session = request.getSession();

        /** 2) 세션 저장, 삭제 */
        // 생성된 세션 객체를 사용하는 방법은 JSP와 동일하다.
        if (!id.equals("")) {
            // 입력 내용이 있다면 세션 저장 처리
            session.setAttribute("my_session", id);
            try {
				id = URLEncoder.encode(id, "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            //session.setAttribute("my_session", userNo);
        } else {
            // 입력 내용이 없는 경우 세션 삭제
            session.removeAttribute("my_session");
        }
		// 세션 유지시간 설정(예 : 1시간)
	    session.setMaxInactiveInterval(60*60);
		String user = (String) session.getAttribute("id");
		 
		/** 쿠키*/
		Cookie cookie = new Cookie("my_cookie", id);  // 저장할 쿠키 객체 생성.
        cookie.setPath("/");            // 쿠키의 유효 경로 --> 사이트 전역에 대한 설정.
        cookie.setDomain("localhost");  // 쿠키의 유효 도메인
        
        if (id.equals("")) {     // 쿠키 시간을 설정하지 않으면 브라우저가 동작하는 동안 유효
            cookie.setMaxAge(0);        // 쿠키 설정시간이 0이면 즉시 삭제된다.
        } else {
            cookie.setMaxAge(60*60);       // 값이 있다면 60초 동안 쿠키 저장
        }
        
        response.addCookie(cookie);     // 쿠키 저장 

		
		/** 1) 파라미터 유효성 검사 */
		if (!regexHelper.isValue(id)) {
			return webHelper.redirect(null, "아이디를 입력하세요");
		}

		if (!regexHelper.isValue(password)) {
			return webHelper.redirect(null, " 비밀번호를 입력하세요");
		}

		User input = new User();
		input.setId(id);
		input.setPassword(password);
		
		User zigme_user = null;
		
		// 유저통계 데이터 확인
		AdminStats today_stats = null;
		AdminStats to_date = new AdminStats();
		Calendar cal = Calendar.getInstance();
		
		String yy = String.valueOf(cal.get(Calendar.YEAR)); 
		String mm = String.valueOf(cal.get(Calendar.MONTH) + 1 < 10 ? "0" + (cal.get(Calendar.MONTH)+1) : (cal.get(Calendar.MONTH)+1));		
		String dd = String.valueOf(cal.get(Calendar.DAY_OF_MONTH) < 10 ? "0" + cal.get(Calendar.DAY_OF_MONTH) : cal.get(Calendar.DAY_OF_MONTH));
		to_date.setAdminStatisDate(yy + mm + dd);
		
		String admin_yn = "admin";
		String redirectUrl = null;
		
		try {
			// 로그인시에 유저 정보 조회
			zigme_user = userservice.doLogin(input);
			
			// 오늘의 통계가 있는지 확인한 후, 
			today_stats = adminstatsService.getstatsItem(to_date);
			
			// 없는 경우에 insert 
			if(today_stats==null) {
				adminstatsService.addstatsItem(to_date);
				today_stats = adminstatsService.getstatsItem(to_date);
			}
			
			if(!(zigme_user.getId().equals(admin_yn))) { // 관리자가 아닌 경우에만 사용자 통계를 쌓는다.	
				// 방문자수 +1 카운트 
				today_stats.setAdminVisit(today_stats.getAdminVisit()+1); 
				adminstatsService.editstatsItem(today_stats);			
			}
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}	
		
		// 추출한 값을 View에게 전달
		session.setAttribute("zigme_user", zigme_user);
		System.out.println(zigme_user);
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		
		if(zigme_user.getId().equals(admin_yn)) { // 로그인한 사용자가 관리자일 경우, 관리자페이지로 이동 
			redirectUrl = contextPath + "/admin";
			return webHelper.redirect(redirectUrl, "관리자님 어서오세요! ^o^ ");
		} else {
			redirectUrl = contextPath + "/main";
			return webHelper.redirect(redirectUrl, "직메에 오신것을 환영합니다 ^o^ ");
		}
		
		

	}

	/** 아이디 찾기 폼 페이지 */
	@RequestMapping(value = "/common/find.do", method = RequestMethod.GET)
	public ModelAndView find(Model model, HttpServletRequest request,

			@RequestParam(value = "userno", defaultValue = "0") int userno) {

		/** 컨트롤러에서 세션을 식별하기 위한 처리 */
		// 세션값은 request 내장객체를 통해서 HttpSession객체를 생성해야 접근할 수 있다.
		// --> Servlet과 동일함.
		HttpSession session = request.getSession();
		String mySession = (String) session.getAttribute("output");
		if (mySession == null) {
			mySession = "";
		}

		User input = new User();
		input.setUserNo(userno);

		User output = null;

		List<User> userList = null;

		try {
			output = userservice.getUserItem(input);
			userList = userservice.getUserList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		
		model.addAttribute("my_session", session);
		return new ModelAndView("/find_id");
	}

	/** 아이디 찾기 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/common/find_ok.do", method = RequestMethod.POST)
	public Map<String, Object> find_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "email", defaultValue = "") String email

	) {

		/** 컨트롤러에서 세션을 식별하기 위한 처리 */
		// 세션값은 request 내장객체를 통해서 HttpSession객체를 생성해야 접근할 수 있다.
		// --> Servlet과 동일함.
		HttpSession session = request.getSession();
		/** 1) 파라미터 유효성 검사 */
		 if (!regexHelper.isValue(name))     	{ return webHelper.getJsonWarning("비밀번호 조회되지 않습니다."); }
		 if (!regexHelper.isValue(email))     	{ return webHelper.getJsonWarning("비밀번호 조회되지 않습니다."); }
		/** 2) 데이터 조회하기 */
		User input = new User();
		input.setName(name);
		input.setEmail(email);

		User output = null;

		try {
			output = userservice.getUserId(input);

		} catch (Exception e) {
			
		}

		session.setAttribute("output", output);
		session.getAttribute("nickname");
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);
        return webHelper.getJsonData(data);
	}


	/** 비밀번호 찾기 action 페이지 */
	@RequestMapping(value = "/common/find_pw_ok.do", method = RequestMethod.POST)
	public ModelAndView find_pw_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "email", defaultValue = "") String email

	) {

		log.info("컨트롤러 확인");
		/** 컨트롤러에서 세션을 식별하기 위한 처리 */
		// 세션값은 request 내장객체를 통해서 HttpSession객체를 생성해야 접근할 수 있다.
		// --> Servlet과 동일함.
		HttpSession session = request.getSession();
		/** 1) 파라미터 유효성 검사 */
		if (!regexHelper.isValue(name)) {
			return webHelper.redirect(null, "이름를 입력하세요");
		}
		if (!regexHelper.isValue(id)) {
			return webHelper.redirect(null, "아이디를 입력하세요");
		}

		if (!regexHelper.isValue(email)) {
			return webHelper.redirect(null, " 이메일를 입력하세요");
		}

		
		/** 2) 데이터 조회하기 */
		User input = new User();
		input.setName(name);
		input.setId(id);
		input.setEmail(email);

		User output = null;

		try {
			output = userservice.getUserPw(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		session.setAttribute("output", output);
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/find_pw";
		return webHelper.redirect(redirectUrl, null);
	}
	
	
	

	/** 로그아웃 */
	@RequestMapping(value = "/common/logout.do", method = RequestMethod.POST)
	public ModelAndView logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();  // 세션 삭제
		
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/";
		return webHelper.redirect(redirectUrl, null);
	}

	




}
