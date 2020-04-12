package com.hpro.dao;

import java.util.List;

import com.hpro.commons.Search;
import com.hpro.dto.BoardDTO;
import com.hpro.dto.ReplyDTO;

public interface BoardDAO {
	/* 게시글 처리 */
	
	// 게시글 작성
	public int write(BoardDTO boardDTO) throws Exception;
	
	// 게시글 수 카운트
	public int count(Search search) throws Exception;

	// 게시글 목록(사용자)
	public List<BoardDTO> getBoardList(Search search) throws Exception;
	
	// 게시글 상세내용조회
	public BoardDTO view(int boardID) throws Exception;
	
	// 조회수 증가
	public int hit(int boardID) throws Exception;
	
	// 게시글 수정
	public int update(BoardDTO boardDTO) throws Exception;
	
	// 게시글 삭제
	public int delete(int boardID) throws Exception;
	
	// 게시글 목록(사용자)
	public List<BoardDTO> boardUser(String userID) throws Exception;
	
	/* 댓글 처리 */
	
	// 댓글 목록
	public List<ReplyDTO> replyList(int boardID) throws Exception;
	
	// 댓글 입력
	public int insertReply(ReplyDTO replyDTO) throws Exception;
	
	// 댓글 수정
	public int updateReply(ReplyDTO replyDTO) throws Exception;
	
	// 댓글 삭제
	public int deleteReply(int replyID) throws Exception;
}