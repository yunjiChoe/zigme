package study.spring.zigme.service;

import java.util.List;

import study.spring.zigme.model.Noti;
import study.spring.zigme.model.Post;

public interface NotiService {
	
	/**
	 * [댓글]확인되지 않은 알람(PostNoti==1)의 목록을 조회하는 기능
	 * @param input
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
	 * 목록에서 해당 제목을 클릭하면 '읽지않음'(=1)을 '읽음'(=0)으로 업데이트하는 기능
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int editPost(Post input) throws Exception;
}
