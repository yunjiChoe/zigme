package study.spring.zigme.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.Post;
import study.spring.zigme.service.PostService;

@Service
@Slf4j
public class PostServiceImpl implements PostService{
	
	/** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;

    /**
     * 게시글 데이터 상세 조회
     * @param Post 조회할 교수의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
	@Override
	public Post getPostItem(Post input) throws Exception {
		
		Post result = null;

        try {
            result = sqlSession.selectOne("PostMapper.selectItem", input);

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
     * 게시글 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	
	@Override
	public List<Post> getPostList(Post input) throws Exception {
		List<Post> result = null;

        try {
            result = sqlSession.selectList("PostMapper.selectList", input);

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
     * 게시글 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
	@Override
	public int getPostCount(Post input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("PostMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}
	
	/**
     * 게시글 데이터 등록하기
     * @param Post 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
	@Override
	public int addPost(Post input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("PostMapper.insertItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장에 실패했습니다.");
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
		int result = 0;

        try {
            result = sqlSession.update("PostMapper.updateItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }

        return result;
	}

	
	@Override
	public int deletePost(Post input) throws Exception {
		int result = 0;

        try {
            //게시글 삭제 전 자신을 참조하는 각각의 테이블들의 postNo컬럼을 null로 수정
        	sqlSession.update("CommentMapper.unsetPostNo", input);
        	
            result = sqlSession.delete("PostMapper.deleteItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 삭제에 실패했습니다.");
        }

        return result;
	}

	@Override
	public int getPervnum(Post input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("PostMapper.selectPrevnum", input);
		}catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
		
		return result;
	}

	@Override
	public int getNextnum(Post input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("PostMapper.selectNextnum", input);
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
	public int addpostViewcount(Post input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("PostMapper.udpostViewcount", input);
		} catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }
		
		return result;
	}

	

	
}
