package study.spring.zigme.service;

import study.spring.zigme.model.Review;

public interface MenuService {
	
	public Review getReviewItem(Review input) throws Exception;
	
	public int getReviewCount(Review input) throws Exception;	
	
}
