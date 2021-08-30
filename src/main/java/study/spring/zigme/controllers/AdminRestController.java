package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.AdminStats;
import study.spring.zigme.service.AdminStatsService;

@RestController
public class AdminRestController {
	
	/** WebHelper 주입 */
    @Autowired  WebHelper webHelper;
    
    @Autowired AdminStatsService adminstatsService;
    
    /** 유저통계 select */
    @RequestMapping(value = "/admin/admin_main.do", method = RequestMethod.GET)
    public Map<String, Object> get_data(
    		@RequestParam(value="adminStatisDate", defaultValue="") String adminStatisDate)
    {
        
        AdminStats input = new AdminStats();
        
        input.setAdminStatisDate(adminStatisDate);

        AdminStats output = null;   // 조회결과가 저장될 객체        

        try {            
            output = adminstatsService.getstatsItem(input);
            
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);        
        
        return webHelper.getJsonData(data);
    }
    
    /** scheduler data select */
    @RequestMapping(value = "/admin/admin_main.count", method = RequestMethod.GET)
    public Map<String, Object> get_count(
    		@RequestParam(value="adminStatisDate", defaultValue="") String adminStatisDate)
    {
        
        AdminStats input = new AdminStats();
        
        input.setAdminStatisDate(adminStatisDate);

        int output = 0;   // 조회결과가 저장될 객체        

        try {            
            output = adminstatsService.getstatsCount(input);
            
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);        
        
        return webHelper.getJsonData(data);
    }
    
}
