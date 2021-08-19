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
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// --> import study.spring.zigme.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	// --> import study.spring.zigme.service.FoodService;
	@Autowired
	FoodService foodService;

	/** 목록 페이지 */
	@RequestMapping(value = "/admin/admin_food", method = RequestMethod.GET)
	public Map<String, Object> get_list(
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword) {
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
	@RequestMapping(value = "/admin/admin_food/{foodNo}", method = RequestMethod.GET)
	public Map<String, Object> get_item(@PathVariable("foodNo") int foodNo) {
		/** 1) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Food input = new Food();
		input.setFoodNo(foodNo);

		// 조회 결과를 저장할 객체 선언
		Food output = null;

		try {
			// 데이터 조회
			output = foodService.getFoodItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 2) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);

		return webHelper.getJsonData(data);
	}

	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/admin/admin_food", method = RequestMethod.POST)
	public Map<String, Object> post(@RequestParam(value = "foodName", defaultValue = "") String foodName,
			@RequestParam(value = "foodCategory", defaultValue = "") String foodCategory,
			@RequestParam(value = "foodWeather", defaultValue = "") String foodWeather,
			@RequestParam(value = "foodCondition", defaultValue = "") String foodCondition,
			@RequestParam(value = "delFoodflag", defaultValue = "N") String delFoodflag) {
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 -> String으로 파라미터가 선언 되어있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (!regexHelper.isValue(foodName)) {
			return webHelper.getJsonWarning("음식 이름을 입력하세요.");
		}
		if (!regexHelper.isKor(foodName)) {
			return webHelper.getJsonWarning("음식 이름은 한글만 가능합니다.");
		}
		if (!regexHelper.isValue(foodCategory)) {
			return webHelper.getJsonWarning("업종을 선택하세요.");
		}
		if (!regexHelper.isValue(delFoodflag)) {
			return webHelper.getJsonWarning("삭제여부를 선택하세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Food input = new Food();
		input.setFoodName(foodName);
		input.setFoodCategory(foodCategory);
		input.setFoodWeather(foodWeather);
		input.setFoodCondition(foodCondition);
		input.setDelFoodflag(delFoodflag);

		// 저장된 결과를 조회하기 위한 객체
		Food output = null;

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			foodService.addFood(input);

			// 데이터 조회
			output = foodService.getFoodItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);

		return webHelper.getJsonData(map);
	}

	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/admin/admin_food", method = RequestMethod.PUT)
	public Map<String, Object> put(
			@RequestParam(value = "foodNo", defaultValue="0") int foodNo,
			@RequestParam(value = "foodName", defaultValue = "") String foodName,
			@RequestParam(value = "foodCategory", defaultValue = "") String foodCategory,
			@RequestParam(value = "foodWeather", defaultValue = "") String foodWeather,
			@RequestParam(value = "foodCondition", defaultValue = "") String foodCondition,
			@RequestParam(value = "delFoodflag", defaultValue = "N") String delFoodflag) {
		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		if (foodNo == 0) {
			return webHelper.getJsonWarning("음식번호가 없습니다.");
		}
		if (!regexHelper.isValue(foodName)) {
			return webHelper.getJsonWarning("음식 이름을 입력하세요.");
		}
		if (!regexHelper.isKor(foodName)) {
			return webHelper.getJsonWarning("음식 이름은 한글만 가능합니다.");
		}
		if (!regexHelper.isValue(foodCategory)) {
			return webHelper.getJsonWarning("업종을 선택하세요.");
		}
		if (!regexHelper.isValue(delFoodflag)) {
			return webHelper.getJsonWarning("삭제여부를 선택하세요.");
		}

		/** 2) 데이터 수정하기 */
		// 수정할 값들을 Beans에 담는다.
		Food input = new Food();
		input.setFoodNo(foodNo);
		input.setFoodName(foodName);
		input.setFoodCategory(foodCategory);
		input.setFoodWeather(foodWeather);
		input.setFoodCondition(foodCondition);
		input.setDelFoodflag(delFoodflag);

		// 저장된 결과를 조회하기 위한 객체
		Food output = null;

		try {
			// 데이터 수정
			foodService.editFood(input);

			// 수정 결과 조회
			output = foodService.getFoodItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);

		return webHelper.getJsonData(map);
	}

	/** 삭제 처리 */
	@RequestMapping(value = "/admin/admin_food", method = RequestMethod.DELETE)
	public Map<String, Object> delete(
			@RequestParam(value="foodNo", defaultValue="0") int foodNo) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (foodNo == 0) {
			return webHelper.getJsonWarning("음식 번호가 없습니다.");
		}
		
		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Food input = new Food();
		input.setFoodNo(foodNo);
		
		try {
			foodService.deleteFood(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}
}
