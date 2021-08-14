package study.spring.zigme.service;

import java.util.List;

import study.spring.zigme.model.Food;

public interface FoodService {
	/**
	 * 음식 데이터 상세 조회
	 * @param Food 조회할 음식의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception 
	 */
	public Food getFoodItem(Food input) throws Exception;
	
	/**
	 * 음식 데이터 목록 조회
	 * @param Food 검색조건을 담고 있는 Beans
	 * @return 조회결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Food> getFoods(Food input) throws Exception;
		
	/**
	 * 음식 데이터 등록하기
	 * @param Food 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addFood(Food input) throws Exception;
	
	/**
	 * 음식 데이터 수정하기
	 * @param Food 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editFood(Food input) throws Exception;
	
	/**
	 * 음식 데이터 삭제하기
	 * @param Food 삭제할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteFood(Food input) throws Exception;
}
