package com.hpro.dao;

import java.util.List;

import com.hpro.commons.Search;
import com.hpro.dto.LectureEvaluationDTO;

public interface LectureEvaluationDAO {
	
	// ������ ���
	public int insert(LectureEvaluationDTO evaluationDTO) throws Exception;
	
	// ������ ���� ����
	public LectureEvaluationDTO view(int evaluationID) throws Exception;
	
	// ������ ����
	public int update(LectureEvaluationDTO evaluationDTO) throws Exception;
	
	// ������ ���� (�����)
	public int updateStatus(int evaluationID) throws Exception;
	
	// ������ ��� (�����)
	public List<LectureEvaluationDTO> list(Search search) throws Exception;
	
	// ������ ��� (�����, ����������)
	public List<LectureEvaluationDTO> evaluationUser(String userID) throws Exception;
	
	// ������ ��� (������)
	public List<LectureEvaluationDTO> evaluationAdmin(Search search) throws Exception;
	
	// ������ ���� ���� (������)
	public LectureEvaluationDTO adminView(int evaluationID) throws Exception;
	
	// ������ ���� (������)
	public int delete(int evaluationID) throws Exception;
	
	// ������ �� ����
	public int count(Search search) throws Exception;
	
	// '��õ' �� 1����
	public int like(int evaluationID) throws Exception;
}
