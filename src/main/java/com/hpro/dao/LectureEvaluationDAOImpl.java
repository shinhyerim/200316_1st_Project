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
	
	// ������ ���
	@Override
	public int insert(LectureEvaluationDTO evaluationDTO) throws Exception {
		return sst.insert("evaluationMapper.insert", evaluationDTO);
	}
	
	// ������ ������ ���� ���� ��������
	@Override
	public LectureEvaluationDTO view(int evaluationID) throws Exception {
		return sst.selectOne("evaluationMapper.view", evaluationID);
	}

	// ������ ����
	@Override
	public int update(LectureEvaluationDTO evaluationDTO) throws Exception {
		return sst.update("evaluationMapper.update", evaluationDTO);
	}
	
	// ������ ����(�����)
	@Override
	public int updateStatus(int evaluationID) throws Exception {
		return sst.update("evaluationMapper.updateStatus", evaluationID);
	}

	// ������ ���(�����)
	@Override
	public List<LectureEvaluationDTO> list(Search search) throws Exception {
		return sst.selectList("evaluationMapper.list", search);
	}
	
	// ������ ���(�����, ���������� ���)
	@Override
	public List<LectureEvaluationDTO> evaluationUser(String userID) throws Exception {
		return sst.selectList("evaluationMapper.evaluationUser", userID);
	}

	// ������ ���(������)
	@Override
	public List<LectureEvaluationDTO> evaluationAdmin(Search search) throws Exception {
		return sst.selectList("evaluationMapper.evaluationAdmin", search);
	}
	
	// ������ ����(������)
	@Override
	public int delete(int evaluationID) throws Exception {
		return sst.delete("evaluationMapper.delete", evaluationID);
	}
	
	// ������ �� ����
	@Override
	public int count(Search search) throws Exception {
		return sst.selectOne("evaluationMapper.count",search);
	}
	
	// '��õ' �� 1���� ��Ű��
	@Override
	public int like(int evaluationID) throws Exception {
		return sst.update("evaluationMapper.like", evaluationID);
	}

	@Override
	public LectureEvaluationDTO adminView(int evaluationID) throws Exception {
		return sst.selectOne("evaluationMapper.adminView", evaluationID);
	}

}