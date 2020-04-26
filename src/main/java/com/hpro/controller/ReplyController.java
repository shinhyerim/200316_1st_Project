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
 - ������ 4.x �������� ����
 - ��Ʈ�ѷ� Ŭ������ @RestController������̼��� ���̸� �޼ҵ忡 @ResponseBody������̼��� ������ �ʾƵ� ���ڿ��� JSON ���� ����
 - ���ڿ�, ��ü ���� �������ִ� �޼ҵ带 ������ ���� 
*/

@RestController
public class ReplyController {

	// �α�
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService boardService;
	
	// ��� �ۼ�
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
	
	// ��� ����
	@RequestMapping(value="deleteReply.le", method=RequestMethod.POST)
	public int deleteReply(@RequestParam("replyID")int replyID) throws Exception{
		int result = boardService.deleteReply(replyID);
		return result;
	}
}
