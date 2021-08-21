package study.spring.zigme.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.zigme.model.AdminCateCondiData;
import study.spring.zigme.service.CatecondiService;

/** 교수 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
//--> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class CatecondiServiceImpl implements CatecondiService{
	
	 /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;

	@Override
	public AdminCateCondiData getAdminCateCondiDataItem(AdminCateCondiData input) throws Exception {
		AdminCateCondiData result = null;

        try {
            result = sqlSession.selectOne("AdminCateCondiDataMapper.selectItem", input);

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
	public List<AdminCateCondiData> getAdminCateCondiDataList(AdminCateCondiData input) throws Exception {
		List<AdminCateCondiData> result = null;

        try {
            result = sqlSession.selectList("AdminCateCondiDataMapper.selectList", input);

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
	public int addAdminCateCondiData(AdminCateCondiData input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("AdminCateCondiDataMapper.insertItem", input);

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
	public int editAdminCateCondiData(AdminCateCondiData input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.update("AdminCateCondiDataMapper.updateItem", input);

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
	public int deleteAdminCateCondiData(AdminCateCondiData input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.delete("AdminCateCondiDataMapper.deleteItem", input);

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
	
	
  
}
