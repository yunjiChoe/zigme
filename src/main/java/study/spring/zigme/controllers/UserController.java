package study.spring.zigme.controllers;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.User;
import study.spring.zigme.service.UserService;

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

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 회원가입 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/common/join_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model, @RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "password", defaultValue = "") String password,
			@RequestParam(value = "passwordcheck", defaultValue = "") String passwordcheck,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "nickname", defaultValue = "") String nickname,
			@RequestParam(value = "email", defaultValue = "") String email,
			@RequestParam(value = "gender", defaultValue = "0") int gender,
			@RequestParam(value = "postcode", defaultValue = "") int postcode,
			@RequestParam(value = "addr1", defaultValue = "") String addr1,
			@RequestParam(value = "addr2", defaultValue = "") String addr2,
			@RequestParam(value = "loc_xy", defaultValue = "") String loc_xy,
			@RequestParam(value = "icon", defaultValue = "0") int icon,
			@RequestParam(value = "blockUserflag", defaultValue = "0") int blockUserflag,
			@RequestParam(value = "outUserflag", defaultValue = "0") int outUserflag,
			@RequestParam(value = "checkAll", defaultValue = "") String checkAll) {

		/** 1) 사용자가 입력한 파라미터 유효성 검사 */

		if (!regexHelper.isValue(id)) {
			return webHelper.redirect(null, "아이디를 입력하세요");
		}
		if (!regexHelper.isEngNum(id)) {
			return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다");
		}
		if (!regexHelper.isValue(password)) {
			return webHelper.redirect(null, " 비밀번호를 입력하세요");
		}

		if (!regexHelper.isValue(name)) {
			return webHelper.redirect(null, "이름을 입력하세요");
		}
		if (!regexHelper.isKor(name)) {
			return webHelper.redirect(null, "이름은 한글만 가능합니다");
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

		if (!regexHelper.isValue(addr2)) {
			return webHelper.redirect(null, "상세주소을 입력하세요");
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
		input.setLoc_xy("x, y");
		input.setIcon(1);
		input.setBlockUserflag(1);
		input.setOutUserflag(2);

		try {
			userservice.addUser(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/";
		return webHelper.redirect(redirectUrl, null);
	}

	/** 로그인 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/common/login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model, @RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "password", defaultValue = "") String password) {

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
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/main";
		return webHelper.redirect(redirectUrl, "로그인 완료");

	}
	
	
	
	/** 아이디 찾기 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/common/find_ok.do", method = RequestMethod.POST)
	public ModelAndView find_ok(Model model,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "email", defaultValue = "") String email
			) {
		
		if (!regexHelper.isValue(name)) {
			return webHelper.redirect(null, "이름를 입력하세요");
		}
		
		if (!regexHelper.isValue(email)) {
			return webHelper.redirect(null, " 이메일를 입력하세요");
		}
		
		User input = new User();
		
		input.setName(name);
		input.setEmail(email);
		
		
		User output = null;
		
		try {
			output = userservice.getUserId(input);
			
		}catch (Exception e){
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/";
		return webHelper.redirect(redirectUrl, "아이디 찾기 완료");
	}

}
