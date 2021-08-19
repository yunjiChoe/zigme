package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.helper.UploadItem;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Review;
import study.spring.zigme.model.Scheduler;
import study.spring.zigme.model.UserSetImage;
import study.spring.zigme.service.MenuService;

@Slf4j
@RestController
public class ReviewAjaxController {
	
	 @Autowired WebHelper webHelper;
	 
	 @Autowired MenuService menuService;
	 
	 /** 리뷰이미지 업로드 **/
		@RequestMapping(value = "/menu/review.write", method = RequestMethod.POST)
	    public Map<String, Object> post(	   		
	   		@RequestParam(value="reviewContent", defaultValue="") String reviewContent,
	    	@RequestParam(value="reviewScope", defaultValue="") float reviewScope,
	    	@RequestParam(value="reviewRegdate", defaultValue="") String reviewRegdate,
	    	@RequestParam(value="reviewPlaceId", defaultValue="") String reviewPlaceId,
	    	@RequestParam(value="userNo", defaultValue="0") int userNo,
	    	@RequestParam(value="userImgNo", defaultValue="0") int userImgNo)
	    {	
			
			/** 2) 데이터 저장하기 */
	        // 저장할 값들을 Beans에 담는다.
	        Review input = new Review();
	        input.setReviewContent(reviewContent);
	        input.setReviewScope(reviewScope);
	        input.setReviewRegdate(reviewRegdate);
	        input.setReviewPlaceId(reviewPlaceId);
	        input.setUserNo(userNo);
	        input.setUserImgNo(userImgNo);
	        
	        // 저장된 결과를 조회하기 위한 객체
	        int result = 0;   
	        
	        try {
	            // 데이터 저장
	            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
	        	result = menuService.addReview(input);
	        	
	        } catch (Exception e) {
	            return webHelper.getJsonError(e.getLocalizedMessage());
	        }
	        
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("item", result); // 안씀
	        return webHelper.getJsonData(map);
	    
	    }
	
}
