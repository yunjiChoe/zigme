package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Scheduler;
import study.spring.zigme.service.ScheService;
import study.spring.zigme.service.impl.ScheServiceImpl;

@Slf4j
@RestController
public class ScheRestController {

	/** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired RegexHelper regexHelper;
        
    @Autowired ScheService scheService;
    
    /** 작성 폼에 대한 action 페이지 */
    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public Map<String, Object> post(
            @RequestParam(value="scheCate", defaultValue="") String scheCate,
            @RequestParam(value="scheContent", defaultValue="") String scheContent,
            @RequestParam(value="scheLoc", defaultValue="") String scheLoc,
            @RequestParam(value="scheStartdate", defaultValue="0") String scheStartdate,
            @RequestParam(value="scheEnddate", defaultValue="") String scheEnddate,
            @RequestParam(value="userNo", defaultValue="") int userNo) {
        
        /** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
        // 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
        if (!regexHelper.isValue(scheCate))     	{ return webHelper.getJsonWarning("일정 분류를 선택하세요."); }
        if (!regexHelper.isValue(scheContent))      { return webHelper.getJsonWarning("일정 내용을 입력하세요."); }
        if (!regexHelper.isValue(scheStartdate))      { return webHelper.getJsonWarning("시작일을 입력하세요."); }
        if (!regexHelper.isValue(scheEnddate))      { return webHelper.getJsonWarning("시작일을 입력하세요."); }
        
        // 숫자형으로 선언된 파라미터()
        if (userNo == 0)                    { return webHelper.getJsonWarning("사용자 No는 필수입니다."); }

        /** 2) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
        Scheduler input = new Scheduler();
        input.setScheCate(scheCate);
        input.setScheContent(scheContent);
        input.setScheLoc(scheLoc);
        input.setScheStartdate(scheStartdate);
        input.setScheEnddate(scheEnddate);
        input.setUserNo(userNo);

        // 저장된 결과를 조회하기 위한 객체
        Scheduler output = null;   
        
        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
        	scheService.addScheduler(input);
        	
            // 데이터 조회
            output = scheService.getscheItem(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        log.debug(output.toString());
        
        /** 3) 결과를 확인하기 위한 JSON 출력 */
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("item", output);
        return webHelper.getJsonData(map);
    }	
}
