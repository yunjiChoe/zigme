package study.spring.zigme.service;

import java.util.List;

import study.spring.zigme.model.Alarm;
import study.spring.zigme.model.Post;

public interface AlarmService {

	public Alarm getAlarmItem(Alarm input) throws Exception;
	
	public List<Alarm> getAlarmList(Alarm input) throws Exception;
	
	public List<Alarm> getAlarmselList(Alarm input) throws Exception;
			
	public int addAlarm(Alarm input) throws Exception;
	
	public int editAlarm(Alarm input) throws Exception;
	
	public int deleteAlarm(Alarm input) throws Exception;
	
	public int countAlarm(Alarm input) throws Exception;
	
	public String selectAlarmAct(Alarm input) throws Exception;
}
