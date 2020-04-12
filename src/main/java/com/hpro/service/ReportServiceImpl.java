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
	
	// 신고글 작성
	@Override
	public int report(ReportDTO reportDTO) throws Exception {
		return reportDAO.report(reportDTO);
	}
	
	// 신고글 삭제 (사용자)
	@Override
	public int updateStatus(int reportID) throws Exception {
		return reportDAO.updateStatus(reportID);
	}

	// 신고글 목록 (사용자)
	@Override
	public List<ReportDTO> reportUser(String userID) throws Exception {
		return reportDAO.reportUser(userID);
	}

	// 신고글 개수
	@Override
	public int count(Search search) throws Exception {
		return reportDAO.count(search);
	}

	// 신고글 목록 (관리자)
	@Override
	public List<ReportDTO> reportAdmin(Search search) throws Exception {
		return reportDAO.reportAdmin(search);
	}


	// 신고글 접수 
	@Override
	public int accept(Integer reportID) throws Exception {
		return reportDAO.accept(reportID);
	}

	// 신고글 처리
	public int success(Integer reportID) throws Exception {
		return reportDAO.success(reportID);
	}

	@Override
	public ReportDTO view(int reportID) throws Exception {
		return reportDAO.view(reportID);
	}
}
