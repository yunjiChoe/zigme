package study.spring.zigme.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.AdminStats;
import study.spring.zigme.service.AdminStatsService;

@Service
@Slf4j
public class AdminStatsServiceImpl implements AdminStatsService{
	
	@Autowired
    SqlSession sqlSession;

	@Override
	public AdminStats getstatsItem(AdminStats input) throws Exception {
		
		AdminStats result = null;

        try {
            result = sqlSession.selectOne("AdminStatsMapper.selectItem", input);
            
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
	public int getstatsCount(AdminStats input) throws Exception {
		
		int result = 0;

        try {

        	result = sqlSession.selectOne("AdminStatsMapper.statisCount", input);
            
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
	public int addstatsItem(AdminStats input) throws Exception {
		
		int result = 0;

        try {

        	result = sqlSession.insert("AdminStatsMapper.insertItem", input);
            
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result; 
	}

	@Override
	public int editstatsItem(AdminStats input) throws Exception {
		
		int result = 0;

        try {

        	result = sqlSession.update("AdminStatsMapper.updateItem", input);
            
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
	}

}
