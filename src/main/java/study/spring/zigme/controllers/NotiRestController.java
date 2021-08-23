//package study.spring.zigme.controllers;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import lombok.extern.slf4j.Slf4j;
//import study.spring.zigme.helper.RegexHelper;
//import study.spring.zigme.helper.WebHelper;
//import study.spring.zigme.model.Post;
//import study.spring.zigme.service.NotiService;
//
//@Slf4j
//@RestController
//public class NotiRestController {
//	/** WebHelper 주입 */
//	@Autowired WebHelper webHelper;
//	
//	/** RegexHelper 주입 */
//	@Autowired RegexHelper regexHelper;
//	
//	/** Service 패턴 구현제 주입*/
//	@Autowired NotiService notiService;
//	
//	/**목록 페이지 */
//	@RequestMapping(value = "/noti", method = RequestMethod.GET)
//	public Map<String, Object> get_list(
//			@RequestParam(value = "userNo", defaultValue = "0") int userNo){
//        /** 1) 데이터 조회하기 - 게시글의 댓글 */
//        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
//        Post input1 = new Post();
//        List<Post> output1 = null;   // 조회결과가 저장될 객체
//        input1.setUserNo(userNo);
//        System.out.println(">>>>>>>>>>" +userNo);
//
//        try {
//            // 데이터 조회하기
//            output1 = notiService.getNotiList(input1);
//        System.out.println("아웃풋 제발 나와줘 " + output1);
//        } catch (Exception e) {
//            return webHelper.getJsonError(e.getLocalizedMessage());
//        }
//        
//        /** 2) 데이터 조회하기 - 댓글의 댓글 */
//        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
//        Post input2 = new Post();
//        List<Post> output2 = null;   // 조회결과가 저장될 객체
//        input2.setUserNo(userNo);
//        try {
//        	// 데이터 조회하기
//        	output2 = notiService.getNotiCommList(input2);
//        	System.out.println("아웃풋222 제발 나와줘 " + output2);
//        } catch (Exception e) {
//        	return webHelper.getJsonError(e.getLocalizedMessage());
//        }
//        
//        /** 3) JSON 출력하기 */
//        Map<String, Object> data = new HashMap<String, Object>();
//        data.put("output1", output1);
//        data.put("output2", output2);
//        System.out.println("데이터확인하기 : " + data);
//
//        return webHelper.getJsonData(data);
//    } 
//
//	/** 알림 리스트 동적 제거 (수정) */
//	@RequestMapping(value = "/noti", method = RequestMethod.PUT)
//	public Map<String, Object> updateItem(
//			@RequestParam(value="postNoti", defaultValue="0") String postNoti,
//			@RequestParam(value="postNo", defaultValue="0") int postNo,
//			@RequestParam(value="commNoti", defaultValue="0") String commNoti,
//			@RequestParam(value="commNo", defaultValue="0") int commNo){
//		
//		Map<String, Object> data = new HashMap<String, Object>();
//		 
//        /** 게시글의 댓글 데이터 수정 : 읽지않음(2) -> 읽음(1) */
//        // 수정할 값들을 Beans에 담는다.
//		if (postNo != 0) {
//        Post input1 = new Post();
//        input1.setPostNo(postNo);
//        input1.setPostNoti(postNoti);
//        log.debug("LOG >>> : " + input1.getPostNoti());
//        
//        // 수정된 결과를 조회하기위한 객체
//        Post output1 = null;   
//
//        try {
//            // 데이터 수정
//            notiService.editNoti(input1);
//            
//            // 수정 결과 조회
////            output1 = notiService.getNotiItem(input1);
//        } catch (Exception e) {
//            return webHelper.getJsonError(e.getLocalizedMessage());
//        }
//        
//        data.put("item", output1);
//		}
//        
//		
//        /** 대댓글 데이터 수정 : 읽지않음(2) -> 읽음(1)*/
//        // 수정할 값들을 Beans에 담는다.
//		if (commNo != 0) {
//        Post input2 = new Post();
//        input2.setCommNo(commNo);
//        input2.setCommNoti(commNoti);
//        
//        // 수정된 결과를 조회하기위한 객체
//        Post output2 = null;   
//        
//        try {
//        	// 데이터 수정
//        	notiService.editCommNoti(input2);
//        	
//        } catch (Exception e) {
//        	return webHelper.getJsonError(e.getLocalizedMessage());
//        }
//        
//  
//        data.put("item", output2);
//		}
//        
//        return webHelper.getJsonData(data);
//    } 
//
//}
