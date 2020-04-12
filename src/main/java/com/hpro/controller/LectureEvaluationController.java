package com.hpro.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hpro.commons.Search;
import com.hpro.dto.LectureEvaluationDTO;
import com.hpro.service.LectureEvaluationService;

@Controller
public class LectureEvaluationController {
	@Inject
	LectureEvaluationService evaluationService;
	
	// ������ ��� ȭ�� �� ó��
	@RequestMapping(value="evaluationWrite.le")
	public String writeForm() {
		return "lectureevaluation/evaluationWrite";
	}
	
	@RequestMapping(value="evaluationWriteAction.le", method=RequestMethod.POST)
	public String writeAction(@ModelAttribute LectureEvaluationDTO evaluationDTO, Model model) throws Exception {
		int result = evaluationService.insert(evaluationDTO);
		model.addAttribute("result", result);
		return "lectureevaluation/evaluationWriteAction";
	}
	
	// ������ ��� (�����)
	@RequestMapping(value="evaluationList.le", method=RequestMethod.GET)
	public String list(Model model, 
			@RequestParam(required=false, defaultValue="1")int page,
			@RequestParam(required=false, defaultValue="1")int range,
			@RequestParam(required=false)String searchType,
			@RequestParam(required=false)String keyword,
			@ModelAttribute("search")Search search) throws Exception{
		
		// �˻�
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		// ��ü ������ �� ����
		int listCnt = evaluationService.count(search);
	
		search.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", search);
		model.addAttribute("list", evaluationService.list(search));
		return "home";
	}
	
	// '��õ'�� 1���� ��Ű��
	@RequestMapping(value="like.le", method=RequestMethod.GET)
	public String like(int evaluationID, Model model) throws Exception {
		model.addAttribute("result", evaluationService.like(evaluationID));
		return "lectureevaluation/evaluationLikeAction";
	}
	
	// ������ ���� ȭ�� �� ó��
	@RequestMapping(value="update.le",method=RequestMethod.GET)
	public String update(int evaluationID, Model model) throws Exception{
		LectureEvaluationDTO content = evaluationService.view(evaluationID);
		model.addAttribute("evalUpdateContent", content);
		return "lectureevaluation/evaluationUpdate";
	}
	
	@RequestMapping(value="updateAction.le",method=RequestMethod.POST)
	public String updateAction(@ModelAttribute LectureEvaluationDTO evaluationDTO, Model model) throws Exception{
		int result = evaluationService.update(evaluationDTO);
		model.addAttribute("result", result);
		return "lectureevaluation/evaluationUpdateAction";
	}
	
	// ������ ���� (�����)
	@RequestMapping(value="delete.le",method=RequestMethod.GET)
	public String updateStatus(int evaluationID, Model model) throws Exception{
		model.addAttribute("result", evaluationService.updateStatus(evaluationID));
		return "lectureevaluation/evaluationDeleteAction";
	}
	
	// ������ ���(�����, ���������� ���)
	@RequestMapping(value="evaluationUser.le",method=RequestMethod.GET)
	public String evaluationUser(String userID, Model model) throws Exception{
		model.addAttribute("userEvaluationList", evaluationService.evaluationUser(userID));
		return "lectureevaluation/evaluationUser";
	}

	// ������ ����(������)
	@RequestMapping(value="adminDelete.le",method=RequestMethod.GET)
	public String delete(int evaluationID, Model model) throws Exception{
		model.addAttribute("adminResult", evaluationService.delete(evaluationID));
		return "lectureevaluation/evaluationDeleteAction";
	}
	
	// ������ ��� (������)
	@RequestMapping(value="evaluationAdmin.le", method=RequestMethod.GET)
	public String evaluationAdmin(Model model, 
			@RequestParam(required=false, defaultValue="1")int page,
			@RequestParam(required=false, defaultValue="1")int range,
			@RequestParam(required=false)String searchType,
			@RequestParam(required=false)String keyword) throws Exception{
		
		// �˻�
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		// ��ü ������ �� ����
		int listCnt = evaluationService.count(search);
	
		search.pageInfo(page, range, listCnt);
		
		System.out.println("�˻����: "+evaluationService.list(search));
		
		model.addAttribute("pagination", search);
		model.addAttribute("evaluationList", evaluationService.list(search));
		return "admin/evaluationAdmin";
	}
	
	// ������ ���뺸�� (������)
	@RequestMapping(value="evaluationView.le",method=RequestMethod.GET)
	public String evaluationView(int evaluationID, Model model) throws Exception{
		LectureEvaluationDTO evaluationDTO = evaluationService.adminView(evaluationID);
		model.addAttribute("adminEvaluationContent", evaluationDTO);
		return "admin/evaluationView";
	}

}