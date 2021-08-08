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
import study.spring.zigme.model.ReportUser;
import study.spring.zigme.model.Review;

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

public class ReportUserTest {
	
	/**MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	 /** 단일행 조회 테스트 */ 
	public void testA() {
		ReportUser input = new ReportUser();
		input.setReportNo(6);
		sqlSession.selectOne("ReportUserMapper.selectItem", input);
	} 
	
	 @Test
	 /** 다중행 조회 테스트 */ 
	public void testB() {
		ReportUser input = new ReportUser();
		input.setReportingUser("테스트_id");		
		sqlSession.selectList("ReportUserMapper.selectList", input);
	} 
	
	@Test
	/** 데이터 저장 테스트 */
	public void testC() {
		ReportUser input = new ReportUser();
		
		// 현재시간으로 insert 하기 위함. 테스트 용도		
		Calendar cal = Calendar.getInstance();
		String date = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH)+1) + "-" + cal.get(Calendar.DAY_OF_MONTH) + " " 
				+ cal.get(Calendar.HOUR_OF_DAY) + ":" + cal.get(Calendar.MINUTE) + ":" + cal.get(Calendar.SECOND);
		
		input.setReportFlag("P");	// P : postNo, C: CommNo, R: ReviewNo 
		input.setReportingUser("pass4522");
		input.setReportingContent("도배 게시글입니다.");
		input.setReportingDate(date);
		input.setUserNo(2);
		input.setPostNo(1);
		//input.setCommNo();
		input.setReviewNo(2);
		
		sqlSession.insert("ReportUserMapper.insertItem", input);
	}
	
	@Test
	 /** 데이터 수정 테스트 */ 
	public void testD() {
		ReportUser input = new ReportUser();	
		// 현재시간으로 insert 하기 위함. 테스트 용도		
		Calendar cal = Calendar.getInstance();
		String date = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH)+1) + "-" + cal.get(Calendar.DAY_OF_MONTH) + " " 
				+ cal.get(Calendar.HOUR_OF_DAY) + ":" + cal.get(Calendar.MINUTE) + ":" + cal.get(Calendar.SECOND);
		
		input.setReportNo(6);

		// ※ 테스트이므로 수정하도록 로직이 있긴하지만 데이터 일치를 위해 수정하려면 PostNo, CommNo, ReviewNo도 같이 수정할 것. 
		// 쿼리문을 보면 조건으로 flag에 따라 한가지만 업데이트 하도록 되어있다. 
		input.setReportFlag("R"); 
		
		input.setReportingUser("test_id");
		input.setReportingContent("수정한 테스트 신고내역222");
		//input.setReportingDate(data);
		input.setUserNo(5);
		input.setPostNo(2);
		input.setCommNo(2);
		input.setReviewNo(9);
		
		sqlSession.update("ReportUserMapper.updateItem", input);
	}
	
	@Test
	/** 데이터 삭제 테스트 */
	public void testE() {
		ReportUser input = new ReportUser();
		input.setReportNo(10);		
		sqlSession.delete("ReportUserMapper.deleteItem", input);
	}	
	
}
