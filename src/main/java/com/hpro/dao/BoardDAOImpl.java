package com.hpro.dao;

import java.util.List;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hpro.commons.Search;
import com.hpro.dto.BoardDTO;
import com.hpro.dto.ReplyDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	SqlSessionTemplate sst;

	// 게시글 처리
	
	// 게시글 작성
	@Override
	public int write(BoardDTO boardDTO) throws Exception {
		return sst.insert("boardMapper.write", boardDTO);
	}
	
	// 게시글 상세내용 조회
	@Override
	public BoardDTO view(int boardID) throws Exception {
		return sst.selectOne("boardMapper.view", boardID);
	}

	
	// 조회 수 증가
	@Override
	public int hit(int boardID) throws Exception {
		return sst.update("boardMapper.hit", boardID);
		
	}

	// 게시글 수정
	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return sst.update("boardMapper.update", boardDTO);
	}

	
	// 게시글 삭제
	@Override
	public int delete(int boardID) throws Exception {
		return sst.delete("boardMapper.delete", boardID);
	}

	// 게시글 목록(사용자)
	@Override
	public List<BoardDTO> boardUser(String userID) throws Exception {
		return sst.selectList("boardMapper.boardUser", userID);
	}

	// 게시글 수 카운트
	@Override
	public int count(Search search) throws Exception {
		return sst.selectOne("boardMapper.count", search);
	}

	// 게시글 목록(관리자)
	@Override
	public List<BoardDTO> getBoardList(Search search) throws Exception {
		return sst.selectList("boardMapper.list", search);
	}
	
	// 댓글 처리
	
	// 댓글 목록
	@Override
	public List<ReplyDTO> replyList(int boardID) throws Exception {
		return sst.selectList("replyMapper.replyList", boardID);
	}

	// 댓글 삽입
	@Override
	public int insertReply(ReplyDTO replyDTO) throws Exception {
		return sst.insert("replyMapper.insertReply", replyDTO);
	}

	// 댓글 수정
	@Override
	public int updateReply(ReplyDTO replyDTO) throws Exception {
		return sst.update("replyMapper.updateReply", replyDTO);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int replyID) throws Exception {
		return sst.delete("replyMapper.deleteReply", replyID);
	}

}