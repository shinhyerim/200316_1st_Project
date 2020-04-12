package com.hpro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hpro.dto.ReplyDTO;
import com.hpro.service.BoardService;

@RestController
public class RestBoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService boardService;

	// ´ñ±Û ¸ñ·Ï °¡Á®¿À±â
	@RequestMapping(value="replyList.le", method = RequestMethod.POST)
	public List<ReplyDTO> getReplyList(@RequestParam("boardID") int boardID) throws Exception {
		System.out.println(boardID);
		return boardService.replyList(boardID);
	}
	
	// ´ñ±Û ÀÛ¼º
	@RequestMapping(value="insertReply.le", method=RequestMethod.POST)
	public Map<String,Object> insertReply(@RequestBody ReplyDTO replyDTO){
		Map<String,Object> result = new HashMap<>();
		try {
			boardService.insertReply(replyDTO);
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	// ´ñ±Û ¼öÁ¤
	@RequestMapping(value="updateReply.le", method=RequestMethod.POST)
	public Map<String,Object>  updateReply(@RequestBody ReplyDTO replyDTO) throws Exception {
		Map<String,Object> result = new HashMap<>();
		try {
			boardService.updateReply(replyDTO);
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	// ´ñ±Û »èÁ¦
	@RequestMapping(value="deleteReply.le", method=RequestMethod.POST)
	public Map<String,Object> deleteReply(@RequestParam("replyID")int replyID) throws Exception{
		Map<String,Object> result = new HashMap<>();
		try {
			boardService.deleteReply(replyID);
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
}
