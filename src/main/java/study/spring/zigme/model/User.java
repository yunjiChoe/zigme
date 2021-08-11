package study.spring.zigme.model;

import lombok.Data;

@Data
public class User {
	private int  userNo;
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String gender;
	private String postcode;
	private String addr1;
	private String addr2;
	private String loc_xy;
	private String icon;
	private String blockUserflag;
	private String outUserflag;
	
}
