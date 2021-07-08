package study.spring.zigme.model;

import lombok.Data;

@Data	
public class Comment {
	
	/** 기본 컬럼들*/
	private int commNo;
	private String commContent;
	private int commUpCount;
	private int parentNo;
	private String commRegdate;
	private String commNoti;
	private int postNo;
	private int userNo;
	
	/** 2) JOIN절에 따른 추가 컬럼 */
	//해당 회원 nickname(user테이블과 join)
	private String nickname;
		
	//해당 회원의 블록 유저 여부(user테이블과 join)
	private String blockUserflag;
		
	//해당 회원의 탈퇴회원 여부(user테이블과 join)
	private String outUserflag;
	
}
