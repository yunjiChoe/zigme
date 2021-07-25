package study.spring.zigme.model;

import lombok.Data;

@Data
public class Noti {
	/** 1) Post 관련 컬럼 */
	private int postNo;
	private String postTitle;
	private String postNoti;
	private int userNo;
	
	/** 2) Comment 관련 컬럼 */
	private int commNo;
	private String commContent;
	private int parentNo;
	private String commNoti;
}
