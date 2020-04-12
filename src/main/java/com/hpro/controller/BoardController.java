package com.hpro.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hpro.commons.Search;
import com.hpro.dto.BoardDTO;
import com.hpro.dto.ReplyDTO;
import com.hpro.service.BoardService;

@Controller
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	// 게시글 작성 및 처리
	@RequestMapping(value="boardWrite.le")
	public String boardWirte() {
		return "board/boardWrite";
	}
	
	@RequestMapping(value="boardWriteAction.le", method=RequestMethod.POST)
	public String write(@ModelAttribute BoardDTO boardDTO, Model model) throws Exception {
		int result = boardService.write(boardDTO);
		model.addAttribute("result", result);
		return "board/boardWriteAction";
	}
	
	// 게시글 목록(사용자)
	@RequestMapping(value="boardList.le", method=RequestMethod.GET)
	public String list(Model model, 
			@RequestParam(required=false, defaultValue="1")int page,
			@RequestParam(required=false, defaultValue="1")int range,
			@RequestParam(required=false)String searchType,
			@RequestParam(required=false)String keyword,
			@ModelAttribute("search")Search search) throws Exception{
		
		// 검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		// 전체 게시글 개수
		int listCnt = boardService.count(search);
		
		// 페이징처리
		search.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", search);
		model.addAttribute("list", boardService.getBoardList(search));
		return "board/boardList";
	}

	// 게시글 상세내용 조회
	@RequestMapping(value="boardView.le", method=RequestMethod.GET)
	public String view(int boardID, Model model, @ModelAttribute("search")Search search) throws Exception {
		BoardDTO boardDTO = boardService.view(boardID);
		
		boardService.hit(boardID);
		
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("search", search);
		
		model.addAttribute("replyDTO", new ReplyDTO());
		
		return "board/boardView";
	}
	
	// 게시글 수정 및 처리
	@RequestMapping(value="boardUpdate.le", method=RequestMethod.GET)
	public String boardUpdate(int boardID, Model model,@ModelAttribute("search")Search search) throws Exception{
		BoardDTO boardDTO = boardService.view(boardID);
		boardService.hit(boardID);
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("search", search);
		return "board/boardUpdate";
	}
	
	@RequestMapping(value="boardUpdateAction.le", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardDTO boardDTO, Model model, @ModelAttribute("search")Search search) throws Exception{
		int result = boardService.update(boardDTO);
		
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("result", result);
		model.addAttribute("search", search);
		return "board/boardUpdateAction";
	}
	
	// 게시글 삭제
	@RequestMapping(value="boardDelete.le", method=RequestMethod.GET)
	public String delete(int boardID, Model model, @ModelAttribute("search")Search search) throws Exception{
		int result = boardService.delete(boardID);
		model.addAttribute("result", result);
		model.addAttribute("search",search);
		return "board/boardDelete";
	}
	
	// 게시판 목록(사용자 마이페이지)
	@RequestMapping(value="boardUser.le", method=RequestMethod.GET)
	public String boardUser(String userID, Model model) throws Exception{
		model.addAttribute("list", boardService.boardUser(userID));
		return "board/boardUser";
	}
	
	// 게시판 목록(관리자)
	@RequestMapping(value="boardAdmin.le", method=RequestMethod.GET)
	public String boardAdmin(Model model, 
			@RequestParam(required=false, defaultValue="1")int page,
			@RequestParam(required=false, defaultValue="1")int range,
			@RequestParam(required=false, defaultValue="title")String searchType,
			@RequestParam(required=false)String keyword,
			@ModelAttribute("search")Search search) throws Exception{
		
		// 검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		// 전체 게시글 개수
		int listCnt = boardService.count(search);
		
		// 페이징처리
		search.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", search);
		model.addAttribute("list", boardService.getBoardList(search));
		return "admin/boardAdmin";
	}
}
