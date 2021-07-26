package study.spring.zigme.model;

import lombok.Data;

@Data
public class ReportUser {
	private int ReportNo;
	private String ReportFlag;
	private String ReportingUser;    
	private String ReportingContent; 
	private String ReportingDate; 
	private int userNo;
	private int postNo;
	private int commNo;
	private int reviewNo;
}
