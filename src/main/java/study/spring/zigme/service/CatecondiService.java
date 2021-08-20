package study.spring.zigme.service;

import java.util.List;

import study.spring.zigme.model.AdminCateCondiData;

/** 음식의 카테고리 관리 기능을 제공하기 위한 Service 계층. */

public interface CatecondiService {
	/** 
	 *  admincatecondidata 상세 조회
	 * @param admincatecondidata  조회할 교수의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public AdminCateCondiData getAdminCateCondiDataItem(AdminCateCondiData input) throws Exception;
	
	/** 
	 * admincatecondidata 상세 조회
	 * @param admincatecondidata 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<AdminCateCondiData> getAdminCateCondiDataList(AdminCateCondiData input) throws Exception;
	/** 
	 * admincatecondidata 저장되어 있는 갯수 조회
	 * @param Professor 검색조건을 담고 있는 Beans
	 * @return input
	 * @throws Exception
	 */
	public int getAdminCateCondiDataCount(AdminCateCondiData input) throws Exception;
	
	/** 
	 *  admincatecondidata 데이터 등록하기
	 * @param Professor  저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addAdminCateCondiData(AdminCateCondiData input) throws Exception;
	
	/** 
	 * admincatecondidata 데이터 수정하기
	 * @param Professor 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editAdminCateCondiData(AdminCateCondiData input) throws Exception;
	
	/** 
	 * admincatecondidata 데이터 삭제하기
	 * @param Professor 삭제항 교수의 일련번호를 담고 있는 Beans
	 * @return input
	 * @throws Exception
	 */
	public int deleteAdminCateCondiData(AdminCateCondiData input) throws Exception;

}
