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
	
	/** WebHelper 二쇱엯 */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 二쇱엯 */
	@Autowired RegexHelper regexHelper;
	
	/** Service �뙣�꽩 援ы쁽�젣 二쇱엯*/
	@Autowired AlarmService alarmService;
	
	//�븣�엺 紐⑸줉 �럹�씠吏�
	@RequestMapping(value = "/alarm", method = RequestMethod.GET)
	public Map<String, Object> get_list(
			@RequestParam(value="alarmNo", required=false) int userNo) {
		Alarm input = new Alarm();
		
		input.setUserNo(userNo);

		List<Alarm> output = null;
		
		try {
			// �뜲�씠�꽣 議고쉶�븯湲�
            output = alarmService.getAlarmselList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		
		}
		
		/** 3) JSON 異쒕젰�븯湲� */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("output_alarm", output);
       
        return webHelper.getJsonData(data);
	}
	
	//�궗�슜�옄蹂� �븣�엺 紐⑸줉 由ъ뒪�듃
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
	 * try { // �뜲�씠�꽣 議고쉶�븯湲� output = alarmService.getAlarmselList(input); } catch
	 * (Exception e) { return webHelper.getJsonError(e.getLocalizedMessage());
	 * 
	 * }
	 * 
	 * Map<String, Object> data = new HashMap<String, Object>();
	 * data.put("output_alarm", output);
	 * 
	 * return webHelper.getJsonData(data); }
	 */
	
	//�븣�엺�뜲�씠�꽣 �궫�엯�뿉���븳 action�럹�씠吏� 援ы쁽
	@RequestMapping(value= "/alarm", method = RequestMethod.POST)
	public Map<String, Object> post(
			@RequestParam(value="alarmAct", defaultValue="") String alarmAct,
			@RequestParam(value="alarmTime", defaultValue="") String alarmTime,
			@RequestParam(value="alarmContent", defaultValue="") String alarmContent,
			@RequestParam(value="userNo", defaultValue="0") int userNo){
		
		/** 1) �궗�슜�옄媛� �엯�젰�븳 �뙆�씪誘명꽣�뿉 ���븳 �쑀�슚�꽦 寃��궗 */
		// �씪諛� 臾몄옄�뿴 �엯�젰 而щ읆 --> String�쑝濡� �뙆�씪誘명꽣媛� �꽑�뼵�릺�뼱 �엳�뒗 寃쎌슦�뒗 媛믪씠 �엯�젰�릺吏� �븡�쑝硫� 鍮� 臾몄옄�뿴濡� 泥섎━�맂�떎.
		if (!regexHelper.isValue(alarmAct))     { return webHelper.getJsonWarning("�븣�엺 �솢�꽦�솕瑜� �엯�젰�븯�꽭�슂."); }
        if (!regexHelper.isValue(alarmTime))     { return webHelper.getJsonWarning("�븣�엺 �떆媛꾩쓣 �엯�젰�븯�꽭�슂."); }
        if (!regexHelper.isValue(alarmContent))     { return webHelper.getJsonWarning("�븣�엺 �궡�슜�쓣 �엯�젰�븯�꽭�슂.");}        
        if (userNo == 0)                    { return webHelper.getJsonWarning("�궗�슜�옄 �씪�젴 踰덊샇瑜� �엯�젰�븯�꽭�슂."); }
		
        /** 2) �뜲�씠�꽣 ���옣�븯湲� */
        Alarm input = new Alarm();
        input.setAlarmAct(alarmAct);
        input.setAlarmContent(alarmContent);
        input.setUserNo(userNo);
        input.setAlarmTime(alarmTime);
		
		// ���옣�맂 寃곌낵瑜� 議고쉶�븯湲� �쐞�븳 媛앹껜
		Alarm output = null;

        try {
               // --> �뜲�씠�꽣 ���옣�뿉 �꽦怨듯븯硫� �뙆�씪誘명꽣濡� �쟾�떖�븯�뒗 input 媛앹껜�뿉 PK媛믪씠 ���옣�맂�떎.
            alarmService.addAlarm(input);
            
            output = alarmService.getAlarmItem(input);
            
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("item", output);
        return webHelper.getJsonData(map);
        
	}
	
	/**�닔�젙 �뤌�뿉 ���븳 action �럹�씠吏� */
	@RequestMapping(value= "/alarm", method = RequestMethod.PUT)
	public Map<String, Object> alarm_edit(
			@RequestParam(value="alarmNo", defaultValue="0") int alarmNo,
			@RequestParam(value="alarmAct", defaultValue="") String alarmAct,
			@RequestParam(value="alarmTime", defaultValue="") String alarmTime,
			@RequestParam(value="alarmContent", defaultValue="") String alarmContent) {
		
		
		/** 1)�궗�슜�옄媛� �엯�젰�븳 �뙆�씪誘명꽣 �쑀�슚�꽦 李얘린 */
		if (!regexHelper.isValue(alarmTime))     { return webHelper.getJsonWarning("�븣�엺�떆媛꾩쓣 �엯�젰�븯�꽭�슂."); }
        if (!regexHelper.isValue(alarmContent))     { return webHelper.getJsonWarning("�븣�엺�궡�슜�쓣 �엯�젰�븯�꽭�슂."); }
       
        
		/** 2) �뜲�씠�꽣 �닔�젙�븯湲� */
        //�닔�젙�븷 媛믩뱾�쓣 Beans�뿉 �떞�뒗�떎.
        Alarm input = new Alarm();
        input.setAlarmTime(alarmTime);
        input.setAlarmContent(alarmContent);
        input.setAlarmAct(alarmAct);
        input.setAlarmNo(alarmNo);
        
        
		
		//�닔�젙�맂 寃곌낵瑜� 議고쉶�븯湲� �쐞�븳 媛앹껜 �깮�꽦
        List<Alarm> output = null;
		
		try {
			//�뜲�씠�꽣 �닔�젙
			alarmService.editAlarm(input);
			//�닔�젙 寃곌낵 議고쉶
			output = alarmService.getAlarmList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 寃곌낵瑜� �솗�씤�븯湲� �쐞�븳 JSON異쒕젰 */
		 Map<String, Object> map = new HashMap<String, Object>();
	     map.put("item", output);
	     return webHelper.getJsonData(map);
	}
	
	
	/** �궘�젣 泥섎━ */
	@RequestMapping(value= "/alarm", method = RequestMethod.DELETE)
	public Map<String, Object> delete(
			@RequestParam(value="alarmNo", defaultValue = "0") int alarmNo) {
		
		System.out.println(">>>>>>>>>>>restful濡� �꽆�뼱�샂" +alarmNo);
		/** 1) �뙆�씪誘명꽣 �쑀�슚�꽦 寃��궗*/
		if(alarmNo == 0) {
			return webHelper.getJsonWarning("�븣�엺踰덊샇媛� �뾾�뒿�땲�떎.");
		}
		/** 2) �뜲�씠�꽣 �궘�젣�븯湲� */
		//�뜲�씠�꽣 �궘�젣�뿉 �븘�슂�븳 議곌굔媛믪쓣 Beans�뿉 ���옣�븯湲�
		Alarm input = new Alarm();
		input.setAlarmNo(alarmNo);
		
		try {
			alarmService.deleteAlarm(input); //�뜲�씠�꽣 �궘�젣
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 寃곌낵瑜� �솗�씤�븯湲� �쐞�븳 JSON 異쒕젰*/
		//�솗�씤�븷 ���긽�씠 �궘�젣�맂 寃곌낵媛믩쭔 OK濡� �쟾�떖
		return webHelper.getJsonData();
	}
}
