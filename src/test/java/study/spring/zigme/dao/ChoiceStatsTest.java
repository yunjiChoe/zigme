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
import study.spring.zigme.model.AdminSetImage;
import study.spring.zigme.model.ChoiceStats;

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
public class ChoiceStatsTest {
	
	/**MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;
	
	/** 단일행 조회 테스트 */
	@Test
	public void testA() {
		ChoiceStats input = new ChoiceStats();
		input.setStatisNo(2);
		sqlSession.selectOne("ChoiceStatsMapper.selectItem", input);
	}
	
	/** 다중행 조회 테스트 */
	@Test
	public void testB() {
		ChoiceStats input = new ChoiceStats();
		input.setChoiceStatsFlag("0");
		sqlSession.selectList("ChoiceStatsMapper.selectList", input);
	}
	
	/** 데이터 저장 테스트 */
	@Test
	public void testC() {
		ChoiceStats input = new ChoiceStats();
		input.setChoiceStatsFlag("0");
		input.setStatsRegdate("2021-07-30 00:01:10");
		input.setUserNo(1);
		input.setFoodNo(1);
		sqlSession.insert("ChoiceStatsMapper.insertItem", input);
	}
	
	/** 데이터 삭제 테스트 */ // 삭제 필요하지 않음
	/**@Test
	public void testD() {
		ChoiceStats input = new ChoiceStats();
		input.setStatisNo(2);
		sqlSession.delete("ChoiceStatsMapper.deleteItem", input);
	}*/

	/** 데이터 수정 테스트 */ // 수정 필요하지 않음
	/**@Test
	public void testE() {
		ChoiceStats input = new ChoiceStats();
		input.setChoiceStatsFlag("0");
		input.setStatsRegdate("2021-07-30 10:01:10");
		input.setUserNo(1);
		input.setFoodNo(2);
		sqlSession.update("ChoiceStatsMapper.updateItem", input);
	}*/
}
