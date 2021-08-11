package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.User;
import study.spring.zigme.service.UserService;

@RestController
public class IdCheckController {
	/** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;
    
    /** UserService */
	@Autowired
	UserService userservice;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
    
	/** 상세 페이지*/
    @RequestMapping(value = "/common", method = RequestMethod.POST)
    public Map<String, Object> get_item(@RequestParam("id") String id) {

        /** 1) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        User input = new User();
        input.setId(id);

        // 조회결과를 저장할 객체 선언
        int output = 0;        
        try {
            // 데이터 조회
        	output = userservice.checkId(input);
        } catch (Exception e) {
           // return webHelper.getJsonError(e.getLocalizedMessage());
        }
      
        
        
        /** 2) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("result", output);
        return webHelper.getJsonData(data);
    } 
   
}
