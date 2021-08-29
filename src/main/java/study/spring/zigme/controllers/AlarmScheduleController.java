package study.spring.zigme.controllers;


import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.Alarm;
import study.spring.zigme.service.AlarmScheService;

@Slf4j
@Controller
public class AlarmScheduleController {
		
	@Autowired AlarmScheService alarmScheService;   
	
	public void everyHours() {
		Calendar cal = Calendar.getInstance();
		
		List<Alarm> list = null; 
		
		try {
			list = alarmScheService.getAlarmList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		log.debug("한시간 단위로 실행되는 작업 >> " + list);
		
		for(int i=0; i<list.size(); i++) {
			int hour = Integer.parseInt(list.get(i).getAlarmTime().substring(0, 2));
			log.debug("Integer : " + Integer.toString(cal.get(Calendar.HOUR_OF_DAY)));
			
			if(cal.get(Calendar.HOUR_OF_DAY) == hour) {
				alarmScheService.setAlarmList(list.get(i));				
			}
			
		}
	}
	
}
