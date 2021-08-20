package study.spring.zigme.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.AdminCateCondiData;
import study.spring.zigme.service.CatecondiService;

@Slf4j
@Controller
public class CatecodiCotroller {
	/** WebHelper 주입 */
	// --> import org.springframwork.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	// --> import study.springspringhelper.helper.RegexHelper;
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
    // --> import study.spring.springhelper.service.ProfessorService;
    @Autowired  CatecondiService scadminService;

	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframwork.beans.factory.annotation.Value;
	@Value ("#{servletContext.contextPath}")
	String contextPath;
	
	 /** 목록 페이지 */
    @RequestMapping(value = "/admin/admin_catecondi/list.do", method = RequestMethod.GET)
    public ModelAndView list(Model model,
    		// 검색어
    		@RequestParam(value="keyword",required = false) String keyword,
    		//펭지 구현에서 사용할 현재 페이지 번호
    		@RequestParam(value="page", defaultValue="1") int nowPage) {
    		
    	/** 1) 페이지 구현에 필요한 변수값 생성 */
    	int totalCount = 0;  //전체 게시글 수
    	int listCount =10;   // 한 페이지당 표시할 목록 수
    	int pageCount =5;    // 한 그룹당 표시할 페이지 번호 수
    	
    	/** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        AdminCateCondiData input = new AdminCateCondiData();
        input.setCateCondiName(keyword);

        List<AdminCateCondiData> output = null;   // 조회결과가 저장될 객체
        
        try {
        	// 데이터 조회하기
            output = scadminService.getAdminCateCondiDataList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("keyword", keyword);
        model.addAttribute("output", output);

        return new ModelAndView("admin/admin_catecondi");
    }
}
