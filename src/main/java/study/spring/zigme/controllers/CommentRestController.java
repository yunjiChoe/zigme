package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Alarm;
import study.spring.zigme.model.Comment;
import study.spring.zigme.service.CommentService;
import study.spring.zigme.service.PostService;

@RestController
public class CommentRestController {
	
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현제 주입*/
	@Autowired CommentService commentService;
	
	/**목록 페이지 */
	@RequestMapping(value = "/comment", method = RequestMethod.GET)
	public Map<String, Object> get_list(
			@RequestParam(value="postNo", required=false) int postNo){
		
		Comment input = new Comment();
		
		input.setPostNo(postNo);

		List<Comment> output = null;
		
		try {
			output = commentService.getCommentList(input);			
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item_comment", output);
       
        return webHelper.getJsonData(data);
	}
	
	/** 댓글 추가 페이지 */
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public Map<String, Object> add_itemComment(
			@RequestParam(value="commContent", defaultValue = "")String commContent,
			@RequestParam(value="userNo", defaultValue = "0")int userNo,
			@RequestParam(value="postNo", defaultValue = "0")int postNo) {
		
		if (!regexHelper.isValue(commContent))     { return webHelper.getJsonWarning("댓글을 입력하세요."); }      
        if (userNo == 0)                    { return webHelper.getJsonWarning("사용자 일련 번호가 넘어오지 않았습니다."); }
        if (postNo == 0)                    { return webHelper.getJsonWarning("게시글 일련 번호가 넘어오지 않았습니다."); }
        
        Comment input = new Comment();
        
        input.setCommContent(commContent);
        input.setUserNo(userNo);
        input.setPostNo(postNo);
        
        List<Comment> output = null;
        
        try {
        	commentService.addComment(input);        	
        	output = commentService.getCommentList(input);
        	
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
        /** 3) 결과를 확인하기 위한 JSON 출력 */
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("item_comment", output);
        return webHelper.getJsonData(map);
	}
	
	/** 댓글 삭제 페이지 */
	@RequestMapping(value= "/comment", method = RequestMethod.DELETE)
	public Map<String, Object> del_itemComment() {
		return null;
	}
	
}
