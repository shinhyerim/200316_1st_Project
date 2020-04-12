package com.hpro.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hpro.commons.Pagination;
import com.hpro.commons.Search;
import com.hpro.dao.ReportDAO;
import com.hpro.dto.ReportDTO;

@Service
public class ReportServiceImpl implements ReportService{
	@Inject
	ReportDAO reportDAO;
	
	// �Ű�� �ۼ�
	@Override
	public int report(ReportDTO reportDTO) throws Exception {
		return reportDAO.report(reportDTO);
	}
	
	// �Ű�� ���� (�����)
	@Override
	public int updateStatus(int reportID) throws Exception {
		return reportDAO.updateStatus(reportID);
	}

	// �Ű�� ��� (�����)
	@Override
	public List<ReportDTO> reportUser(String userID) throws Exception {
		return reportDAO.reportUser(userID);
	}

	// �Ű�� ����
	@Override
	public int count(Search search) throws Exception {
		return reportDAO.count(search);
	}

	// �Ű�� ��� (������)
	@Override
	public List<ReportDTO> reportAdmin(Search search) throws Exception {
		return reportDAO.reportAdmin(search);
	}


	// �Ű�� ���� 
	@Override
	public int accept(Integer reportID) throws Exception {
		return reportDAO.accept(reportID);
	}

	// �Ű�� ó��
	public int success(Integer reportID) throws Exception {
		return reportDAO.success(reportID);
	}

	@Override
	public ReportDTO view(int reportID) throws Exception {
		return reportDAO.view(reportID);
	}
}
