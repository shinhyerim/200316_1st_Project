package com.hpro.dao;

import java.util.List;

import com.hpro.commons.Search;
import com.hpro.dto.BoardDTO;
import com.hpro.dto.ReplyDTO;

public interface BoardDAO {
	/* �Խñ� ó�� */
	
	// �Խñ� �ۼ�
	public int write(BoardDTO boardDTO) throws Exception;
	
	// �Խñ� �� ī��Ʈ
	public int count(Search search) throws Exception;

	// �Խñ� ���(�����)
	public List<BoardDTO> getBoardList(Search search) throws Exception;
	
	// �Խñ� �󼼳�����ȸ
	public BoardDTO view(int boardID) throws Exception;
	
	// ��ȸ�� ����
	public int hit(int boardID) throws Exception;
	
	// �Խñ� ����
	public int update(BoardDTO boardDTO) throws Exception;
	
	// �Խñ� ����
	public int delete(int boardID) throws Exception;
	
	// �Խñ� ���(�����)
	public List<BoardDTO> boardUser(String userID) throws Exception;
	
	/* ��� ó�� */
	
	// ��� ���
	public List<ReplyDTO> replyList(int boardID) throws Exception;
	
	// ��� �Է�
	public int insertReply(ReplyDTO replyDTO) throws Exception;
	
	// ��� ����
	public int updateReply(ReplyDTO replyDTO) throws Exception;
	
	// ��� ����
	public int deleteReply(int replyID) throws Exception;
}