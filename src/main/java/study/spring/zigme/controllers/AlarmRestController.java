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
	
	/** Service 패턴 구현제 주입*/
	@Autowired AlarmService alarmService;
	
	//알람 목록 페이지
	@RequestMapping(value = "/alarm", method = RequestMethod.GET)
	public Map<String, Object> get_list() {
		Alarm input = new Alarm();

		List<Alarm> output = null;
		
		try {
			// 데이터 조회하기
            output = alarmService.getAlarmList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		
		}
		
		/** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("output_alarm", output);
       
        return webHelper.getJsonData(data);
	}
	
	//사용자별 알람 목록 리스트
	/*
	 * @RequestMapping(value = "/alarm", method = RequestMethod.GET) public
	 * Map<String, Object> get_user_list(
	 * 
	 * @RequestParam(value="userNo", defaultValue="0") int userNo) {
	 * 
	 * Alarm input = new Alarm();
	 * 
	 * input.setUserNo(userNo);
	 * 
	 * List<Alarm> output = null;
	 * 
	 * try { // 데이터 조회하기 output = alarmService.getAlarmselList(input); } catch
	 * (Exception e) { return webHelper.getJsonError(e.getLocalizedMessage());
	 * 
	 * }
	 * 
	 * Map<String, Object> data = new HashMap<String, Object>();
	 * data.put("output_alarm", output);
	 * 
	 * return webHelper.getJsonData(data); }
	 */
	
	//알람데이터 삽입에대한 action페이지 구현
	@RequestMapping(value= "/alarm", method = RequestMethod.POST)
	public Map<String, Object> post(
			@RequestParam(value="alarmAct", defaultValue="") String alarmAct,
			@RequestParam(value="alarmTime", defaultValue="") String alarmTime,
			@RequestParam(value="alarmContent", defaultValue="") String alarmContent,
			@RequestParam(value="userNo", defaultValue="0") int userNo){
		
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (!regexHelper.isValue(alarmAct))     { return webHelper.getJsonWarning("알람 활성화를 입력하세요."); }
        if (!regexHelper.isValue(alarmTime))     { return webHelper.getJsonWarning("알람 시간을 입력하세요."); }
        if (!regexHelper.isValue(alarmContent))     { return webHelper.getJsonWarning("알람 내용을 입력하세요.");}        
        if (userNo == 0)                    { return webHelper.getJsonWarning("사용자 일련 번호를 입력하세요."); }
		
        /** 2) 데이터 저장하기 */
        Alarm input = new Alarm();
        input.setAlarmAct(alarmAct);
        input.setAlarmContent(alarmContent);
        input.setUserNo(userNo);
        input.setAlarmTime(alarmTime);
		
		// 저장된 결과를 조회하기 위한 객체
		Alarm output = null;

        try {
               // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            alarmService.addAlarm(input);
            
            output = alarmService.getAlarmItem(input);
            
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("item", output);
        return webHelper.getJsonData(map);
        
	}
	
	/**수정 폼에 대한 action 페이지 */
	@RequestMapping(value= "/alarm", method = RequestMethod.PUT)
	public Map<String, Object> alarm_edit(
			@RequestParam(value="alarmNo", defaultValue="0") int alarmNo,
			@RequestParam(value="alarmAct", defaultValue="") String alarmAct,
			@RequestParam(value="alarmTime", defaultValue="") String alarmTime,
			@RequestParam(value="alarmContent", defaultValue="") String alarmContent,
			@RequestParam(value="userNo", defaultValue="") int userNo) {
		
		
		/** 1)사용자가 입력한 파라미터 유효성 찾기 */
		if (!regexHelper.isValue(alarmTime))     { return webHelper.getJsonWarning("알람시간을 입력하세요."); }
        if (!regexHelper.isValue(alarmContent))     { return webHelper.getJsonWarning("알람내용을 입력하세요."); }
       
        
		/** 2) 데이터 수정하기 */
        //수정할 값들을 Beans에 담는다.
        Alarm input = new Alarm();
        input.setAlarmTime(alarmTime);
        input.setAlarmContent(alarmContent);
        input.setUserNo(userNo);
        input.setAlarmAct(alarmAct);
        input.setAlarmNo(alarmNo);
        
        
		
		//수정된 결과를 조회하기 위한 객체 생성
        List<Alarm> output = null;
		
		try {
			//데이터 수정
			alarmService.editAlarm(input);
			//수정 결과 조회
			output = alarmService.getAlarmList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 JSON출력 */
		 Map<String, Object> map = new HashMap<String, Object>();
	     map.put("item", output);
	     return webHelper.getJsonData(map);
	}
	
	
	/** 삭제 처리 */
	@RequestMapping(value= "/alarm", method = RequestMethod.DELETE)
	public Map<String, Object> delete(
			@RequestParam(value="alarmNo", defaultValue = "0") int alarmNo) {
		
		System.out.println(">>>>>>>>>>>restful로 넘어옴" +alarmNo);
		/** 1) 파라미터 유효성 검사*/
		if(alarmNo == 0) {
			return webHelper.getJsonWarning("알람번호가 없습니다.");
		}
		/** 2) 데이터 삭제하기 */
		//데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Alarm input = new Alarm();
		input.setAlarmNo(alarmNo);
		
		try {
			alarmService.deleteAlarm(input); //데이터 삭제
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 JSON 출력*/
		//확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}
}
