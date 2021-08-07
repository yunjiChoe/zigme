package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Post;
import study.spring.zigme.service.NotiService;

@RestController
public class NotiRestController {
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현제 주입*/
	@Autowired NotiService notiService;
	
	/**목록 페이지 */
	@RequestMapping(value = "/noti", method = RequestMethod.GET)
	public Map<String, Object> get_list(){
        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Post input1 = new Post();

        List<Post> output1 = null;   // 조회결과가 저장될 객체

        try {
            // 데이터 조회하기
            output1 = notiService.getNotiList(input1);
       
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Post input2 = new Post();
        
        List<Post> output2 = null;   // 조회결과가 저장될 객체
        
        try {
        	// 데이터 조회하기
        	output2 = notiService.getNotiCommList(input2);
        	
        } catch (Exception e) {
        	return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item1", output1);
        data.put("item2", output2);
        return webHelper.getJsonData(data);
        
        
        
    } 
	

}
