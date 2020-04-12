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

	// �Խñ� ó��
	
	// �Խñ� �ۼ�
	@Override
	public int write(BoardDTO boardDTO) throws Exception {
		return sst.insert("boardMapper.write", boardDTO);
	}
	
	// �Խñ� �󼼳��� ��ȸ
	@Override
	public BoardDTO view(int boardID) throws Exception {
		return sst.selectOne("boardMapper.view", boardID);
	}

	
	// ��ȸ �� ����
	@Override
	public int hit(int boardID) throws Exception {
		return sst.update("boardMapper.hit", boardID);
		
	}

	// �Խñ� ����
	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return sst.update("boardMapper.update", boardDTO);
	}

	
	// �Խñ� ����
	@Override
	public int delete(int boardID) throws Exception {
		return sst.delete("boardMapper.delete", boardID);
	}

	// �Խñ� ���(�����)
	@Override
	public List<BoardDTO> boardUser(String userID) throws Exception {
		return sst.selectList("boardMapper.boardUser", userID);
	}

	// �Խñ� �� ī��Ʈ
	@Override
	public int count(Search search) throws Exception {
		return sst.selectOne("boardMapper.count", search);
	}

	// �Խñ� ���(������)
	@Override
	public List<BoardDTO> getBoardList(Search search) throws Exception {
		return sst.selectList("boardMapper.list", search);
	}
	
	// ��� ó��
	
	// ��� ���
	@Override
	public List<ReplyDTO> replyList(int boardID) throws Exception {
		return sst.selectList("replyMapper.replyList", boardID);
	}

	// ��� ����
	@Override
	public int insertReply(ReplyDTO replyDTO) throws Exception {
		return sst.insert("replyMapper.insertReply", replyDTO);
	}

	// ��� ����
	@Override
	public int updateReply(ReplyDTO replyDTO) throws Exception {
		return sst.update("replyMapper.updateReply", replyDTO);
	}

	// ��� ����
	@Override
	public int deleteReply(int replyID) throws Exception {
		return sst.delete("replyMapper.deleteReply", replyID);
	}

}