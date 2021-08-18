package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
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
import study.spring.zigme.model.User;
import study.spring.zigme.service.UserService;

@Slf4j
@RestController
public class UserRestController {
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
	
	/** 비밀번호 재설정 action  */
	@RequestMapping(value = "/common", method = RequestMethod.PUT)
	public Map<String, Object> find_repw_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "userno", defaultValue = "0") int userno,
			@RequestParam(value = "password", defaultValue = "") String password

	) {

		log.info("컨트롤러 확인");
		/** 컨트롤러에서 세션을 식별하기 위한 처리 */
		// 세션값은 request 내장객체를 통해서 HttpSession객체를 생성해야 접근할 수 있다.
		// --> Servlet과 동일함.
		HttpSession session = request.getSession();
		/** 1) 파라미터 유효성 검사 */
		 if (userno == 0)       	{ return webHelper.getJsonWarning("회원정보가 조회되지 않습니다."); }
		 if (!regexHelper.isValue(password))     	{ return webHelper.getJsonWarning("비밀번호 입력되지 않았습니다."); }
		 
		
		/** 2) 데이터 조회하기 */
		User input = new User();
		input.setUserNo(userno);
		input.setPassword(password);
		

		User output = null;

		try {
			output = userservice.getUserPwRe(input);
		} catch (Exception e) {
			
		}

		session.setAttribute("output", output);
		/** 2) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);
        return webHelper.getJsonData(data);
	}
	
	
	
	
	
	
	/** 아이디 찾기 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/common", method = RequestMethod.GET)
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
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);
        return webHelper.getJsonData(data);
	}

}
