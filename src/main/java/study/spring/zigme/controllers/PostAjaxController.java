package study.spring.zigme.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.zigme.helper.PageData;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.Post;
import study.spring.zigme.service.PostService;

@Controller
public class PostAjaxController {
	/** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    // --> import study.spring.springhelper.service.ProfessorService;
    @Autowired  PostService postService;
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** 목록 페이지 */
    @RequestMapping(value = "/help_ajax/help_comm.do", method = RequestMethod.GET)
    public ModelAndView list(Model model,
            /** 검색어 */
    		//keyword1 = 글제목(postTitle)
            @RequestParam(value="keyword1", required=false) String keyword1,
          //keyword2 = 글서브제목(postSubtitle)
            @RequestParam(value="keyword2", required=false) String keyword2,
            // 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value="page", defaultValue="1") int nowPage) {
        
        /** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 10;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Post input = new Post();
        input.setPostTitle(keyword1);
        input.setPostSubtitle(keyword2);

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
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("keyword1", keyword1);
        model.addAttribute("keyword2", keyword2);
        model.addAttribute("output", output);
        model.addAttribute("pageData", pageData);

        return new ModelAndView("help/help_comm_ajax");
        
    }
    
    /** 상세 페이지 */
    @RequestMapping(value = "/help_ajax/help_comm_read.do", method = RequestMethod.GET)
    public ModelAndView view(Model model,
            @RequestParam(value="postNo", defaultValue="0") int postNo) {
        
        /** 1) 유효성 검사 */
        // 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (postNo == 0) {
            return webHelper.redirect(null, "회원번호가 없습니다.");
        }

        /** 2) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        Post input = new Post();
        input.setPostNo(postNo);

        // 조회결과를 저장할 객체 선언
        Post output = null;

        try {
            // 데이터 조회
            output = postService.getPostItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        /** 3) View 처리 */
        model.addAttribute("output", output);
        return new ModelAndView("help/help_comm_read_ajax");
    }
    
    /** 작성 폼 페이지 */
    @RequestMapping(value = "/help_ajax/help_comm_write.do", method = RequestMethod.GET)
    public ModelAndView add(Model model,
    		@RequestParam(value="postNo", defaultValue="0") int postNo) {
    	/** 학과 목록 조회하기 */
        // 조회결과를 저장할 객체 선언
        List<Post> output = null;

        try {
            // 데이터 조회 --> 검색조건 없이 모든 학과 조회
            output = postService.getPostList(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        // View에 추가
        model.addAttribute("output", output);       
        return new ModelAndView("help/help_comm_write_ajax");
    }
    
    /** 수정 폼 페이지 */
    //고민후 추후에 추가할지 안할지.....
}
