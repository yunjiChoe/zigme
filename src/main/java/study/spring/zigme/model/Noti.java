/** 
 * @author sollee
 * noti beans 별도로 사용하지 않고 알림페이지는 post beans를 통해 구현하기로함 
 * 본 파일은 추후 정리단계에서 삭제할 예정입니다.
 * @date 2021-08-07
 * */

package study.spring.zigme.model;

import lombok.Data;

@Data
public class Noti {
	/** 1) Post 관련 컬럼 */
	private int postNo;
	private String postTitle;
	private String postNoti;
	private int userNo;
	
	/** 2) Comment 관련 컬럼 */
	private int commNo;
	private String commContent;
	private int parentNo;
	private String commNoti;
}
