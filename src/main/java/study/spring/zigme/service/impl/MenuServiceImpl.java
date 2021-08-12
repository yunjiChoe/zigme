package study.spring.zigme.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.Food;
import study.spring.zigme.model.Review;
import study.spring.zigme.service.MenuService;

@Service
@Slf4j
public class MenuServiceImpl implements MenuService {

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Review> getReviewList(Review input) throws Exception {

		List<Review> result = null;

		try {
			result = sqlSession.selectList("ReviewMapper.selectList", input);

			/* if (result == null) {
				throw new NullPointerException("result=null");
			}*/
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
	public int getReviewCount(Review input) throws Exception {
		
		int result = 0;

		try {
			result = sqlSession.selectOne("ReviewMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Review getReviewItem(Review input) throws Exception {
		
		Review result = null;

        try {
            result = sqlSession.selectOne("ReviewMapper.selectItem", input);

            /*if (result == null) {
                throw new NullPointerException("result=null");
            }*/
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
	public ArrayList<Food> getFoodList(Food input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
