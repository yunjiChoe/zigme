package study.spring.zigme.model;

import lombok.Data;

@Data
public class Post {
	/** 1) 기본 칼럼들 */
	private int postNo;
	private String postSubtitle;
	private String postTitle;
	private String postContent;
	private int postUpcount;
	private int postViewcount;
	private String postRegdate;
	private String postNoti;
	private int userNo;
	
	/** 2) JOIN절에 따른 추가 컬럼 */	
	//해당 회원 nickname(user테이블과 join)
	private String nickname;
	
	//해당 회원의 블록 유저 여부(user테이블과 join)
	private String blockUserflag;
	
	//해당 회원의 탈퇴회원 여부(user테이블과 join)
	private String outUserflag;
	
	/** 3) 페이지 구현을 위한 static 변수 */
    // LIMIT 절에서 사용할 조회 시작 위치 
    private static int offset;
    
    // LIMIT 절에서 사용할 조회할 데이터 수
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
        Post.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
    	Post.listCount = listCount;
    }
}
