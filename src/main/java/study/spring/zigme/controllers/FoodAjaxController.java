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
import study.spring.zigme.model.Food;
import study.spring.zigme.service.FoodService;

@Controller
public class FoodAjaxController {

	/** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired RegexHelper regexHelper;
    
    /** Service 패턴 구현체 주입 */
    @Autowired FoodService foodService;
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** 목록 페이지 */
    @RequestMapping(value = "/admin/admin_food/list.do", method = RequestMethod.GET)
    public ModelAndView list(Model model,
    		// 검색어
    		@RequestParam(value="keyword", required=false) String keyword) {
    	/** 1) 데이터 조회하기 */
    	// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
    	Food input = new Food();
    	input.setFoodName(keyword);
    	
    	List<Food> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = foodService.getFoods(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	/** 2) View 처리 */
    	model.addAttribute("keyword", keyword);
    	model.addAttribute("output", output);
    	
    	return new ModelAndView("admin/admin_food");
    }
    
    /** 상세 페이지 */
    @RequestMapping(value = "/admin/admin_food/view.do", method = RequestMethod.GET)
    public ModelAndView view(Model model,
    		@RequestParam(value="foodNo", defaultValue="0") int foodNo) {
    	/** 1) 유효성 검사 */
    	if (foodNo == 0) {
    		return webHelper.redirect(null, "음식번호가 없습니다.");
    	}
    	
    	/** 2) 데이터 조회하기 */
    	Food input = new Food();
    	input.setFoodNo(foodNo);
    	
    	// 조회결과를 저장할 객체 선언
    	Food output = null;
    	
    	try {
			// 데이터 조회하기
			output = foodService.getFoodItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	/** 3) View 처리 */
    	model.addAttribute("output", output);
    	return new ModelAndView("admin/admin_food_view");
    }
    
    /** 작성 폼 페이지 */
    @RequestMapping(value = "/admin/admin_food/add.do", method = RequestMethod.GET)
    public ModelAndView add(Model model) {
    	/** 음식 목록 조회하기 */
    	List<Food> output = null;
    	
    	try {
    		// 데이터 조회 -> 검색조건 없이 모든 음식 조회
    		output = foodService.getFoods(null);
    	} catch (Exception e) {
    		return webHelper.redirect(null, e.getLocalizedMessage());
    	}
    	
    	// View에 추가
    	model.addAttribute("output", output);
    	
    	return new ModelAndView("admin/admin_food_add");
    }
    
    /** 수정 폼 페이지 */
    @RequestMapping(value = "/admin/admin_food/edit.do", method = RequestMethod.GET)
    public ModelAndView edit(Model model,
    		@RequestParam(value="foodNo", defaultValue="0") int foodNo) {
    	/** 1) 파라미터 유효성 검사 */
    	if (foodNo == 0) {
    		return webHelper.redirect(null, "음식번호가 없습니다.");
    	}
    	
    	/** 2) 데이터 조회하기 */
    	Food input = new Food();
    	input.setFoodNo(foodNo);
    	
    	// 조회결과를 저장할 객체 선언
    	Food output = null;
    	
    	try {
			// 데이터 조회하기
			output = foodService.getFoodItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	/** 3) View 처리 */
    	model.addAttribute("output", output);
    	return new ModelAndView("admin/admin_food_edit");	
    }
    
}
