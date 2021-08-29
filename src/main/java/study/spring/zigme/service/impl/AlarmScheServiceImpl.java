package study.spring.zigme.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.Alarm;
import study.spring.zigme.model.User;
import study.spring.zigme.service.AlarmScheService;

@Slf4j
@Service
public class AlarmScheServiceImpl implements AlarmScheService{

	/** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;
    
    int userNo = 0;    
    List<Alarm> alarm_list = new ArrayList<Alarm>();
    
	/**
     * 알람 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<Alarm> getAlarmList() throws Exception {

    	User input = new User();        
    	List<Alarm> result = null;
    	
    	if (userNo != 0) {
    		
	    	input.setUserNo(userNo);
	
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
    	}
        return result;
    	
    }
    
    @Override
    public void setAlarmList(Alarm input) {
    	
    	if(alarm_list != null) {
    		log.debug("현재 리스트의 길이는 : " + alarm_list.size());
	    	for(int i=0; i<alarm_list.size(); i++) {
	    		if(alarm_list.get(i).getAlarmNo() == input.getAlarmNo()) {
	    			log.debug("[SYS]이미 등록된 알람이므로 return");
	    			return;
	    		}
	    	}
    	}
    	alarm_list.add(input);
    }
    
    @Override
    public List<Alarm> getAlarmListData() {
    	return this.alarm_list;
    }
    
    @Override
    public void setAlarmUserNo(int userNo) {
    	this.userNo = userNo;
    }
    
    
    
    
    
	
	
	
	
}
