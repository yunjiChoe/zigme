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
import study.spring.zigme.model.User;


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

public class PostTest {
	/**MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	/**단일행 조회 테스트 */
	public void testA() {
		Post input = new Post();
		input.setPostNo(1);
		sqlSession.selectOne("PostMapper.selectItem", input);
	}
	
	@Test
	/**다중행 조회 테스트 */
	public void testB() {
		Post input = new Post();
		sqlSession.selectList("PostMapper.selectList", input);
	}
	
	@Test
	/**데이터 저장 테스트 */
	public void testC() {
		Post input = new Post();
		input.setPostSubtitle("도움");
		input.setPostTitle("회사에서 인정받는 8가지 방법");
		input.setPostContent("<h3>기록하고 끊임없이 학습하라</h3><p>테스트</p>");
		input.setPostUpcount(15);
		input.setPostViewcount(30);
		input.setPostRegdate("2021-01-01 00:00:00");
		input.setPostNoti("1");
		input.setUserNo(1);
		sqlSession.insert("PostMapper.insertItem", input);
	}
	
	/** 데이터 삭제 테스트 */
	@Test
	public void testD() {
		Post input = new Post();
		input.setPostNo(3);
		sqlSession.delete("PostMapper.deleteItem", input);
	}
	
	/** 데이터 수정 테스트 */
	@Test
	public void testE() {
		Post input = new Post();
		input.setPostUpcount(100);
		input.setPostViewcount(100);
		input.setPostNo(4);
		sqlSession.update("PostMapper.updateItem", input);
	}
	
	/** 전체 데이터 수 조회 */
	@Test
	public void testF() {
		int count = sqlSession.selectOne("PostMapper.selectCountAll", null);
		log.debug("전체 데이터 수: " +count);
	}
	
	/** 이전 글번호 조회 */
	@Test
	public void testG() {
		Post input = new Post();
		input.setPostNo(30);
		sqlSession.selectOne("PostMapper.selectPrevnum", input);
	}
	
	/** 다음 글번호 조회 */
	@Test
	public void testH() {
		Post input = new Post();
		input.setPostNo(30);
		sqlSession.selectOne("PostMapper.selectNextnum", input);
	}
}
