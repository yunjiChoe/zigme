package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Food;
import study.spring.zigme.service.FoodService;

@RestController
public class FoodRestController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.zigme.helper.WebHelper;
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	// --> import study.spring.zigme.helper.RegexHelper;
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	// --> import study.spring.zigme.service.FoodService;
	@Autowired FoodService foodService;
	
	/** 목록 페이지 */
	@RequestMapping(value = "/admin_food", method = RequestMethod.GET)
	public Map<String, Object> get_list(
			// 검색어
			@RequestParam(value="keyword", required=false) String keyword) {
		/** 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Food input = new Food();
		input.setFoodName(keyword);
		
		List<Food> output = null; // 조회결과가 저장될 객체
		
		try {
			// 데이터 조회하기
			output = foodService.getFoods(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("keyword", keyword);
		data.put("item", output);
		
		return webHelper.getJsonData(data);
	}
	
	/** 상세 페이지 */
	@RequestMapping(value = "/admin_food/{foodNo}", method = RequestMethod.GET)
	public Map<String, Object> get_item(@PathVariable("foodNo") int foodNo) {
		return null;
	}
	
	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/admin_food", method = RequestMethod.POST)
	public Map<String, Object> post() {
		return null;
	}
	
	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "admin_food", method = RequestMethod.PUT)
	public Map<String, Object> put() {
		return null;
	}
	
	/** 삭제 처리 */
	@RequestMapping(value = "admin_food", method = RequestMethod.DELETE)
	public Map<String, Object> delete() {
		return null;
	}
}
