package study.spring.zigme.service;

import java.util.List;

import study.spring.zigme.model.Noti;

public interface NotiService {
	
	/**
	 * 확인되지 않은 알람((PostNoti==1) || (CommentNoti ==1))의 목록을 조회하는 기능
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public List<Noti> getNotiList(Noti input) throws Exception;

	/**
	 * 목록에서 해당 제목을 클릭하면 '읽지않음'(=1)을 '읽음'(=0)으로 업데이트하는 기능
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int editNoti(Noti input) throws Exception;
}
