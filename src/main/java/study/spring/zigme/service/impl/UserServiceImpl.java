package study.spring.zigme.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.User;
import study.spring.zigme.service.UserService;

@Service
@Slf4j
public class UserServiceImpl implements UserService{

	/**MyBatis 세션 객체 주입 설정 */
	@Autowired SqlSession sqlSession;
	
	/**
	 * 회원 데이터 상세 조회
	 * @param User 조회할 학과의 인련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public User getUserItem(User input) throws Exception {
		
		User result = null;
		
			try {
				result = sqlSession.selectOne("UserMapper.selectItem", input);
				
				if (result == null) {
	                throw new NullPointerException("result=null");
	            }
				
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			} catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 실패했습니다.");
	        }
			
		return result;
	}

	@Override
	public List<User> getUserList(User input) throws Exception {
		List<User> result = null;
		
		try {
			result = sqlSession.selectList("UserMapper.selectList", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int getUserCount(User input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addUser(User input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editUser(User input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(User input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
