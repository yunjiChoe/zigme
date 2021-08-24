package study.spring.zigme.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.Alarm;
import study.spring.zigme.model.Post;
import study.spring.zigme.service.AlarmService;

@Service
@Slf4j
public class AlarmServiceImpl implements AlarmService{
	
	/** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;
	
	
	@Override
	public Alarm getAlarmItem(Alarm input) throws Exception {
		Alarm result = null;

        try {
            result = sqlSession.selectOne("AlarmMapper.selectItem", input);

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
	public List<Alarm> getAlarmList(Alarm input) throws Exception {
		List<Alarm> result = null;

        try {
            result = sqlSession.selectList("AlarmMapper.selectAllList", input);

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
	public int addAlarm(Alarm input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("AlarmMapper.insertItem", input);

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
	public int editAlarm(Alarm input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.update("AlarmMapper.updateItem", input);

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
	public int deleteAlarm(Alarm input) throws Exception {
		int result = 0;

        try {     	
           result = sqlSession.delete("AlarmMapper.deleteItem", input);

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
	public int countAlarm(Alarm input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("AlarmMapper.alarmCount", input);
			
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("count된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 count에 실패했습니다.");
        }
		
		return result;
	}

	@Override
	public String selectAlarmAct(Alarm input) throws Exception {
		String result = "";
		
		try {
			result = sqlSession.selectOne("AlarmMapper.alarmActItem", input);
			
			if(result == "") {
				throw new NullPointerException("result=NULL");
			}
		} 
		catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("alarmAct 데이터 값이 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("alarmAct 데이터 값 조회에 실패했습니다.");
        }
		
		return result;
	}

	@Override
	public List<Alarm> getAlarmselList(Alarm input) throws Exception {
		List<Alarm> result = null;

        try {
            result = sqlSession.selectList("AlarmMapper.selectList", input);

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

}
