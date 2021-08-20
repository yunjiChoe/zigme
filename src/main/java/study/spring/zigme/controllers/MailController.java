package study.spring.zigme.controllers;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.helper.MailHelper;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.User;
import study.spring.zigme.service.UserService;

@Slf4j
@Controller
public class MailController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	MailHelper mailHelper;
	
	/** UserService */
	@Autowired
	UserService userservice;
	
	/** 발송 폼 구성 페이지 */
	@RequestMapping(value="/mailCheck" ,method = RequestMethod.GET)
	@ResponseBody
	public String write(String email) {
		
		/* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(88888) + 11111;
        log.info("인증번호 " + checkNum);
        
        
       
        String subject = "비밀번호 재설정 인증 이메일 입니다.";
        String content =                 
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
			mailHelper.sendMail(email, subject, content);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String num = Integer.toString(checkNum);  
        return num;
		
	}
	/** action 페이지 */
	@RequestMapping(value="/mail/send.do", method=RequestMethod.POST)
	public ModelAndView send(Model model,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "email", defaultValue = "") String email,
			@RequestParam(defaultValue = "") String to,
			@RequestParam(defaultValue = "") String subject,
			@RequestParam(defaultValue = "") String content) {
		
		/** 입력 여부 검사 후, 입력되지 않은 경우 이전 페이지로 보내기 */
		 // 받는 메일 주소 입력 여부 확인
        if (!regexHelper.isValue(email)) {
            return webHelper.redirect(null, "받는 사람의 이메일 주소를 입력하세요.");
        }

        // 받는 메일 주소 형식 검사
        if (!regexHelper.isEmail(email)) {
            return webHelper.redirect(null, "받는 사람의 이메일 주소가 잘못되었습니다.");
        }

        // 메일 제목 입력 여부 확인
        if (!regexHelper.isValue(subject)) {
            return webHelper.redirect(null, "메일 제목을 입력하세요.");
        }

        // 메일 내용 입력 여부 확인
        if (!regexHelper.isValue(content)) {
            return webHelper.redirect(null, "메일의 내용을 입력하세요.");
        }
        
        /** 2) 데이터 조회하기 */
		User input = new User();
		input.setName(name);
		input.setId(id);
		input.setEmail(email);

		User output = null;
        
		
		/** 메일 발송 처리 */
        try {
        	output = userservice.getUserPw(input);
        	// sendMail() 메서드 선언시  throws를 정의했기 때문에 예외처리가 요구된다.
        	mailHelper.sendMail(to, subject, content);
        } catch (Exception e) {
        	e.printStackTrace();
        	return webHelper.redirect(null, "메일 발송에 실패했습니다.");
        }
		/** 결과 처리 */
        return webHelper.redirect("write.do", "메일 발송에 성공했습니다.");
        
	
			
			
		
	}
}
