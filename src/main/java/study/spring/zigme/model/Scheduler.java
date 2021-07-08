package study.spring.zigme.model;

import lombok.Data;

/** 
 * main의 calendar 일정 beans
 * @author dasom
 */
@Data 
public class Scheduler {
	
	private int scheNo;
	private String scheCate;
	private String scheContent;
	private String scheLoc;
	private String scheStartdate;
	private String scheEnddate;
	private int userNo;
	
}
