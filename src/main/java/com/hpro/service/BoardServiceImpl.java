package com.hpro.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hpro.commons.Search;
import com.hpro.dao.BoardDAO;
import com.hpro.dto.BoardDTO;
import com.hpro.dto.ReplyDTO;
@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boardDAO;
	
	// 게시글 처리
	
	@Override
	public int write(BoardDTO boardDTO) throws Exception {
		return boardDAO.write(boardDTO);
	}
	
	@Override
	public int count(Search search) throws Exception {
		return boardDAO.count(search);
	}

	@Override
	public BoardDTO view(int boardID) throws Exception {
		return boardDAO.view(boardID);
	}

	@Override
	public int hit(int boardID) throws Exception {
		return boardDAO.hit(boardID);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return boardDAO.update(boardDTO);
	}

	@Override
	public int delete(int boardID) throws Exception {
		return boardDAO.delete(boardID);
	}

	@Override
	public List<BoardDTO> getBoardList(Search search) throws Exception {
		return boardDAO.getBoardList(search);
	}

	@Override
	public List<BoardDTO> boardUser(String userID) throws Exception {
		return boardDAO.boardUser(userID);
	}
	
	// 댓글 처리
	@Override
	public List<ReplyDTO> replyList(int boardID) throws Exception {
		return boardDAO.replyList(boardID);
	}

	@Override
	public int insertReply(ReplyDTO replyDTO) throws Exception {
		return boardDAO.insertReply(replyDTO);
	}

	@Override
	public int updateReply(ReplyDTO replyDTO) throws Exception {
		return boardDAO.updateReply(replyDTO);
	}

	@Override
	public int deleteReply(int replyID) throws Exception {
		return boardDAO.deleteReply(replyID);
	}


}
