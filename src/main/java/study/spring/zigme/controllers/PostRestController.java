package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.zigme.helper.PageData;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Post;
import study.spring.zigme.service.PostService;

@RestController
public class PostRestController {
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현제 주입*/
	@Autowired PostService postService;
	
	/**목록 페이지 */
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public Map<String, Object> get_list(
            // 검색어
            @RequestParam(value="keyword", required=false) String keyword,
            // 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value="page", defaultValue="1") int nowPage) {
        
        /** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 10;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Post input = new Post();
        input.setPostTitle(keyword);

        List<Post> output = null;   // 조회결과가 저장될 객체
        PageData pageData = null;        // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = postService.getPostCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Post.setOffset(pageData.getOffset());
            Post.setListCount(pageData.getListCount());
            
            // 데이터 조회하기
            output = postService.getPostList(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("keyword", keyword);
        data.put("item", output);
        data.put("meta", pageData);
        return webHelper.getJsonData(data);
    } 
	
	/**상세 페이지 */
	@RequestMapping(value= "/help/{postNo}", method = RequestMethod.GET)
	public Map<String, Object> get_item(@PathVariable("postNo") int postNo) {
		
		/** 1) 데이터 조회하기*/
		//데이터 조회에 필요한 조건값을 Beans에 저장하기
		Post input = new Post();
		int updateCount = 0;
		input.setPostNo(postNo);
		
		//조회결과를 저장할 객체 선언
		Post output = null;
		
		try {
			//데이터 조회
			output = postService.getPostItem(input);
		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		/** 2)JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		
		return webHelper.getJsonData(data);
	}
	
	/**작성 폼에 대한 action 페이지 */
	@RequestMapping(value= "/help", method = RequestMethod.POST)
	public Map<String, Object> post(
			@RequestParam(value="postSubtitle", defaultValue="") String postSubtitle,
			@RequestParam(value="postTitle", defaultValue="") String postTitle,
			@RequestParam(value="postContent", defaultValue="") String postContent,
			@RequestParam(value="userNo", defaultValue="") int userNo) {
		
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
        if (!regexHelper.isValue(postSubtitle))     { return webHelper.getJsonWarning("말머리를 선택하세요."); }
        if (!regexHelper.isValue(postTitle))     { return webHelper.getJsonWarning("제목을 입력하세요."); }
        if (!regexHelper.isValue(postContent))     { return webHelper.getJsonWarning("내용을 입력하세요."); }
        if (userNo == 0)     { return webHelper.getJsonWarning("회원 일련번호가 넘어오지 않았습니다."); }
		
        /** 2) 데이터 저장하기 */
		Post input = new Post();
		input.setPostSubtitle(postSubtitle);
		input.setPostTitle(postTitle);
		input.setPostContent(postContent);
		input.setUserNo(userNo);
		
		// 저장된 결과를 조회하기 위한 객체
		Post output = null;

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            postService.addPost(input);
            
            // 데이터 조회
            output = postService.getPostItem(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 JSON 출력 */
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("item", output);
        return webHelper.getJsonData(map);
	}
	/**수정 폼에 대한 action 페이지 */
	@RequestMapping(value= "/help", method = RequestMethod.PUT)
	public Map<String, Object> post(
			@RequestParam(value="postNo", defaultValue="0") int postNo,
			@RequestParam(value="postSubtitle", defaultValue="") String postSubtitle,
			@RequestParam(value="postTitle", defaultValue="") String postTitle,
			@RequestParam(value="postContent", defaultValue="") String postContent) {
		
		/** 1)사용자가 입력한 파라미터 유효성 찾기 */
		if (!regexHelper.isValue(postSubtitle))     { return webHelper.getJsonWarning("소제목을 입력하세요."); }
        if (!regexHelper.isValue(postTitle))     { return webHelper.getJsonWarning("제목을 입력하세요."); }
        if (!regexHelper.isValue(postContent))     { return webHelper.getJsonWarning("내용을 입력하세요."); }
        // 숫자형으로 선언된 파라미터()
        if (postNo == 0)                    { return webHelper.getJsonWarning("게시글 일련 번호를 입력하세요."); }
        
		/** 2) 데이터 수정하기 */
        //수정할 값들을 Beans에 담는다.
        Post input = new Post();
        input.setPostNo(postNo);
		input.setPostSubtitle(postSubtitle);
		input.setPostTitle(postTitle);
		input.setPostContent(postContent);
		
		//수정된 결과를 조회하기 위한 객체 생성
		Post output = null;
		
		try {
			//데이터 수정
			postService.editPost(input);
			//수정 결과 조회
			output = postService.getPostItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 JSON출력 */
		 Map<String, Object> map = new HashMap<String, Object>();
	     map.put("item", output);
	     return webHelper.getJsonData(map);
	}
	
	/** 삭제 처리 */
	@RequestMapping(value= "/help", method = RequestMethod.DELETE)
	public Map<String, Object> delete(
			@RequestParam(value="postNo", defaultValue = "0") int postNo) {
		
		System.out.println("restful로 넘어옴");
		/** 1) 파라미터 유효성 검사*/
		if(postNo == 0) {
			return webHelper.getJsonWarning("게시글번호가 없습니다.");
		}
		/** 2) 데이터 삭제하기 */
		//데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Post input = new Post();
		input.setPostNo(postNo);
		
		try {
			postService.deletePost(input); //데이터 삭제
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 JSON 출력*/
		//확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}
}
