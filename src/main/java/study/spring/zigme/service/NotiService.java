package study.spring.zigme.service;

import java.util.List;
import study.spring.zigme.model.Post;

public interface NotiService {
	
	/**
	 * update후 수정된 결과를 조회하기 위한 단일행 조회
	 * @param 
	 * @return
	 * @throws Exception
	 */
//	public Post getNotiItem(Post input) throws Exception;
	
	/**
	 * [댓글]확인되지 않은 알람(PostNoti==1)의 목록을 조회하는 기능
	 * @param int
	 * @return
	 * @throws Exception
	 */
	public List<Post> getNotiList(Post input) throws Exception;
	
	/**
	 * [대댓글]확인되지 않은 알람(CommNoti==1)의 목록을 조회하는 기능
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public List<Post> getNotiCommList(Post input) throws Exception;

	/**
	 * 게시물의 댓글 알림 확인시 '읽지않음'(=1)을 '읽음'(=0)으로 업데이트하는 기능
	 * @param input1
	 * @return
	 * @throws Exception
	 */
	public int editNoti(Post input) throws Exception;
	
	/**
	 * 대댓글 알림 확인시 '읽지않음'(=1)을 '읽음'(=0)으로 업데이트하는 기능
	 * @param input2
	 * @return
	 * @throws Exception
	 */
	public int editCommNoti(Post input) throws Exception;

}
