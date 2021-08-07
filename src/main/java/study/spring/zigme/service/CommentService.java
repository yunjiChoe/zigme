package study.spring.zigme.service;

import java.util.List;

import study.spring.zigme.model.Comment;

public interface CommentService {
	/**
	 * 댓글 데이터 목록 조회
	 * @param Comment 검색조건을 담고 있는 Beans
	 * @return 조회결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Comment> getCommentList(Comment input) throws Exception;
	
	/**
	 * 댓글 데이터가 저장되어 잇는 갯수 조회
	 * @param Comment 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	
	public int addComment(Comment input) throws Exception;
	
	/**
	 * 댓글 데이터 수정하기
	 * @param Comment 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editComment(Comment input) throws Exception;
	
	
	/**
	 * 탈퇴한 회원들의 댓글 테이블의 postNo를 null로 수정
	 * @param Comment 해당postNo를 null로 바꿀 정보를 담고 있는 Beans
	 * @return
	 * @throws Exception
	 */
	public int unsetPostNo(Comment input) throws Exception;
	
	/**
	 * 댓글 데이터 삭제하기
	 * @param Comment 삭제할 게시글의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteComment(Comment input) throws Exception;
	
}
