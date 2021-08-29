package study.spring.zigme.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
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

    	Alarm input = new Alarm();        
    	List<Alarm> result = null;    	
    	
    	if (userNo != 0) {
    		Calendar cal = Calendar.getInstance();    		
    		int day = cal.get(Calendar.DAY_OF_WEEK);
    		String today = "Y";
    		
    		log.debug("오늘은 " + day + " 입니다");
    		
    		// 현재 요일을 조회하여 오늘에 해당되는 알람 목록을 조회한다. 
    		if(day == 1) {
    			input.setSunAct(today);
    		} else if(day == 2) {
    			input.setMonAct(today);
    		} else if(day == 3) {
    			input.setTueAct(today);
    		} else if(day == 4) {
    			input.setWedAct(today);
    		} else if(day == 5) {
    			input.setThuAct(today);
    		} else if(day == 6) {
    			input.setFriAct(today);
    		} else if(day == 7) {
    			input.setSatAct(today);
    		}
    		
    		input.setUserNo(userNo);
	    	
	    	
	        try {
	            result = sqlSession.selectList("AlarmMapper.selectAlarmList", input);
	
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
    public void setAlarmListClear() {
    	this.alarm_list.clear();
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
