package study.spring.zigme.model;

import lombok.Data;

@Data
public class Post {
	private int postNo;
	private String postSubtitle;
	private String postTitle;
	private String pageContent;
	private int postUpcount;
	private int postViewcount;
	private String postRegdate;
	
}
