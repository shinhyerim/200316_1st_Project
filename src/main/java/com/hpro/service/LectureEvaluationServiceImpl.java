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
	
	// ������ ���
	@Override
	public int insert(LectureEvaluationDTO evaluationDTO) throws Exception {
		return evaluationDAO.insert(evaluationDTO);
	}
	
	// ������ ������ ���� ���� ��������
	@Override
	public LectureEvaluationDTO view(int evaluationID) throws Exception {
		return evaluationDAO.view(evaluationID);
	}
	
	// ������ ����
	@Override
	public int update(LectureEvaluationDTO evaluationDTO) throws Exception {
		return evaluationDAO.update(evaluationDTO);
	}

	// ������ ���� (�����)
	@Override
	public int updateStatus(int evaluationID) throws Exception {
		return evaluationDAO.updateStatus(evaluationID);
	}
	
	// ������ ���(�����)
	@Override
	public List<LectureEvaluationDTO> list(Search search) throws Exception {
		return evaluationDAO.list(search);
	}
	
	// ������ ���(�����, ����������)
	@Override
	public List<LectureEvaluationDTO> evaluationUser(String userID) throws Exception {
		return evaluationDAO.evaluationUser(userID);
	}
	
	// ������ ���(������)
	@Override
	public List<LectureEvaluationDTO> evaluationAdmin(Search search) throws Exception {
		return evaluationDAO.evaluationAdmin(search);
	}

	// ������ ����(������)
	@Override
	public int delete(int evaluationID) throws Exception {
		return evaluationDAO.delete(evaluationID);
	}

	// ������ �� ����
	@Override
	public int count(Search search) throws Exception {
		return evaluationDAO.count(search);
	}

	// '��õ' �� 1����
	@Override
	public int like(int evaluationID) throws Exception {
		return evaluationDAO.like(evaluationID);
	}

	// ������ ���� ����
	@Override
	public LectureEvaluationDTO adminView(int evaluationID) throws Exception {
		return evaluationDAO.adminView(evaluationID);
	}
}