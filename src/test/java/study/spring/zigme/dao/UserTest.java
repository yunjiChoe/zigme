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
import study.spring.zigme.model.User;
import study.spring.zigme.service.UserService;


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
public class UserTest {
	/**MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private UserService userService;
	
	
	
	@Test
	/**단일행 조회 테스트 */
	public void testA() {
		User input = new User();
		input.setUserNo(1);
		sqlSession.selectOne("UserMapper.selectItem", input);
	}
	
	/** 다중행 조회 테스트 */
	@Test
	public void testB() {
		User input = new User();
		sqlSession.selectList("UserMapper.selectList", input);
	}
	/** 데이터 저장 테스트 */
	@Test
	public void testC() {
		User input = new User();
		input.setId("j");
		input.setPassword("secret");
		input.setName("정정");
		input.setNickname("정닉네임");
		input.setEmail("테스트email");
		input.setGender("F");
		input.setPostcode("11111");
		input.setAddr1("테스트1");
		input.setAddr2("테스트2");
		input.setLoc_xy("29301293, 80138");
		input.setIcon("2");
		input.setBlockUserflag("0");
		input.setOutUserflag("N");
		sqlSession.insert("UserMapper.insertItem", input);
		
	}
	
	/** 데이터 삭제 테스트 */
	@Test
	public void testD() {
		User input = new User();
		input.setUserNo(3);
		sqlSession.delete("UserMapper.deleteItem", input);
	}
	
	/** 데이터 수정 테스트 */
	@Test
	public void testE() {
		User input = new User();
		input.setNickname("조랭이");
		input.setEmail("email@email.com");
		input.setPassword("123");
		input.setPostcode("12345");
		input.setAddr1("주소1");
		input.setAddr2("주소2");
		input.setLoc_xy("29301293,80138");
		input.setIcon("2");
		input.setUserNo(7);
		sqlSession.update("UserMapper.updateItem", input);
		
		User output = null;
		
		try {
			output = userService.doLogin(input);
			log.debug(output.toString());
		}catch (Exception e){
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		
		
	}
	
	/** 전체 데이터 수 조회 */
	@Test
	public void testF() {
		int count = sqlSession.selectOne("UserMapper.selectCountAll", null);
		log.debug("전체 데이터 수: " +count);
	}
	
	/** 로그인 테스트 */
	@Test
	public void testG() {
		User input = new User();
		input.setId("테스트_id");
		input.setPassword("테스트_pw");
		sqlSession.selectOne("UserMapper.selectItem",input);
		
		User output = null;
		
		try {
			output = userService.doLogin(input);
			log.debug(output.toString());
		}catch (Exception e){
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	  
		
	}
	
	/** 아이디중복 테스트 */
	@Test
	public void testH() {
		User input = new User();
		input.setId("jhs");
		sqlSession.selectOne("UserMapper.checkId", input);
		
		
	}
	
	

}
