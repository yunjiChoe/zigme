package study.spring.zigme.service;

import java.util.List;

import study.spring.zigme.model.User;


public interface UserService {
	/**
	 * 회원 데이터 상세 조회
	 * @param User 조회할 게시글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception 
	 */
	public User getUserItem(User input) throws Exception;
	
	/**
	 * 회원 데이터 목록 조회
	 * @param User 검색조건을 담고 있는 Beans
	 * @return 조회결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<User> getUserList(User input) throws Exception;
	
	/**
	 * 회원 데이터가 저장되어 잇는 갯수 조회
	 * @param User 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getUserCount(User input) throws Exception;
	
	/**
	 * 회원 데이터 등록하기
	 * @param User 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addUser(User input) throws Exception;
	
	/**
	 * 회원 데이터 수정하기
	 * @param User 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public User editUser(User input) throws Exception;
	
	/**
	 * 회원 데이터 삭제하기
	 * @param User 삭제할 회원의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteUser(User input) throws Exception;
	
	/**
	 *  회원 탈퇴 진행
	 *  @param User - 탈퇴 진행할 회원 정보(아이디)
	 *  @return int - 수정된 데이터 수
	 *  @throws Exception
	 */
	public User doOut(User input) throws Exception;
	
	/**
	 * 로그인
	 * @param User - 로그인 처리할 회원 정보(아이디)
	 * @reuurn User - 아이디와 비밀번호가 동시에 일치하는 회원 정보를 리턴하여 리턴
	 * @throws Exception
	 */
	public  User doLogin(User input) throws Exception;
	
	/**
	 * 로그인 아이디 체크
	 * @param User - 로그인 처리할 회원 정보(아이디)
	 * @reuurn User - 아이디가 중복되는지 확인 후 리턴
	 * @throws Exception
	 */
	public  int checkId(User input) throws Exception;
	

	/**
	 *  닉네임 중복 체크
	 * @param User - 회원가입할떄 닉네임 중복 확인
	 * @reuurn User - 동일한 닉네임이 중복되는지 확인 후 리턴
	 * @throws Exception
	 */
	public int checkNick(User input) throws Exception;

	/**
	 * 이름, 이메일로 아이디 조회
	 * @param User 조회할 학과의 인련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public User getUserId(User input) throws Exception;
	
	/**
	 * 비밀번호 재설정을 위한 조회
	 * @param User 조회할 학과의 인련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public User getUserPw(User input) throws Exception;

	/**
	 *  비밀번호 업데이트
	 * @param User 조회할 학과의 인련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public User getUserPwRe(User input) throws Exception;



	
		
	
	
	
}
