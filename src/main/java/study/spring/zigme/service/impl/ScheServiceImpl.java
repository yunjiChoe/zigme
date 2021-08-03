package study.spring.zigme.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.Scheduler;
import study.spring.zigme.service.ScheService;

@Service
@Slf4j
public class ScheServiceImpl implements ScheService{
	/** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;
    
    /**
     * 일정 상세 조회
     * @param Scheduler 조회할 일련번호를 가지고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public Scheduler getScheItem(Scheduler input) throws Exception {
    	Scheduler result = null;

        try {
            result = sqlSession.selectOne("SchedulerMapper.selectItem", input);

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
     * 일정 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<Scheduler> getScheList(Scheduler input) throws Exception {
        List<Scheduler> result = null;

        try {
            result = sqlSession.selectList("SchedulerMapper.selectList", input);

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
    public int getScheCount(Scheduler input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("SchedulerMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }

	@Override
	public int addScheduler(Scheduler input) throws Exception {
		int result = 0;

        try {
            
        	result = sqlSession.insert("SchedulerMapper.insertItem", input);
            
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
    public int deleteSche(Scheduler input) throws Exception {
        int result = 0;

        try {
        	
            result = sqlSession.delete("SchedulerMapper.deleteItem", input);

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
    public int editSche(Scheduler input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.update("SchedulerMapper.updateItem", input);

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
	
	
    
}
