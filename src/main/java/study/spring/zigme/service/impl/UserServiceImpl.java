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

		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getUserCount(User input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addUser(User input) throws Exception {
		int result = 0;
		User output =null;
		
		try {
			result =sqlSession.insert("UserMapper.insertItem", input);
			output =sqlSession.selectOne("UserMapper.selectUser", input.getId());
			if(result ==0) {
				throw new NullPointerException("result=0");
			}else if(output ==null) {
				throw new NullPointerException("output = null");
			}
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원가입 저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원가입 저장에 실패했습니다.");
		}
		return result;
	
	}

	@Override
	public int editUser(User input) throws Exception {

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
		
		return 0;
	}

	

	@Override
	public int deleteUser(User input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 * 회원 탈퇴
	 * @param User 탈퇴 진행할 회웑 정보
	 * @return
	 */
	@Override
	public User doOut(User input) throws Exception {
		int result = 0;
		User output = null;
		
		try {
			result =sqlSession.update("UserMapper.outUpdate", input);
			output =sqlSession.selectOne("UserMapper.selectItem",input);
			
			if(result ==0) {
				throw new NullPointerException("result= 0");
			}else if (output ==null) {
				throw new NullPointerException("output=null");
			}
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인 처리된 데이터 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인 처리에 실패했습니다.");
		}
		return output;
	}
	
	/**
	*로그인 처리 (is_out 컬럼 데이터가 'Y'인 경우 가입되지 않은 회원으로 간주)
	*@param Member - 로그인 처리할 회원 정보(아이디)
	*@return Member - 아이디와 비밀번호가 동시에 일치하는 회원정보를 조회하여 리턴
	*@throws Exception
	*/
	@Override
	public User doLogin(User input) throws Exception {
		int result = 0;
		User output = null;
		
		try {
			if(input.getOutUserflag() =="Y") {
				throw new Exception("이미 탈퇴처리된 회원입니다.");
			}else {
				result =sqlSession.update("UserMapper.outUpdate", input);
				output =sqlSession.selectOne("UserMapper.selectItem",input);
			}
			if(result ==0) {
				throw new NullPointerException("result= 0");
			}else if (output ==null) {
				throw new NullPointerException("output=null");
			}
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인 처리된 데이터 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인 처리에 실패했습니다.");
		}
		return output;
	}

	@Override
	public int checkId(User input) throws Exception {
		int result = 0;
		
		try {
			result =sqlSession.selectOne("UserService.selectCountAll",input);
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("중복아이디 데이터 조회실패");
		}
		  return result;
	}

	@Override
	public int nickName(User input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
		


}