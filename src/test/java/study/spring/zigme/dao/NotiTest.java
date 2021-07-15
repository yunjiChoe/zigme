package study.spring.zigme.dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.Post;

/**Lombok의 Log4j 객체 */
@Slf4j
/** JUnit에 의한 테스트 클래스로 정의 */
@RunWith(SpringJUnit4ClassRunner.class)

/**Spring의 설정 파일들을 읽어들이도록 설정 (**은 '모든'이라는 의미) */
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})

/**웹 어플리케이션임을 명시 */
@WebAppConfiguration

/**메서드 이름 순서로 실행하도록 설정(설정하지 않을 경우 무작위 순서로 실행됨) */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class NotiTest {

	@Autowired
	private SqlSession sqlSession;
	
//	@Test
//	/**데이터 저장 테스트 */
//	public void testA() {
//		Post input = new Post();
//		input.setPostSubtitle("넋두리");
//		input.setPostTitle("요즘 날씨 거의 동남아");
//		input.setPostContent("<h3> 스콜처럼 쏟아졌다가 개고 쏟아졌다가 개고 하는 것이 마치 동남아날씨 같지 않나요 ㅋ <br>지구 온난화 너무 무서워요 ㅠ </h3><p>테스트</p>");
//		input.setPostUpcount(0);
//		input.setPostViewcount(5);
//		input.setPostRegdate("2021-03-02 00:00:00");
//		input.setPostNoti("1");
//		input.setUserNo(1);
//		sqlSession.insert("PostMapper.insertItem", input);
//	}
	
	
	@Test
	/**다중행 조회 테스트 */
	public void testB() {
		Post input = new Post();
		input.setPostNoti("1"); // 글에 댓글이 달린 알람을 확인하지 않음
	
		sqlSession.selectList("NotiMapper.selectList", input);
	}

	

}
