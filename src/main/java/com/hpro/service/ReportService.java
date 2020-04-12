package com.hpro.service;

import java.util.List;

import com.hpro.commons.Pagination;
import com.hpro.commons.Search;
import com.hpro.dto.ReportDTO;

public interface ReportService {

	// 신고글 작성
	public int report(ReportDTO reportDTO) throws Exception;
	
	// 신고글 삭제
	public int updateStatus(int reportID) throws Exception;
	
	// 신고글 목록 (사용자)
	public List<ReportDTO> reportUser(String userID) throws Exception;
	
	// 신고글 목록 (관리자)
	public List<ReportDTO> reportAdmin(Search search) throws Exception;
	
	// 신고글 개수
	public int count(Search search) throws Exception;

	// 신고글 접수
	public int accept(Integer reportID) throws Exception;
	
	// 신고글 처리
	public int success(Integer reportID) throws Exception;
	
	// 신고글 상세내용보기
	public ReportDTO view(int reportID) throws Exception;
}
