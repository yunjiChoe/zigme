package study.spring.zigme.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;

@Slf4j
@Controller
public class ReportController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	
	@RequestMapping(value = "/report/after.do", method = RequestMethod.GET)
	public String write() {
		return "window.close();";
	}
	
	/** action 페이지 */
	@RequestMapping(value="/report/review.do", method=RequestMethod.POST)
	public ModelAndView review_report(Model model,
			@RequestParam(defaultValue = "") String repo_id_input, 
			@RequestParam(defaultValue = "") String repo_content_input,
			@RequestParam(defaultValue = "") String repo_date_input,
			@RequestParam(defaultValue = "") String repo_textarea) {
		
		
		log.debug(">>> repo_id_input " + repo_id_input);
		log.debug(">>> repo_content_input " + repo_content_input);
		log.debug(">>> repo_date_input " + repo_date_input);
		log.debug(">>> repo_textarea " + repo_textarea);
		
		
		/** 입력여부 검사후, 입력되지 않은 경우 이전 페이지로 보내기 */
        // 받는 메일 주소 입력 여부 확인
        if (!regexHelper.isValue(repo_textarea)) {
            return webHelper.redirect(null, "신고사유를 입력해주세요.");
        }
        
        try {
            // sendMail() 메서드 선언시 throws를 정의했기 때문에 예외처리가 요구된다.
            //mailHelper.sendMail(to, subject, content);
        } catch (Exception e) {
            e.printStackTrace();
            return webHelper.redirect(null, "신고 등록에 실패했습니다.");
        }

        /** 결과처리 */
        return webHelper.redirect("/report/after.do", "정상적으로 신고되었습니다.");
		
	}
	

}
