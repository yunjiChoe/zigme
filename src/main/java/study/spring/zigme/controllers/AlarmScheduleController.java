/**
 * Date : 2021-08-29
 * Writer : 안다솜
 * Content : 스케줄러 task 컨트롤러 - 한시간에 한번씩 수행 -> 인데 테스트를 위해서 1분마다 수행하도록 해놓음. 
 * version : V1.0.0
**/

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
		
		alarmScheService.setAlarmListClear();
		
		for(int i=0; i<list.size(); i++) {
			int hour = Integer.parseInt(list.get(i).getAlarmTime().substring(0, 2));
			
			if(cal.get(Calendar.HOUR_OF_DAY) == hour) {
				alarmScheService.setAlarmList(list.get(i));				
			}
			
		}
	}
	
}
