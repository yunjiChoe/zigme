package study.spring.zigme.service;

import java.util.List;

import study.spring.zigme.model.Scheduler;

public interface ScheService {
	/**
	 * 캘린더의 일정을 등록한다.
	 * @param 일정 데이터를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addScheduler(Scheduler input) throws Exception;
	
	/**
	 * 캘린더의 일정을 상세 조회한다.
	 * @param 일정 데이터를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Scheduler getScheItem(Scheduler input) throws Exception;
	
	public List<Scheduler> getScheList(Scheduler input) throws Exception;
	
	public int getScheCount(Scheduler input) throws Exception;
	
	public int deleteSche(Scheduler input) throws Exception;
	
	public int editSche(Scheduler input) throws Exception;

}
