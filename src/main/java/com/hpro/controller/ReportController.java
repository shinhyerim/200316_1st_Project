package com.hpro.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hpro.commons.Search;
import com.hpro.dto.ReportDTO;
import com.hpro.service.ReportService;

@Controller
public class ReportController {
	@Inject
	ReportService reportService;
	
	// 신고글 작성
	@RequestMapping(value="reportWrite.le", method=RequestMethod.POST)
	public String report(@ModelAttribute ReportDTO reportDTO, Model model) throws Exception {
		int result = reportService.report(reportDTO);
		model.addAttribute("result", result);
		return "report/reportWrite";
	}
	
	// 신고글 삭제 (사용자)
	@RequestMapping(value="reportDelete.le",method=RequestMethod.GET)
	public String delete(Integer reportID, Model model) throws Exception{
		int result = reportService.updateStatus(reportID);
		model.addAttribute("result", result);
		return "report/reportDelete";
	}
	
	// 신고글 목록 (사용자)
	@RequestMapping(value="reportUser.le",method=RequestMethod.GET)
	public String reportUser(String userID, Model model) throws Exception{
		model.addAttribute("userReportList", reportService.reportUser(userID));
		return "report/reportUser";
	}
	
	// 신고글 목록 (관리자)
	@RequestMapping(value="reportAdmin.le",method=RequestMethod.GET)
	public String reportAdmin(Model model, 
			@RequestParam(required=false, defaultValue="1")int page,
			@RequestParam(required=false, defaultValue="1")int range,
			@RequestParam(required=false, defaultValue="title")String searchType,
			@RequestParam(required=false)String keyword) throws Exception{
		
		// 검색
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		// 전체 게시글 개수
		int listCnt = reportService.count(search);
		
		// 페이징처리
		search.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", search);
		model.addAttribute("adminReportList", reportService.reportAdmin(search));
		return "admin/reportAdmin";
	}
	
	// 신고글 상세내용보기
	@RequestMapping(value="reportView.le",method=RequestMethod.GET)
	public String reportView(int reportID, Model model) throws Exception{
		ReportDTO reportDTO = reportService.view(reportID);
		model.addAttribute("reportContent", reportDTO);
		return "admin/reportView";
	}
	
	// 접수 및 처리 시 java.lang.IllegalStateException이 발생해서 int를 Integer로 변경해줌
	// 신고글 접수
	@ResponseBody
	@RequestMapping(value="reportAccept.le", method=RequestMethod.POST)
	public int reportAccept(@RequestParam(value="reportID")Integer reportID) throws Exception {
		System.out.println("ACCEPT REPORT ID: "+reportID);
		int acceptResult = reportService.accept(reportID);
		System.out.println("ACCEPT RESULT: "+acceptResult);
		return acceptResult;
	}
	
	// 신고글 처리
	@ResponseBody
	@RequestMapping(value="reportSuccess.le", method=RequestMethod.POST)
	public int reportSuccess(@RequestParam(value="reportID")Integer reportID) throws Exception{
		System.out.println("SUCCESS REPORT ID: "+reportID);
		int successResult = reportService.success(reportID);
		System.out.println("SUCCESS RESULT: "+successResult);
		return successResult;
	}
	
}
