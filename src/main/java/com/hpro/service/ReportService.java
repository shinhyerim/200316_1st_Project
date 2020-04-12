package com.hpro.service;

import java.util.List;

import com.hpro.commons.Pagination;
import com.hpro.commons.Search;
import com.hpro.dto.ReportDTO;

public interface ReportService {

	// �Ű�� �ۼ�
	public int report(ReportDTO reportDTO) throws Exception;
	
	// �Ű�� ����
	public int updateStatus(int reportID) throws Exception;
	
	// �Ű�� ��� (�����)
	public List<ReportDTO> reportUser(String userID) throws Exception;
	
	// �Ű�� ��� (������)
	public List<ReportDTO> reportAdmin(Search search) throws Exception;
	
	// �Ű�� ����
	public int count(Search search) throws Exception;

	// �Ű�� ����
	public int accept(Integer reportID) throws Exception;
	
	// �Ű�� ó��
	public int success(Integer reportID) throws Exception;
	
	// �Ű�� �󼼳��뺸��
	public ReportDTO view(int reportID) throws Exception;
}
