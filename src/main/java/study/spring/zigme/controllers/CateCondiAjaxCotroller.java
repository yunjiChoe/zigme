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

import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.AdminCateCondiData;
import study.spring.zigme.service.CatecondiService;

@Controller
public class CateCondiAjaxCotroller {
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
    		@RequestParam(value="keyword",required = false) String keyword) {
    	
    	/** 데이터 조회하기 */
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

        /** View 처리 */
        model.addAttribute("keyword", keyword);
        model.addAttribute("output", output);

        return new ModelAndView("admin/admin_catecondi");
    }
    
    /** 상세 페이지 */
    @RequestMapping(value = "/admin/admin_catecondi/view.do", method = RequestMethod.GET)
    public ModelAndView view(Model model,
    		@RequestParam(value="cateCondiNo", defaultValue="0") int cateCondiNo) {
    	/** 1) 유효성 검사 */
    	if (cateCondiNo == 0) {
    		return webHelper.redirect(null, "업종/컨디션번호가 조회되지 않습니다.");
    	}
    	
    	/** 2) 데이터 조회하기 */
    	AdminCateCondiData input = new AdminCateCondiData();
    	input.setCateCondiNo(cateCondiNo);
    	
    	// 조회결과를 저장할 객체 선언
    	AdminCateCondiData output = null;
    	
    	try {
			// 데이터 조회하기
			output = scadminService.getAdminCateCondiDataItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	/** 3) View 처리 */
    	model.addAttribute("output", output);
    	return new ModelAndView("admin/admin_catecondi_view");
    }
    
    /** 작성 폼 페이지 */
    @RequestMapping(value = "/admin/admin_catecondi/add.do", method = RequestMethod.GET)
    public ModelAndView add(Model model) {
    	/** 음식 목록 조회하기 */
    	List<AdminCateCondiData> output = null;
    	
    	try {
    		// 데이터 조회 -> 검색조건 없이 모든 음식 조회
    		output = scadminService.getAdminCateCondiDataList(null);
    	} catch (Exception e) {
    		return webHelper.redirect(null, e.getLocalizedMessage());
    	}
    	
    	// View에 추가
    	model.addAttribute("output", output);
    	
    	return new ModelAndView("admin/admin_catecondi_add");
    }
    
    /** 수정 폼 페이지 */
    @RequestMapping(value = "/admin/admin_catecondi/edit.do", method = RequestMethod.GET)
    public ModelAndView edit(Model model,
    		@RequestParam(value="cateCondiNo", defaultValue="0") int cateCondiNo) {
    	/** 1) 파라미터 유효성 검사 */
    	if (cateCondiNo == 0) {
    		return webHelper.redirect(null, "업종/컨디션번호가 조회되지 않습니다.");
    	}
    	
    	/** 2) 데이터 조회하기 */
    	AdminCateCondiData input = new AdminCateCondiData();
    	input.setCateCondiNo(cateCondiNo);
    	
    	// 조회결과를 저장할 객체 선언
    	AdminCateCondiData output = null;
    	
    	try {
			// 데이터 조회하기
			output = scadminService.getAdminCateCondiDataItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	/** 3) View 처리 */
    	model.addAttribute("output", output);
    	return new ModelAndView("admin/admin_catecondi_edit");	
    }
}
