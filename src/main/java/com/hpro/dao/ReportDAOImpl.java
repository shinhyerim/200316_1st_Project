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
	
	// 신고글 작성
	@Override
	public int report(ReportDTO reportDTO) throws Exception {
		return sst.insert("reportMapper.report", reportDTO);
	}
	
	// 신고글 삭제 (사용자)
	@Override
	public int updateStatus(int reportID) throws Exception {
		return sst.update("reportMapper.updateStatus", reportID);
	}

	// 신고글 목록 (사용자)
	@Override
	public List<ReportDTO> reportUser(String userID) throws Exception {
		return sst.selectList("reportMapper.reportUser", userID);
	}

	// 신고글 개수
	@Override
	public int count(Search search) throws Exception {
		return sst.selectOne("reportMapper.count");
	}

	// 신고글 목록 (관리자)
	@Override
	public List<ReportDTO> reportAdmin(Search search) throws Exception {
		return sst.selectList("reportMapper.list",search);
	}


	// 신고글 접수
	@Override
	public int accept(Integer reportID) throws Exception {
		return sst.update("reportMapper.accept", reportID);
	}

	// 신고글 처리
	@Override
	public int success(Integer reportID) throws Exception {
		return sst.update("reportMapper.success", reportID);
	}

	// 신고글 상세내용보기
	@Override
	public ReportDTO view(int reportID) throws Exception {
		return sst.selectOne("reportMapper.view", reportID);
	}

}
