package com.hpro.controller;

import java.util.HashMap;
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

/* @RestController
 - 스프링 4.x 버전부터 지원
 - 컨트롤러 클래스에 @RestController어노테이션을 붙이면 메소드에 @ResponseBody어노테이션을 붙이지 않아도 문자열과 JSON 전송 가능
 - 문자열, 객체 등을 리턴해주는 메소드를 가지고 있음 
*/

@RestController
public class ReplyController {

	// 로그
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService boardService;
	
	// 댓글 작성
	@RequestMapping(value="insertReply.le", method=RequestMethod.POST)
	public Map<String, Object> insertReply(@RequestBody ReplyDTO replyDTO) throws Exception{
		Map<String, Object> result = new HashMap<>();
		try {
			boardService.insertReply(replyDTO);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	// 댓글 삭제
	@RequestMapping(value="deleteReply.le", method=RequestMethod.POST)
	public int deleteReply(@RequestParam("replyID")int replyID) throws Exception{
		int result = boardService.deleteReply(replyID);
		return result;
	}
}
