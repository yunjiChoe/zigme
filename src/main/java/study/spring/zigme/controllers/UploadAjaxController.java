package study.spring.zigme.controllers;

import java.io.File;
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
import study.spring.zigme.model.UserSetImage;
import study.spring.zigme.service.MenuService;
import study.spring.zigme.service.ScheService;


@Slf4j
@RestController
public class UploadAjaxController {
	
	 @Autowired WebHelper webHelper;
	 
	 @Autowired MenuService menuService;
	
	/** 리뷰이미지 업로드 **/
	@RequestMapping(value = "/upload.review", method = RequestMethod.POST)
	    public Map<String, Object> post(	   		
	   		@RequestParam(value="uploadreViewImg", defaultValue="") MultipartFile uploadreViewImg)
	    	//@RequestParam(value="review_content", defaultValue="") String review_content)
	    {
			
		 	UploadItem item = null; 
		    UserSetImage input = new UserSetImage();
		    UserSetImage output = new UserSetImage();
		 
			// 업로드 된 파일을 지정된 경로로 복사한다.
			try {
				item = webHelper.saveMultipartFile(uploadreViewImg);
			} catch (Exception e) {
				e.printStackTrace();
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
			
			input.setUserImgName(item.getOrginName());
			input.setUserImgSize((int)item.getFileSize());			
			input.setUserImgPath(item.getFileUrl());
			
			try {
				
				menuService.addReviewImg(input);
				
				// 데이터 조회
	            output = menuService.getReviewImgItem(input);
	            
	        } catch (Exception e) {
	        	 return webHelper.getJsonError(e.getLocalizedMessage());
	        }
			
			/** 4) JSON 출력하기 */
	        Map<String, Object> data = new HashMap<String, Object>();	  
	        
	        data.put("review_item", output);
	        
	        //log.debug("review_item!! " + data);
	                
	        return webHelper.getJsonData(data);
	    
	    }
}
