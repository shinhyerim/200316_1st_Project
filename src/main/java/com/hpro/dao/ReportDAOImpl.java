package com.hpro.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hpro.commons.Pagination;
import com.hpro.commons.Search;
import com.hpro.dto.ReportDTO;

@Repository
public class ReportDAOImpl implements ReportDAO {
	@Inject
	SqlSessionTemplate sst;
	
	// �Ű�� �ۼ�
	@Override
	public int report(ReportDTO reportDTO) throws Exception {
		return sst.insert("reportMapper.report", reportDTO);
	}
	
	// �Ű�� ���� (�����)
	@Override
	public int updateStatus(int reportID) throws Exception {
		return sst.update("reportMapper.updateStatus", reportID);
	}

	// �Ű�� ��� (�����)
	@Override
	public List<ReportDTO> reportUser(String userID) throws Exception {
		return sst.selectList("reportMapper.reportUser", userID);
	}

	// �Ű�� ����
	@Override
	public int count(Search search) throws Exception {
		return sst.selectOne("reportMapper.count");
	}

	// �Ű�� ��� (������)
	@Override
	public List<ReportDTO> reportAdmin(Search search) throws Exception {
		return sst.selectList("reportMapper.list",search);
	}


	// �Ű�� ����
	@Override
	public int accept(Integer reportID) throws Exception {
		return sst.update("reportMapper.accept", reportID);
	}

	// �Ű�� ó��
	@Override
	public int success(Integer reportID) throws Exception {
		return sst.update("reportMapper.success", reportID);
	}

	// �Ű�� �󼼳��뺸��
	@Override
	public ReportDTO view(int reportID) throws Exception {
		return sst.selectOne("reportMapper.view", reportID);
	}

}
