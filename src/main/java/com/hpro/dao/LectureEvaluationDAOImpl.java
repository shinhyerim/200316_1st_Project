package com.hpro.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hpro.commons.Pagination;
import com.hpro.commons.Search;
import com.hpro.dto.LectureEvaluationDTO;

@Repository
public class LectureEvaluationDAOImpl implements LectureEvaluationDAO{
	@Inject
	SqlSessionTemplate sst;
	
	// 강의평가 등록
	@Override
	public int insert(LectureEvaluationDTO evaluationDTO) throws Exception {
		return sst.insert("evaluationMapper.insert", evaluationDTO);
	}
	
	// 강의평가 수정을 위한 내용 가져오기
	@Override
	public LectureEvaluationDTO view(int evaluationID) throws Exception {
		return sst.selectOne("evaluationMapper.view", evaluationID);
	}

	// 강의평가 수정
	@Override
	public int update(LectureEvaluationDTO evaluationDTO) throws Exception {
		return sst.update("evaluationMapper.update", evaluationDTO);
	}
	
	// 강의평가 삭제(사용자)
	@Override
	public int updateStatus(int evaluationID) throws Exception {
		return sst.update("evaluationMapper.updateStatus", evaluationID);
	}

	// 강의평가 목록(사용자)
	@Override
	public List<LectureEvaluationDTO> list(Search search) throws Exception {
		return sst.selectList("evaluationMapper.list", search);
	}
	
	// 강의평가 목록(사용자, 마이페이지 사용)
	@Override
	public List<LectureEvaluationDTO> evaluationUser(String userID) throws Exception {
		return sst.selectList("evaluationMapper.evaluationUser", userID);
	}

	// 강의평가 목록(관리자)
	@Override
	public List<LectureEvaluationDTO> evaluationAdmin(Search search) throws Exception {
		return sst.selectList("evaluationMapper.evaluationAdmin", search);
	}
	
	// 강의평가 삭제(관리자)
	@Override
	public int delete(int evaluationID) throws Exception {
		return sst.delete("evaluationMapper.delete", evaluationID);
	}
	
	// 강의평가 글 개수
	@Override
	public int count(Search search) throws Exception {
		return sst.selectOne("evaluationMapper.count",search);
	}
	
	// '추천' 값 1증가 시키기
	@Override
	public int like(int evaluationID) throws Exception {
		return sst.update("evaluationMapper.like", evaluationID);
	}

	@Override
	public LectureEvaluationDTO adminView(int evaluationID) throws Exception {
		return sst.selectOne("evaluationMapper.adminView", evaluationID);
	}

}