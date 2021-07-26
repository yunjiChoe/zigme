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
import study.spring.zigme.model.Food;

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
public class FoodTest {
	
	/**MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;
	
	
	@Test 
	/** 다중행 조회 테스트 */
	public void testA() {
		Food input = new Food();
		input.setFoodNo(1);
		
		sqlSession.selectList("FoodMapper.selectList", input);
	} 
	
	@Test
	/** 단일행 조회 테스트 */
	public void testB() {
		Food input = new Food();
		input.setFoodCategory("한식");
		
		sqlSession.selectOne("FoodMapper.selectItem", input);
	} 
	
//	@Test
//	/**데이터 저장 테스트 */
//	public void testC() {
//		Food input = new Food();
//		
//		input.setFoodName("파스타");
//		input.setFoodCategory("테스트_양식");
//		input.setDelFoodflag("N");
//		
//		sqlSession.insert("FoodMapper.insertItem", input);
//	}
	
//	/** 데이터 삭제 테스트 */
//	@Test
//	public void testD() {
//		Food input = new Food();
//		input.setFoodNo(2);
//		
//		sqlSession.delete("FoodMapper.deleteItem", input);
//	} 
	
//	/** 데이터 수정 테스트 */
//	@Test
//	public void testE() {
//		Food input = new Food();
//		input.setFoodNo(5);
//		input.setFoodName("수정테스트_리조또");
//		input.setFoodCategory("수정테스트_양식");
//		input.setFoodWeather("수정테스트_맑음");
//		input.setDelFoodflag("Y");
//		
//		
//		sqlSession.update("FoodMapper.updateItem", input); 
//	} 
	
}
