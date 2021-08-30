package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import study.spring.zigme.model.Comment;
import study.spring.zigme.model.Post;
import study.spring.zigme.service.CommentService;
import study.spring.zigme.service.PostService;

@Controller
public class PostAjaxController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// --> import study.spring.springhelper.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	// --> import study.spring.springhelper.service.ProfessorService;
	@Autowired
	PostService postService;

	@Autowired
	CommentService commentService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 */
	@RequestMapping(value = "/help_ajax/help_comm.do", method = RequestMethod.GET)
	public ModelAndView list(Model model,
			/** 검색어 */
			// keyword1 = 글제목(postTitle)
			@RequestParam(value = "keyword1", required = false) String keyword1,
			// keyword2 = 글서브제목(postSubtitle)
			@RequestParam(value = "keyword2", required = false) String keyword2,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		System.out.println("controller 진입완료");
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Post input = new Post();
		input.setPostTitle(keyword1);
		input.setPostSubtitle(keyword2);

		List<Post> output_post = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = postService.getPostCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Post.setOffset(pageData.getOffset());
			Post.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output_post = postService.getPostList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("keyword1", keyword1);
		model.addAttribute("keyword2", keyword2);
		model.addAttribute("output_post", output_post);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("help/help_comm");

	}

	/** 상세 페이지 */
	@RequestMapping(value = "/help_ajax/help_comm_read.do", method = RequestMethod.GET)
	public ModelAndView view(Model model, @RequestParam(value = "postNo", defaultValue = "0") int postNo) {

		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (postNo == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 게시글 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Post input = new Post();
		input.setPostNo(postNo);

		// 댓글 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Comment input_comm = new Comment();
		input_comm.setPostNo(postNo);

		// 다음글/이전글 번호 데이터 조회에 필요한 조건값을 Beans에 저장하기(추후에)

		// 조회결과를 저장할 객체 선언
		Post output_post = null;
		List<Comment> output_comm = null;

		try {
			// 조회수 +1 수정
			postService.addpostViewcount(input);
			// 데이터 조회
			// 게시글 단일행 조회
			output_post = postService.getPostItem(input);
			// 해당 게시글에 해당하는 댓글 조회
			output_comm = commentService.getCommentList(input_comm);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output_post", output_post);
		model.addAttribute("output_comm", output_comm);
		return new ModelAndView("help/help_comm_read_ajax");
	}

	@RequestMapping(value = "/help_ajax/help_comm_write.do", method = RequestMethod.GET)
	public ModelAndView add(Model model) {
		return new ModelAndView("help/help_comm_write_ajax");
	}

	/** 수정 폼 페이지 */
	@RequestMapping(value = "/help_ajax/help_comm_edit.do", method = RequestMethod.GET)
	public ModelAndView edit_ok(Model model, @RequestParam(value = "postNo", defaultValue = "0") int postNo) {

		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (postNo == 0) {
			return webHelper.redirect(null, "게시글 일련번호가 없습니다.");
		}

		/** 2) 데이터 수정하기 */
		// 수정할 값들을 Beans에 담는다.
		Post input = new Post();
		input.setPostNo(postNo);

		// 수정된 결과를 조회하기 위한 객체 생성
		Post output = null;

		try {
			// 게시글 기본 정보 조회
			output = postService.getPostItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("help/help_comm_edit_ajax");
	}

	/** 수정 폼에 대한 action 페이지 */
	/*
	 * @RequestMapping(value = "/help_ajax/help_comm_edit.do", method =
	 * RequestMethod.PUT) public ModelAndView edit(Model model,
	 * 
	 * @RequestParam(value="postNo", defaultValue="") int postNo,
	 * 
	 * @RequestParam(value="postSubtitle", defaultValue="") String postSubtitle,
	 * 
	 * @RequestParam(value="postTitle", defaultValue="") String postTitle,
	 * 
	 * @RequestParam(value="postContent", defaultValue="") String postContent) {
	 * 
	 *//** 1)사용자가 입력한 파라미터 유효성 찾기 */

	/*
	 * if (!regexHelper.isValue(postSubtitle)) { return webHelper.redirect(null,
	 * "소제목을 입력하세요."); } if (!regexHelper.isValue(postTitle)) { return
	 * webHelper.redirect(null, "제목을 입력하세요."); } if
	 * (!regexHelper.isValue(postContent)) { return webHelper.redirect(null,
	 * "내용을 입력하세요."); } // 숫자형으로 선언된 파라미터()
	 * 
	 *//** 2) 데이터 수정하기 *//*
							 * //수정할 값들을 Beans에 담는다. Post input = new Post(); input.setPostNo(postNo);
							 * input.setPostSubtitle(postSubtitle); input.setPostTitle(postTitle);
							 * input.setPostContent(postContent);
							 * 
							 * //수정된 결과를 조회하기 위한 객체 생성 Post output = null;
							 * 
							 * try { //데이터 수정 postService.editPost(input); //수정 결과 조회 output =
							 * postService.getPostItem(input); } catch (Exception e) { return
							 * webHelper.redirect(null, e.getLocalizedMessage()); }
							 * 
							 * model.addAttribute("output", output); return new
							 * ModelAndView("help/help_comm_edit_ajax.do"); }
							 */

	// 댓글 조회수 상승
	@RequestMapping(value = "/help_ajax/help_commentUpCount.do", method = RequestMethod.GET)
	public ModelAndView commentUp(Model model, @RequestParam(value = "postNo", defaultValue = "") int postNo,
			@RequestParam(value = "userNo", defaultValue = "") int userNo,
			@RequestParam(value = "commUpCount", defaultValue = "") int commUpCount,
			@RequestParam(value = "commNo", defaultValue = "") int commNo) {
		System.out.println("게시글번호: " + postNo + "댓글 일련번호: " + commNo + "회원번호: " + userNo + "댓글좋아요수:" + commUpCount);

		int commUpCount_plus = commUpCount + 1;

		/** 1) 데이터 저장하기 */
		Comment input = new Comment();
		input.setPostNo(postNo);
		input.setUserNo(userNo);
		input.setCommUpCount(commUpCount_plus);
		input.setCommNo(commNo);

		// post 단일행 조회
		Post inputp = new Post();

		inputp.setPostNo(postNo);

		// 댓글 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Comment input_comm = new Comment();

		// 조회할 결과를 저장할 변수 선언
		Post output = null;
		List<Comment> output_comm = null;

		/** 2) 세팅된 댓글의 좋아요 수 수정 */
		try {
			commentService.editComment(input);
			output = postService.getPostItem(inputp);
			output_comm = commentService.getCommentList(input_comm);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output_comm", output_comm);
		model.addAttribute("output", output);
		return new ModelAndView("help/help_comm_read_ajax");
	}

	/** 댓글 삽입 폼에 대한 action 페이지 */
	@RequestMapping(value = "/help_ajax/help_comm_comment.do", method = RequestMethod.POST)
	public ModelAndView comment_ok(Model model, @RequestParam(value = "postNo", defaultValue = "") int postNo,
			@RequestParam(value = "commContent", defaultValue = "") String commContent) {

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		if (!regexHelper.isValue(commContent)) {
			return webHelper.redirect(null, "내용을 입력하세요.");
		}

		/** 2) 데이터 저장하기 */
		// comment 데이터 삽입
		Comment input = new Comment();
		input.setPostNo(postNo);
		input.setCommContent(commContent);

		// post 단일행 조회
		Post inputp = new Post();

		inputp.setPostNo(postNo);

		// 댓글 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Comment input_comm = new Comment();

		// 조회할 결과를 저장할 변수 선언
		Post output = null;
		List<Comment> output_comm = null;

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			commentService.addComment(input);
			output = postService.getPostItem(inputp);
			output_comm = commentService.getCommentList(input_comm);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output_comm", output_comm);
		model.addAttribute("output", output);
		return new ModelAndView("help/help_comm_read_ajax");
	}
}
