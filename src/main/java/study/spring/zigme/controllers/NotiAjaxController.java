package study.spring.zigme.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Post;
import study.spring.zigme.service.NotiService;

@Controller
public class NotiAjaxController {
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현제 주입*/
	@Autowired NotiService notiService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /**목록 페이지 */
	@RequestMapping(value = "/noti/noti_view_test.do", method = RequestMethod.GET)
	public ModelAndView list(Model model,
			@RequestParam(value = "userNo", defaultValue = "0") int userNo,
			HttpSession session, RedirectAttributes redirectAttr){
		
		
        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Post input1 = new Post();
		input1.setUserNo(userNo);
		//System.out.println(">>>>컨트롤러(게시글 댓글) userno>>>>" + userNo);

        List<Post> output1 = null;   // 조회결과가 저장될 객체

        try {
            // 데이터 조회하기
            output1 = notiService.getNotiList(input1);
       
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        
        /** 2) 데이터 조회하기 */
        Post input2 = new Post();
        input2.setUserNo(userNo);
        //System.out.println(">>>>컨트롤러(대댓글) userno>>>>" + userNo);
        List<Post> output2 = null;   // 조회결과가 저장될 객체
        
        try {
        	// 데이터 조회하기
        	output2 = notiService.getNotiCommList(input2);
        	
        } catch (Exception e) {
        	return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        /** view 처리 */
        model.addAttribute("output1", output1);
        model.addAttribute("output2", output2);
        
        return new ModelAndView("common/noti");
        
    } 
}
