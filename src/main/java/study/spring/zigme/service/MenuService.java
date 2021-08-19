package study.spring.zigme.service;

import java.util.List;

import study.spring.zigme.model.Food;
import study.spring.zigme.model.Review;
import study.spring.zigme.model.Scheduler;
import study.spring.zigme.model.UserSetImage;

public interface MenuService {
	
	public List<Review> getReviewList(Review input) throws Exception;
	
	public Review getReviewItem(Review input) throws Exception;
		
	public int getReviewCount(Review input) throws Exception;	
	
	public List<Food> getFoodList(Food input, String flag) throws Exception;
	
	public Food getFoodImgName(Food input) throws Exception;
	
	public int addReviewImg(UserSetImage input) throws Exception;
	
	public UserSetImage getReviewImgItem(UserSetImage input) throws Exception;
	
	public int addReview(Review input) throws Exception;
	
}
