package study.spring.zigme.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.zigme.helper.PageData;
import study.spring.zigme.helper.RegexHelper;
import study.spring.zigme.helper.WebHelper;
import study.spring.zigme.model.AdminCateCondiData;
import study.spring.zigme.model.Food;
import study.spring.zigme.service.CatecondiService;


@RestController
public class CateCondiRestController {
	 /** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;
    
    /** Service 패턴 구현체 주입 */
    // --> import study.spring.springhelper.service.ProfessorService;
    @Autowired  CatecondiService scadminService;
	
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	
	/** 목록 페이지 */
    @RequestMapping(value = "/admin/catecondi", method = RequestMethod.GET)
    public Map<String, Object> get_cate(
            // 검색어
            @RequestParam(value="keyword", required=false) String keyword,
            // 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value="page", defaultValue="1") int nowPage) {
        
        /** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0;              // 전체 게시글 수
        int listCount  = 10;             // 한 페이지당 표시할 목록 수
        int pageCount  = 5;              // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        AdminCateCondiData input = new AdminCateCondiData();
        input.setCateCondiName(keyword);
        //input.setCateCondiNo(pageCount);
        //input.setCateCondiFlag();

        List<AdminCateCondiData> output = null;   // 조회결과가 저장될 객체
        

        try {
            // 데이터 조회하기
            output = scadminService.getAdminCateCondiDataList(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("keyword", keyword);
        data.put("item", output);

        return webHelper.getJsonData(data);
    }
    
    
    
    /** 상세 페이지 */
	@RequestMapping(value = "/admin/catecondi/{cateCondiNo}", method = RequestMethod.GET)
	public Map<String, Object> get_cate_item(
			@PathVariable(" cateCondiNo") int cateCondiNo) {
		/** 1) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		 AdminCateCondiData input = new AdminCateCondiData();
		input.setCateCondiNo(cateCondiNo);

		// 조회 결과를 저장할 객체 선언
		AdminCateCondiData output =null;

		try {
			// 데이터 조회
			output = scadminService.getAdminCateCondiDataItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 2) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);

		return webHelper.getJsonData(data);
	}


	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/admin/catecondi", method = RequestMethod.POST)
	public Map<String, Object> get_cate_post(
			@RequestParam(value = "cateCondiNo", defaultValue = "") int cateCondiNo,
			@RequestParam(value = "cateCondiName", defaultValue = "") String cateCondiName,
			@RequestParam(value = "cateCondiFlag", defaultValue = "") String cateCondiFlag
			) {
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 -> String으로 파라미터가 선언 되어있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (cateCondiNo == 0)  {
			return webHelper.getJsonWarning("업종-컨디션번호가 조회되지 않습니다.");
		}
		if (!regexHelper.isKor(cateCondiName)) {
			return webHelper.getJsonWarning(" 업종-컨디션은 한글만 가능합니다.");
		}
		if (!regexHelper.isValue(cateCondiFlag)) {
			return webHelper.getJsonWarning("업종-컨디션을 선택하세요.");
		}
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		AdminCateCondiData input = new AdminCateCondiData();
		input.setCateCondiNo(cateCondiNo);
		input.setCateCondiName(cateCondiName);
		input.setCateCondiFlag(cateCondiFlag);
	

		// 저장된 결과를 조회하기 위한 객체
		AdminCateCondiData output = null;

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			scadminService.addAdminCateCondiData(input);

			// 데이터 조회
			output = scadminService.getAdminCateCondiDataItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);

		return webHelper.getJsonData(map);
	}
	
	
	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/admin/catecondi", method = RequestMethod.PUT)
	public Map<String, Object> put(
			@RequestParam(value = "cateCondiNo", defaultValue = "") int cateCondiNo,
			@RequestParam(value = "cateCondiName", defaultValue = "") String cateCondiName,
			@RequestParam(value = "cateCondiFlag", defaultValue = "") String cateCondiFlag) {
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 -> String으로 파라미터가 선언 되어있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (cateCondiNo == 0)  {
			return webHelper.getJsonWarning("업종-컨디션번호가 조회되지 않습니다.");
		}
		if (!regexHelper.isKor(cateCondiName)) {
			return webHelper.getJsonWarning(" 업종-컨디션은 한글만 가능합니다.");
		}
		if (!regexHelper.isValue(cateCondiFlag)) {
			return webHelper.getJsonWarning("업종-컨디션을 선택하세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		AdminCateCondiData input = new AdminCateCondiData();
		input.setCateCondiNo(cateCondiNo);
		input.setCateCondiName(cateCondiName);
		input.setCateCondiFlag(cateCondiFlag);

		// 저장된 결과를 조회하기 위한 객체
		AdminCateCondiData output = null;

		try {
			// 데이터 수정
			scadminService.editAdminCateCondiData(input);

			// 수정 결과 조회
			output = scadminService.getAdminCateCondiDataItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);

		return webHelper.getJsonData(map);
	}
	
	/** 삭제 처리 */
	@RequestMapping(value = "/admin/catecondi", method = RequestMethod.DELETE)
	public Map<String, Object> delete(
			@RequestParam(value = "cateCondiNo", defaultValue = "") int cateCondiNo) {
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 -> String으로 파라미터가 선언 되어있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (cateCondiNo == 0)  {
			return webHelper.getJsonWarning("업종-컨디션번호가 조회되지 않습니다.");
		}
		
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		AdminCateCondiData input = new AdminCateCondiData();
		input.setCateCondiNo(cateCondiNo);
		
		try {
			scadminService.deleteAdminCateCondiData(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}

}
