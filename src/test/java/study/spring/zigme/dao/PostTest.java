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
		
	/** 데이터 수정 테스트 */
	@Test
	public void testE() {
		int number;
		Post input = new Post();
		input.setPostUpcount(10);
		input.setPostNo(63);
		number = sqlSession.update("PostMapper.updateItem", input);
		log.debug("업데이트된 postNo: " +number);
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
		input.setPostNo(1);
		sqlSession.selectOne("PostMapper.selectPrevnum", input);
	}
	
	/** 다음 글번호 조회 */
	@Test
	public void testH() {
		Post input = new Post();
		input.setPostNo(68);
		sqlSession.selectOne("PostMapper.selectNextnum", input);
	}
}
