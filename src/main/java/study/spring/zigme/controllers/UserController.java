package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.helper.MailHelper;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Scheduler;
import study.spring.zigme.model.User;
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
	
	@Autowired
	MailHelper mailHelper;

	/** UserService */
	@Autowired
	UserService userservice;

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
	public ModelAndView add_ok(Model model,HttpServletResponse response,
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "password", defaultValue = "") String password,
			@RequestParam(value = "passwordcheck", defaultValue = "") String passwordcheck,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "nickname", defaultValue = "") String nickname,
			@RequestParam(value = "email", defaultValue = "") String email,
			@RequestParam(value = "gender", defaultValue = "") String gender,
			@RequestParam(value = "postcode", defaultValue = "") int postcode,
			@RequestParam(value = "addr1", defaultValue = "") String addr1,
			@RequestParam(value = "addr2", defaultValue = "") String addr2,
			@RequestParam(value = "loc_xy", defaultValue = "") String loc_xy,
			@RequestParam(value = "icon", defaultValue = "1") String icon,
			@RequestParam(value = "blockUserflag", defaultValue = "2")String blockUserflag,
			@RequestParam(value = "outUserflag", defaultValue = "2") String outUserflag,
			@RequestParam(value = "checkAll", defaultValue = "") String checkAll) {

		/** 1) 사용자가 입력한 파라미터 유효성 검사 */

		if (!regexHelper.isValue(id)) {return webHelper.redirect(null, "아이디를 입력하세요");}
		if (!regexHelper.isEngNum(id)) {return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다");}
		if (!regexHelper.isValue(password)) {return webHelper.redirect(null, " 비밀번호를 입력하세요");}

		if (!regexHelper.isValue(name)) {return webHelper.redirect(null, "이름을 입력하세요");}
		if (!regexHelper.isKor(name)) {return webHelper.redirect(null, "이름은 한글만 가능합니다");}
		if (!regexHelper.isValue(nickname)) {return webHelper.redirect(null, "닉네임을 입력하세요");}
		if (!regexHelper.isKorEng(nickname)) {return webHelper.redirect(null, "닉네임은 한글, 영어 조합만 가능합니다.");}
		if (!regexHelper.isValue(email)) {return webHelper.redirect(null, "이메일을 입력하세요");}
		if (!regexHelper.isEmail(email)) {return webHelper.redirect(null, "이메일 형식으로 입력하세요");}

		if (!regexHelper.isValue(addr2)) {return webHelper.redirect(null, "상세주소을 입력하세요");}

		if (!regexHelper.isValue(checkAll)) {return webHelper.redirect(null, "약관에 동의해주세요.");}

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
		input.setIcon(icon);
		input.setBlockUserflag(blockUserflag);
		input.setOutUserflag(outUserflag);

		try {
			userservice.addUser(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/" ;
		return webHelper.redirect(redirectUrl, null);
	}
	
	/** 수정 폼 페이지 */
    @RequestMapping(value = "/common/myinfo.do", method = RequestMethod.GET)
    public ModelAndView edit(Model model,HttpServletRequest request,
            @RequestParam(value="userno", defaultValue="0") int userno) {
    	
    	 HttpSession session = request.getSession();
         String mySession = (String) session.getAttribute("output");
         if (mySession == null) {
             mySession = "";
         }
        
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
		model.addAttribute("my_session", session);
        model.addAttribute("output", output);
        model.addAttribute("deptList", userList);
        return new ModelAndView("/myinfo");
    }
    
    /** 수정 폼에 대한 action 페이지 */
    @RequestMapping(value = "/common/myinfo_ok.do", method = RequestMethod.POST)
    public ModelAndView edit_ok(Model model,HttpServletRequest request,
    		@RequestParam(value = "userno", defaultValue = "0") int userno,
    		@RequestParam(value = "nickname", defaultValue = "") String nickname,
    		@RequestParam(value = "email", defaultValue = "") String email,
			@RequestParam(value = "x_password", defaultValue = "") String x_password,
			@RequestParam(value = "new_password", defaultValue = "") String new_password,
			@RequestParam(value = "new_password2", defaultValue = "") String new_password2,
			@RequestParam(value = "postcode", defaultValue = "0") int postcode,
			@RequestParam(value = "addr1", defaultValue = "") String addr1,
			@RequestParam(value = "addr2", defaultValue = "") String addr2,
			@RequestParam(value = "loc_xy", defaultValue = "") String loc_xy,
			@RequestParam(value = "icon", defaultValue = "") String icon,
			@RequestParam(value = "blockUserflag", defaultValue = "2") String blockUserflag,
			@RequestParam(value = "outUserflag", defaultValue = "2") String outUserflag
			){
    	
    	/** 컨트롤러에서 세션을 식별하기 위한 처리 */
        // 세션값은 request 내장객체를 통해서 HttpSession객체를 생성해야 접근할 수 있다.
        // --> Servlet과 동일함.
        HttpSession session = request.getSession();
        
        /** 1) 사용자가 입력한 파라미터 유효성 검사 */
        if (userno == 0)                    { return webHelper.redirect(null, "회원번호가 없습니다"); }

       
		if (!regexHelper.isValue(x_password)) {return webHelper.redirect(null, " 현재 비밀번호를 입력하세요");}
		if (!regexHelper.isValue(new_password)) {return webHelper.redirect(null, " 새 비밀번호를 입력하세요");}
		if (!regexHelper.isValue(new_password2)) {return webHelper.redirect(null, "  비밀번호 확인해주세요.");}

		if (!regexHelper.isValue(nickname)) {return webHelper.redirect(null, "닉네임을 입력하세요");}
		if (!regexHelper.isKorEng(nickname)) {return webHelper.redirect(null, "닉네임은 한글, 영어 조합만 가능합니다.");}
		if (!regexHelper.isValue(email)) {return webHelper.redirect(null, "이메일을 입력하세요");}
		if (!regexHelper.isEmail(email)) {return webHelper.redirect(null, "이메일 형식으로 입력하세요");}

		if (!regexHelper.isValue(addr2)) {return webHelper.redirect(null, "상세주소을 입력하세요");}



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
		input.setIcon(icon);
		input.setBlockUserflag(blockUserflag);
		input.setOutUserflag(outUserflag);
		
		User output = null;

        try {
            userservice.editUser(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        
     // 추출한 값을 View에게 전달
     		session.setAttribute("output",output);
        /** 3) 결과를 확인하기 위한 페이지 이동 */
        String redirectUrl = contextPath + "/main";
        return webHelper.redirect(redirectUrl, "수정되었습니다");
    }
    
    
    /** 삭제 처리 */
    @RequestMapping(value = "/common/delete_ok.do", method = RequestMethod.GET)
    public ModelAndView delete_ok(Model model,
            @RequestParam(value="userno", defaultValue="0") int userno) {
        
        /** 1) 파라미터 유효성 검사 */
        if (userno == 0) {
            return webHelper.redirect(null, " 회원 탈퇴 번호가 없습니다");
        }

        /** 2) 데이터 삭제하기 */
        User input = new User();
        input.setUserNo(userno);

        try {
            userservice.deleteUser(input); // 데이터 삭제
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 페이지 이동 */
        return webHelper.redirect(contextPath + "/common/list.do", "삭제되었습니다");
    }
	

	/** 로그인 작성 폼 페이지 */
	@RequestMapping(value = "/inc/navbar.do", method = RequestMethod.GET)
	public ModelAndView login(Model model,HttpServletRequest request,
			
			@RequestParam(value = "userno", defaultValue = "") int userno) {

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
		return new ModelAndView("/main");
	}
	
	


	/** 로그인 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/common/login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "password", defaultValue = "") String password

	) {

		
		 /** 컨트롤러에서 세션을 식별하기 위한 처리 */
        // 세션값은 request 내장객체를 통해서 HttpSession객체를 생성해야 접근할 수 있다.
        // --> Servlet과 동일함.
        HttpSession session = request.getSession();
        
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

		User output = null;


		try {
			output = userservice.doLogin(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 추출한 값을 View에게 전달
		session.setAttribute("output",output);
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/main";
		return webHelper.redirect(redirectUrl, "직메에 오신것을 환영합니다 ^o^ ");

	}

	
	/** 아이디 찾기 폼 페이지 */
	@RequestMapping(value = "/common/find.do", method = RequestMethod.GET)
	public ModelAndView find(Model model,HttpServletRequest request,
			
			@RequestParam(value = "userno", defaultValue = "") int userno) {

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
	public ModelAndView find_ok(Model model,HttpServletRequest request,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "email", defaultValue = "") String email

	) {
		
		 /** 컨트롤러에서 세션을 식별하기 위한 처리 */
        // 세션값은 request 내장객체를 통해서 HttpSession객체를 생성해야 접근할 수 있다.
        // --> Servlet과 동일함.
        HttpSession session = request.getSession();
		/** 1) 파라미터 유효성 검사 */
		if (!regexHelper.isValue(name)) {
			return webHelper.redirect(null, "이름를 입력하세요");
		}

		if (!regexHelper.isValue(email)) {
			return webHelper.redirect(null, " 이메일를 입력하세요");
		}
		/** 2) 데이터 조회하기 */
		User input = new User();
		input.setName(name);
		input.setEmail(email);

		User output = null;

		try {
			output = userservice.getUserId(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		session.setAttribute("output",output);
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/";
		return webHelper.redirect(redirectUrl, "아이디 찾기 완료");
	}
	
	
	/** 비밀번호 찾기 폼 */
	@RequestMapping(value = "/common/find_pw.do", method = RequestMethod.GET)
	public ModelAndView find_pw(Model model,HttpServletRequest request,
			
			@RequestParam(value = "userno", defaultValue = "") int userno) {

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
		return new ModelAndView("/find_pw");
	}
		
		/** 비밀번호 찾기 action 페이지 */
		@RequestMapping(value = "/common/find_pw_ok.do", method = RequestMethod.POST)
		public ModelAndView find_pw_ok(Model model,HttpServletRequest request,
				@RequestParam(value = "name", defaultValue = "") String name,
				@RequestParam(value = "id", defaultValue = "") String id,
				@RequestParam(value = "email", defaultValue = "") String email

		) {
			
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
			
			
			 /* 인증번호(난수) 생성 */
	        Random random = new Random();
	        int checkNum = random.nextInt(88888) + 11111;
	        log.info("인증번호 " + checkNum);
	        
	        String subject = "비밀번호 재설정 인증 이메일 입니다.";
	        String content = 
	                
	                "인증 번호는 " + checkNum + " 입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			
			
			
			
			/** 2) 데이터 조회하기 */
			User input = new User();
			input.setName(name);
			input.setId(id);
			input.setEmail(email);
			

			User output = null;

			try {
				output = userservice.getUserPw(input);
				mailHelper.sendMail(email, subject, content);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}

			session.setAttribute("output",output);
			/** 3) 결과를 확인하기 위한 페이지 이동 */
			String redirectUrl = contextPath + "/find_pw";
			return webHelper.redirect(redirectUrl, null);
		}
		

	
	
	/** 로그아웃 */
	
	//session.invalidate();
	

	/**
	 * 닉네임 중복 체크 페이지
	 * 
	 * @RequestMapping(value = "/common/checkNick.do", method = RequestMethod.POST)
	 *                       public ModelAndView checkNick(Model model,
	 * @RequestParam(value="nickname", defaultValue="") String nickname ){
	 *                                 log.debug("checkNick 실행"); /** 1) 데이터 저장하기 //
	 *                                 저장할 값들을 Beans에 담는다. User input = new User();
	 *                                 input.setNickname(nickname);
	 * 
	 *                                 // 저장된 결과를 조회하기 위한 객체 List<User> output
	 *                                 =null;
	 * 
	 *                                 try { // 데이터 조회 output=
	 *                                 userservice.checkNick(input); } catch
	 *                                 (Exception e) { return
	 *                                 webHelper.redirect(null,e.getLocalizedMessage());
	 *                                 }
	 * 
	 *                                 /** View 처리
	 *                                 model.addAttribute("output",output);
	 *                                 model.addAttribute("nickname",nickname); //
	 *                                 Map<String, Object> nick_map = new
	 *                                 HashMap<String, Object>(); //
	 *                                 nick_map.put("item", output); return new
	 *                                 ModelAndView("common/main");
	 * 
	 * 
	 * 
	 *                                 }
	 */

}
