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
	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public Map<String, Object> get_list(
            // 검색어
            @RequestParam(value="keyword", required=false) String keyword,
            // 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value="page", defaultValue="1") int nowPage) {
        
        /** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 5;             // 한 페이지당 표시할 목록 수
        int pageCount  = 3;              // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Post input = new Post();
        input.setPostSubtitle(keyword);

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
	@RequestMapping(value= "/post/{postNo}", method = RequestMethod.GET)
	public Map<String, Object> get_item() {
		return null;
	}
	/**작성 폼에 대한 action 페이지 */
	@RequestMapping(value= "/post", method = RequestMethod.POST)
	public Map<String, Object> post() {
		return null;
	}
	/**수정 폼에 대한 action 페이지 */
	@RequestMapping(value= "/post", method = RequestMethod.PUT)
	public Map<String, Object> put() {
		return null;
	}
	
	/** 삭제 처리 */
	@RequestMapping(value= "/post", method = RequestMethod.DELETE)
	public Map<String, Object> delete() {
		return null;
	}
}
