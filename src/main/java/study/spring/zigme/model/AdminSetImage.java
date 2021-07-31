package study.spring.zigme.model;

import lombok.Data;

@Data
public class AdminSetImage {
	private int adminImgNo;
	private String adminImgName;
	private int adminImgSize;
	private String adminImgPath;
	private String refTableName;
	private int refTableId;
}
