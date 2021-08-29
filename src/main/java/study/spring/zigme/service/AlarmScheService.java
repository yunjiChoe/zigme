package study.spring.zigme.service;

import java.util.List;

import study.spring.zigme.model.Alarm;

public interface AlarmScheService {
	
	public List<Alarm> getAlarmList() throws Exception;
	public void setAlarmUserNo(int userNo);
	public void setAlarmList(Alarm input);
	public void setAlarmListClear();
	public List<Alarm> getAlarmListData();
}
