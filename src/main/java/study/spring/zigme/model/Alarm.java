package study.spring.zigme.model;

import lombok.Data;

@Data
public class Alarm {
	private int alarmNo;
	private String alarmAct;
	private String alarmContent;
	private String alarmTime;
	private int userNo;
	private String alarmDate;
}
