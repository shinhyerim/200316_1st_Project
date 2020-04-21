package com.hpro.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hpro.commons.Pagination;
import com.hpro.commons.Search;
import com.hpro.dao.LectureEvaluationDAO;
import com.hpro.dto.LectureEvaluationDTO;

@Service
public class LectureEvaluationServiceImpl implements LectureEvaluationService {
	@Inject
	LectureEvaluationDAO evaluationDAO;
	
	// 강의평가 등록
	@Override
	public int insert(LectureEvaluationDTO evaluationDTO) throws Exception {
		return evaluationDAO.insert(evaluationDTO);
	}
	
	// 강의평가 수정을 위한 내용 가져오기
	@Override
	public LectureEvaluationDTO view(int evaluationID) throws Exception {
		return evaluationDAO.view(evaluationID);
	}
	
	// 강의평가 수정
	@Override
	public int update(LectureEvaluationDTO evaluationDTO) throws Exception {
		return evaluationDAO.update(evaluationDTO);
	}

	// 강의평가 삭제 (사용자)
	@Override
	public int updateStatus(int evaluationID) throws Exception {
		return evaluationDAO.updateStatus(evaluationID);
	}
	
	// 강의평가 목록(사용자)
	@Override
	public List<LectureEvaluationDTO> list(Search search) throws Exception {
		return evaluationDAO.list(search);
	}
	
	// 강의평가 목록(사용자, 마이페이지)
	@Override
	public List<LectureEvaluationDTO> evaluationUser(String userID) throws Exception {
		return evaluationDAO.evaluationUser(userID);
	}
	
	// 강의평가 목록(관리자)
	@Override
	public List<LectureEvaluationDTO> evaluationAdmin(Search search) throws Exception {
		return evaluationDAO.evaluationAdmin(search);
	}

	// 강의평가 삭제(관리자)
	@Override
	public int delete(int evaluationID) throws Exception {
		return evaluationDAO.delete(evaluationID);
	}

	// 강의평가 글 개수
	@Override
	public int count(Search search) throws Exception {
		return evaluationDAO.count(search);
	}

	// '추천' 값 1증가
	@Override
	public int like(int evaluationID) throws Exception {
		return evaluationDAO.like(evaluationID);
	}

	// 강의평가 내용 보기
	@Override
	public LectureEvaluationDTO adminView(int evaluationID) throws Exception {
		return evaluationDAO.adminView(evaluationID);
	}
}