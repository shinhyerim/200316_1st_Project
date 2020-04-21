package com.hpro.service;

import java.util.List;


import com.hpro.commons.Search;
import com.hpro.dto.BoardDTO;
import com.hpro.dto.ReplyDTO;
public interface BoardService {
	
	// �Խñ� ó��
	
	public int write(BoardDTO boardDTO) throws Exception;
	
	public int count(Search search) throws Exception;

	public List<BoardDTO> getBoardList(Search search) throws Exception;
	
	public BoardDTO view(int boardID) throws Exception;
	
	public int hit(int boardID) throws Exception;
	
	public int update(BoardDTO boardDTO) throws Exception;
	
	public int delete(int boardID) throws Exception;

	public List<BoardDTO> boardUser(String userID) throws Exception;
	
	// ��� ó��
	public List<ReplyDTO> replyList(int boardID) throws Exception;
	
	public int insertReply(ReplyDTO replyDTO) throws Exception;
	
	public int updateReply(ReplyDTO replyDTO) throws Exception;
	
	public int deleteReply(int replyID) throws Exception;

}
