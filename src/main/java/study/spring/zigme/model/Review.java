package study.spring.zigme.model;

import lombok.Data;

/** 
 * Review Data Beans
 * @author dasom
 */
@Data
public class Review {
	
	private int reviewNo;
	private String reviewContent;
	private double reviewScope; 
	private String reviewRegdate;
	private String reviewPlaceId;
	private int userNo;
	private int userImgNo;
	
	// join data
	private String userNickname;
	private String userImgPath;
	
}
