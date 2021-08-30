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
			
			if(result ==0) {
				throw new NullPointerException("result=0");
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
	
	/**
	 * 회원 데이터  수정
	 * @param User 조회할 학과의 인련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public User editUser(User input) throws Exception {
		 int result = 0;
		 User zigme_user = null;
		
		try {
			result =sqlSession.update("UserMapper.updateItem", input);
			zigme_user= sqlSession.selectOne("UserMapper.selectItem", input);
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return zigme_user;
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
		User zigme_user = null;
		
		try {
			result =sqlSession.update("UserMapper.outUpdate", input);
			zigme_user =sqlSession.selectOne("UserMapper.selectItem",input);
			
			if(result ==0) {
				throw new NullPointerException("result= 0");
			}else if (zigme_user ==null) {
				throw new NullPointerException("output=null");
			}
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인 처리된 데이터 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인 처리에 실패했습니다.");
		}
		return zigme_user;
	}
	
	/**
	*로그인 처리 (is_out 컬럼 데이터가 'Y'인 경우 가입되지 않은 회원으로 간주)
	*@param Member - 로그인 처리할 회원 정보(아이디)
	*@return Member - 아이디와 비밀번호가 동시에 일치하는 회원정보를 조회하여 리턴
	*@throws Exception
	*/
	@Override
	public User doLogin(User input) throws Exception {
		int result =0;
		User zigme_user = null;		
		
		try {
			if(input.getOutUserflag() =="Y") {
				throw new Exception("이미 탈퇴처리된 회원입니다.");
			}else {	
				zigme_user = sqlSession.selectOne("UserMapper.selectlogin",input);
			}
			if(zigme_user ==null){
				throw new NullPointerException("output=null");
			}
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("아이디와 비밀번호가 일치하지않습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인 처리에 실패했습니다.");
		}
		return zigme_user;
	}
	
	/**
	 * 회원가입 아이디 중복체크
	 */
	@Override
	public int checkId(User input) throws Exception {
		
		User output =null;
		int result =0;
		
		try {
			result =sqlSession.selectOne("UserMapper.checkId",input);
			
			
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("중복아이디 데이터 없습니다.");	
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("중복아이디 데이터 조회실패");
		}
		  return result;
	}
	
	
	/**
	 * 회원가입 닉네임 중복체크
	 */
	@Override
	public int checkNick(User input) throws Exception {
		User output =null;
		int result =0;
		
		try {
			result =sqlSession.selectOne("UserMapper.checkNick",input);
			
			
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("닉네임 데이터 없습니다.");	
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("중복닉네임 데이터 조회실패");
		}
		  return result;
	}
	
	/**
	 * 가입한 회원 이름, 이메일를 조회해서 아이디 찾기
	 * @param User 조회할 학과의 인련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public User getUserId(User input) throws Exception {
		
		User result = null;
		
			try {
				result = sqlSession.selectOne("UserMapper.selectId", input);
				
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

	/**
	 * 가입한 회원 이름, 이메일를 조회해서 비밀번호 재설정 하기
	 * @param User 조회할 학과의 인련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public User getUserPw(User input) throws Exception {
		User result = null;
		
		try {
			result = sqlSession.selectOne("UserMapper.selectPw", input);
			
			if (result == null) {
                throw new NullPointerException("result=null");
            }
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원정보가 일치하지 않습니다.");
		} catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
		
	return result;
}
	
	/**
	 *  비밀번호 업데이트
	 * @param User 조회할 학과의 인련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public User getUserPwRe(User input) throws Exception {
		User result = null;
		
		try {
			sqlSession.update("UserMapper.updatePw", input);
			result = sqlSession.selectOne("UserMapper.selectItem", input);
			if (result == null) {
                throw new NullPointerException("result=null");
            }
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원정보가 일치하지 않습니다.");
		} catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
		
	return result;

}

		


}