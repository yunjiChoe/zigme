package study.spring.zigme.service;

import java.util.ArrayList;
import java.util.List;

import study.spring.zigme.model.Food;
import study.spring.zigme.model.Review;

public interface MenuService {
	
	public List<Review> getReviewList(Review input) throws Exception;
	
	public Review getReviewItem(Review input) throws Exception;
		
	public int getReviewCount(Review input) throws Exception;	
	
	public ArrayList<Food> getFoodList(Food input) throws Exception;
	
}
