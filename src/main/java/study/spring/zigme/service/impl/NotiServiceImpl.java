package study.spring.zigme.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.Noti;
import study.spring.zigme.model.Post;
import study.spring.zigme.service.NotiService;

@Service
@Slf4j
public class NotiServiceImpl implements NotiService{
	
	/** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;

	/**
     * 알림 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	
	@Override
	public List<Post> getNotiList(Post input) throws Exception {
		List<Post> result = null;
		
		try {
			result = sqlSession.selectList("NotiMapper.selectList", input);
			if(result == null) {
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
	public List<Post> getNotiCommList(Post input) throws Exception {
		List<Post> result = null;
		
		try {
			result = sqlSession.selectList("NotiMapper.selectCommList", input);
			if(result == null) {
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
     * 게시글 데이터 수정하기
     * @param Post 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */

	@Override
	public int editPost(Post input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}




	

	
}
