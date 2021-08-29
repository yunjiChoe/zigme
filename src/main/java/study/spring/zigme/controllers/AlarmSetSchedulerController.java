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
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Alarm;
import study.spring.zigme.service.AlarmScheService;

@Slf4j
@RestController
public class AlarmSetSchedulerController {
	
	/** WebHelper 주입 */
    @Autowired  WebHelper webHelper;
    
    @Autowired AlarmScheService alarmScheService;  
    
    /** 알람정보를 가져올 userNo를 세팅한다. 로그인 시에 호출하여 세팅 + main에서 호출 **/
	@RequestMapping(value = "util/sche_alarm.do", method = RequestMethod.POST)
	public Map<String, Object> setuserNo(	   		
			@RequestParam(value="userNo", defaultValue="0") int userNo)	    
	{
		alarmScheService.setAlarmUserNo(userNo);
		
		/* 별 필요 없는 응답임. webHelper에게 map을 안보내면 오류가 생기므로 보냄 */
	    Map<String, Object> data = new HashMap<String, Object>();
	    data.put("item", "success");
	    
	    return webHelper.getJsonData(data);
	}
	
	/** 현재 시각에 울릴 알람 LIST GET **/
	@RequestMapping(value = "util/sche_alarm.get", method = RequestMethod.POST)
	public Map<String, Object> getalarmList()	    
	{
		List<Alarm> output = new ArrayList<Alarm>();
		
		output = alarmScheService.getAlarmListData();
				
	    Map<String, Object> data = new HashMap<String, Object>();
	    data.put("item", output);
	    
	    return webHelper.getJsonData(data);
	}
	
	
    
}
