package com.hpro.dao;

import java.util.List;

import com.hpro.commons.Search;
import com.hpro.dto.LectureEvaluationDTO;

public interface LectureEvaluationDAO {
	
	// 강의평가 등록
	public int insert(LectureEvaluationDTO evaluationDTO) throws Exception;
	
	// 강의평가 내용 보기
	public LectureEvaluationDTO view(int evaluationID) throws Exception;
	
	// 강의평가 수정
	public int update(LectureEvaluationDTO evaluationDTO) throws Exception;
	
	// 강의평가 삭제 (사용자)
	public int updateStatus(int evaluationID) throws Exception;
	
	// 강의평가 목록 (사용자)
	public List<LectureEvaluationDTO> list(Search search) throws Exception;
	
	// 강의평가 목록 (사용자, 마이페이지)
	public List<LectureEvaluationDTO> evaluationUser(String userID) throws Exception;
	
	// 강의평가 목록 (관리자)
	public List<LectureEvaluationDTO> evaluationAdmin(Search search) throws Exception;
	
	// 강의평가 내용 보기 (관리자)
	public LectureEvaluationDTO adminView(int evaluationID) throws Exception;
	
	// 강의평가 삭제 (관리자)
	public int delete(int evaluationID) throws Exception;
	
	// 강의평가 글 개수
	public int count(Search search) throws Exception;
	
	// '추천' 값 1증가
	public int like(int evaluationID) throws Exception;
}
