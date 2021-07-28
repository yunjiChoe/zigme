package study.spring.zigme.service;


import java.util.List;

import study.spring.zigme.model.Post;

/**게시글 데이터 관리 기능을 제공하기 위한 Service 계층 */
public interface PostService {
	/**
	 * 게시글 데이터 상세 조회
	 * @param Post 조회할 게시글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception 
	 */
	public Post getPostItem(Post input) throws Exception;
	
	/**
	 * 게시글 데이터 목록 조회
	 * @param Post 검색조건을 담고 있는 Beans
	 * @return 조회결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Post> getPostList(Post input) throws Exception;
	
	/**
	 * 게시글 데이터가 저장되어 잇는 갯수 조회
	 * @param Post 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getPostCount(Post input) throws Exception;
	
	/**
	 * 게시글 데이터 등록하기
	 * @param Post 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	
	public int addPost(Post input) throws Exception;
	
	/**
	 * 게시글 데이터 수정하기
	 * @param Post 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editPost(Post input) throws Exception;
	
	/**
	 * 게시글 데이터 삭제하기
	 * @param Post 삭제할 게시글의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deletePost(Post input) throws Exception;
	
	/**
	 * 이전 게시글 일련번호 조회하기
	 * @param Post 이전 게시글 일련번호를 접근하기 위한 Post
	 * @return int
	 * @throws Exception
	 */
	public int getPervnum(Post input) throws Exception;
	
	/**
	 * 다음 게시글 일련번호 조회하기
	 * @param Post 이전 게시글 일련번호를 접근하기 위한 Post
	 * @return int
	 * @throws Exception
	 */
	public int getNextnum(Post input) throws Exception;
	
	/**
	 * 조회수 수정하기
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int addpostViewcount(Post input) throws Exception;
	
}

