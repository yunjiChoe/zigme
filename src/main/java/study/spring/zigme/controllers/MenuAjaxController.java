package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Review;
import study.spring.zigme.service.MenuService;


@Controller
public class MenuAjaxController {
	
	/** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired RegexHelper regexHelper;
        
    @Autowired MenuService menuService;
    
    /** review data select */
    @RequestMapping(value = "/menu/menu_condition_list.do", method = RequestMethod.GET)
    public Map<String, Object> get_list(
   		// 음식점 ID 
   		@RequestParam(value="reviewPlaceId", defaultValue="") String reviewPlaceId)
    {
        
        Review input = new Review();
        int review_count = 0;
        
        input.setReviewPlaceId(reviewPlaceId);
        
        Review output = null;   // 조회결과가 저장될 객체        

        try {
        	output = menuService.getReviewItem(input);
        	review_count = menuService.getReviewCount(input);
            
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);
        data.put("count", review_count);
        
        return webHelper.getJsonData(data);
    }

}
