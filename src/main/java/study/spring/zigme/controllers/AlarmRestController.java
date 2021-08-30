package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Alarm;
import study.spring.zigme.service.AlarmService;

@RestController
public class AlarmRestController {
	
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 주입*/
	@Autowired AlarmService alarmService;
	

	@RequestMapping(value = "/alarm", method = RequestMethod.GET)
	public Map<String, Object> get_list(
			@RequestParam(value="alarmNo", required=false) int userNo) {
		Alarm input = new Alarm();
		
		input.setUserNo(userNo);

		List<Alarm> output = null;
		
		try {
            output = alarmService.getAlarmselList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		
		}
		
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("output_alarm", output);
       
        return webHelper.getJsonData(data);
	}
		
	//알람 추가 action 페이지 
	@RequestMapping(value= "/alarm", method = RequestMethod.POST)
	public Map<String, Object> post(
			@RequestParam(value="alarmAct", defaultValue="") String alarmAct,
			@RequestParam(value="alarmTime", defaultValue="") String alarmTime,
			@RequestParam(value="alarmContent", defaultValue="") String alarmContent,
			@RequestParam(value="userNo", defaultValue="0") int userNo){
		
		/** 1) 데이터가 잘 넘어왔는지 검사 */
		if (!regexHelper.isValue(alarmAct))     { return webHelper.getJsonWarning("�븣�엺 �솢�꽦�솕瑜� �엯�젰�븯�꽭�슂."); }
        if (!regexHelper.isValue(alarmTime))     { return webHelper.getJsonWarning("�븣�엺 �떆媛꾩쓣 �엯�젰�븯�꽭�슂."); }
        if (!regexHelper.isValue(alarmContent))     { return webHelper.getJsonWarning("�븣�엺 �궡�슜�쓣 �엯�젰�븯�꽭�슂.");}        
        if (userNo == 0)                    { return webHelper.getJsonWarning("�궗�슜�옄 �씪�젴 踰덊샇瑜� �엯�젰�븯�꽭�슂."); }
		
        /** 2) input 데이터 편집 */
        Alarm input = new Alarm();
        input.setAlarmAct(alarmAct);
        input.setAlarmContent(alarmContent);
        input.setUserNo(userNo);
        input.setAlarmTime(alarmTime);
		

		Alarm output = null;

        try {
 
            alarmService.addAlarm(input);
            
            output = alarmService.getAlarmItem(input);
            
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("item", output);
        return webHelper.getJsonData(map);
        
	}
	

	@RequestMapping(value= "/alarm", method = RequestMethod.PUT)
	public Map<String, Object> alarm_edit(
			@RequestParam(value="alarmNo", defaultValue="0") int alarmNo,
			@RequestParam(value="alarmAct", defaultValue="") String alarmAct,
			@RequestParam(value="alarmTime", defaultValue="") String alarmTime,
			@RequestParam(value="alarmContent", defaultValue="") String alarmContent) {
		
		
		/** 1) 데이터가 잘 넘어왔는지 검사 */
		if (!regexHelper.isValue(alarmTime))     { return webHelper.getJsonWarning("�븣�엺�떆媛꾩쓣 �엯�젰�븯�꽭�슂."); }
        if (!regexHelper.isValue(alarmContent))     { return webHelper.getJsonWarning("�븣�엺�궡�슜�쓣 �엯�젰�븯�꽭�슂."); }
       
        /** 2) input 데이터 편집 */
        Alarm input = new Alarm();
        input.setAlarmTime(alarmTime);
        input.setAlarmContent(alarmContent);
        input.setAlarmAct(alarmAct);
        input.setAlarmNo(alarmNo);
        
        
		

        List<Alarm> output = null;
		
		try {

			alarmService.editAlarm(input);

			output = alarmService.getAlarmList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		 Map<String, Object> map = new HashMap<String, Object>();
	     map.put("item", output);
	     return webHelper.getJsonData(map);
	}
	
	
	/** 알람 삭제 페이지 */
	@RequestMapping(value= "/alarm", method = RequestMethod.DELETE)
	public Map<String, Object> delete(
			@RequestParam(value="alarmNo", defaultValue = "0") int alarmNo) {
		
		if(alarmNo == 0) {
			return webHelper.getJsonWarning("알람 일련번호가 넘어오지 않았습니다.");
		}
		
		Alarm input = new Alarm();
		input.setAlarmNo(alarmNo);
		
		try {
			alarmService.deleteAlarm(input); 
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}
}
