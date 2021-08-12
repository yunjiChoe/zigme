package study.spring.zigme.model;

import lombok.Data;

@Data
public class Food {
	private int foodNo;						// 음식의 일련번호, PK 
	private String foodName;				// 음식명
	private String foodCategory;			// 업종
	private String foodWeather;				// 이 음식이 종속되어있는 날씨상태
	private String foodCondition;			// 이 음식이 종속되어있는 컨디션
	private String delFoodflag;				// 음식의 삭제 여부
	
	private String adminImgName;			// 음식이미지 파일명

}
