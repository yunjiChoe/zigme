package study.spring.zigme.dao;

import java.util.Calendar;

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
import study.spring.zigme.model.Review;
import study.spring.zigme.model.Scheduler;

/**Lombok의 Log4j 객체 */
@Slf4j
/** JUnit에 의한 테스트 클래스로 정의 */
@RunWith(SpringJUnit4ClassRunner.class)

/**Spring의 설정 파일들을 읽어들이도록 설정 (**은 '모든'이라는 의미) */
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})

/**웹 어플리케이션임을 명시 */
@WebAppConfiguration

/**메서드 이름 순서로 실행하도록 설정(설정하지 않을 경우 무작위 순서로 실행됨)  */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class ReviewTest {
	
	/**MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	/**단일행 조회 테스트 */
	public void testA() {
		Review input = new Review();
		input.setReviewNo(2);
		sqlSession.selectOne("ReviewMapper.selectItem", input);
	}
	
	@Test
	/**다중행 조회 테스트 */
	public void testB() {
		Review input = new Review();
		input.setUserNo(1);		
		sqlSession.selectList("ReviewMapper.selectList", input);
	}
	
	@Test
	/** 데이터 저장 테스트 */
	public void testC() {
		Review input = new Review();
		
		// 현재시간으로 insert 하기 위함. 테스트 용도		
		Calendar cal = Calendar.getInstance();
		String date = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH)+1) + "-" + cal.get(Calendar.DAY_OF_MONTH) + " " 
				+ cal.get(Calendar.HOUR_OF_DAY) + ":" + cal.get(Calendar.MINUTE) + ":" + cal.get(Calendar.SECOND);
		
		input.setReviewContent("test content");
		input.setReviewScope(3.5);
		input.setReviewRegdate(date);
		input.setReviewPlaceId("04545");
		input.setUserNo(1);
		input.setUserImgNo(1);
		sqlSession.insert("ReviewMapper.insertItem", input);
	}
	
	@Test
	/** 데이터 수정 테스트 */
	public void testD() {
		Review input = new Review();
		
		// 현재시간으로 insert 하기 위함. 테스트 용도		
		Calendar cal = Calendar.getInstance();
		String date = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH)+1) + "-" + cal.get(Calendar.DAY_OF_MONTH) + " " 
				+ cal.get(Calendar.HOUR_OF_DAY) + ":" + cal.get(Calendar.MINUTE) + ":" + cal.get(Calendar.SECOND);
		
		input.setReviewNo(2);
		input.setUserNo(1);
		input.setReviewContent("test review");
		input.setReviewScope(4.5);
		//input.setReviewRegdate(date);
		//input.setReviewPlaceId("12121");
		
		sqlSession.update("ReviewMapper.updateItem", input);
	}
	
	@Test
	/** 데이터 삭제 테스트 */
	public void testE() {
		Review input = new Review();
		input.setReviewNo(7);
		input.setUserNo(1);
		sqlSession.delete("ReviewMapper.deleteItem", input);
	}
}
