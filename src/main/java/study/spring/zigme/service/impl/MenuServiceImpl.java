package study.spring.zigme.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.Food;
import study.spring.zigme.model.Review;
import study.spring.zigme.model.UserSetImage;
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
	public List<Food> getFoodList(Food input, String flag) throws Exception {

		List<Food> result = null;		
		
		try {
			
			if(flag.indexOf("cate") == 0) 
				result = sqlSession.selectList("FoodMapper.selectList", input);
			else if(flag.indexOf("condi") == 0) 
				result = sqlSession.selectList("FoodMapper.selectListCodi", input);
			else 
				result = sqlSession.selectList("FoodMapper.selectListWeather", input);
				
			
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
	public Food getFoodImgName(Food input) throws Exception {
		
		Food result = null;

        try {
            result = sqlSession.selectOne("FoodMapper.selectItem", input);
            
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
	public int addReviewImg(UserSetImage input) throws Exception {

		int result = 0;
		
        try {
        	
        	result = sqlSession.insert("UserSetImageMapper.insertItem", input);

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

	@Override
	public UserSetImage getReviewImgItem(UserSetImage input) throws Exception {
		
		UserSetImage result = null;

        try {
            result = sqlSession.selectOne("UserSetImageMapper.selectItem", input);
            
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
	public int addReview(Review input) throws Exception {

		int result = 0;
		
        try {
        	
        	result = sqlSession.insert("ReviewMapper.insertItem", input);

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

}
