package study.spring.zigme.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Food;
import study.spring.zigme.model.Review;
import study.spring.zigme.service.MenuService;

@Slf4j
@RestController
public class MenuAjaxController {
	
	/** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired RegexHelper regexHelper;
        
    @Autowired MenuService menuService;
    
    /** review data select */
    @RequestMapping(value = "/menu/menu_list.review", method = RequestMethod.GET)
    public Map<String, Object> get_list(
   		// 음식점 ID 
   		@RequestParam(value="reviewPlaceId", defaultValue="") String reviewPlaceId)
    {
        
        Review input = new Review();
        int review_count = 0;        
        
        input.setReviewPlaceId(reviewPlaceId);
        
        List<Review> output = null;   // 조회결과가 저장될 객체        

        try {
        	output = menuService.getReviewList(input);
        	review_count = menuService.getReviewCount(input);
            
        } catch (Exception e) {
        	 return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("list", output);
        data.put("count", review_count);
                
        return webHelper.getJsonData(data);
    }
    
    /** review img name select */
    @RequestMapping(value = "/menu/menu_list.img", method = RequestMethod.GET)
    public Map<String, Object> get_name(
   		// 리뷰 NO 
   		@RequestParam(value="reviewNo", defaultValue="0") int reviewNo)
    {
        
        Review input = new Review();
                
        input.setReviewNo(reviewNo);
        
        Review output = null;   // 조회결과가 저장될 문자열        

        try {
        	output = menuService.getReviewItem(input);
        	            
        } catch (Exception e) {
        	 return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("img_name", output);        
                
        return webHelper.getJsonData(data);
    }
    
    /** food list select */
    @RequestMapping(value = "/menu/menu_list.select", method = RequestMethod.GET)
    public Map<String, Object> get_food_list(
   		// 
   		@RequestParam(value="select_item[]", defaultValue="") ArrayList<Integer> select_item,
   		@RequestParam(value="weather_item", defaultValue="") String weather_item,
   		@RequestParam(value="menu_txt[]", defaultValue="") ArrayList<String> menu_txt,
   		@RequestParam(value="flag", defaultValue="") String flag
   		)
    {        
        Food input = new Food();
        String query = new String();
        List<Food> output = null;
        Map<String, Object> output_list = new HashMap<String, Object>();   
        int j = 0;
        
        if(flag.indexOf("weather") != 0) {
	        
        	for(int i=0; i<select_item.size(); i++) {
	        	if(select_item.get(i) == 1) {        		
	        		query = menu_txt.get(i);
	        		
	        		if(flag.indexOf("cate") == 0)
	        			input.setFoodCategory(query.replace(" ", ""));
	        		else
	        			input.setFoodCondition(query.replace(" ", ""));
	
	                try {
	                	output = menuService.getFoodList(input, flag);                	            
	                } catch (Exception e) {
	                	 return webHelper.getJsonError(e.getLocalizedMessage());
	                }
	                
	                output_list.put(String.valueOf(j), output);
	                j++;
	        	}
	        	
	        }    
        }
        else {
        		query = weather_item;
    			input.setFoodWeather(query.replace(" ", ""));
    			
            try {            	
            	output = menuService.getFoodList(input, flag);            	
            } catch (Exception e) {
            	 return webHelper.getJsonError(e.getLocalizedMessage());
            }        
            
            output_list.put(String.valueOf(0), output);
        	
        }
                
        return webHelper.getJsonData(output_list);
    }
    
    /** food img name select */
    @RequestMapping(value = "/menu/menu_food.img", method = RequestMethod.GET)
    public Map<String, Object> get_foodImgname(
   		@RequestParam(value="food_name", defaultValue="") String food_name)
    {
        
        Food input = new Food();                
        input.setFoodName(food_name);        
        Food output = new Food();   // 조회결과가 저장될 문자열        

        try {
        	output = menuService.getFoodImgName(input);
        	
        } catch (Exception e) {
        	 return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("food_name", output.getFoodName());
        data.put("img_name", output.getAdminImgName());
                
        return webHelper.getJsonData(data);
    }

}
