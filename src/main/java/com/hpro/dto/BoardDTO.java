package com.hpro.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	private int boardID;
	private String userID;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardRegdate;
	private int hit;
	
	private int rownum; // 게시판 글목록 처리 시 필요
	private int replyCnt; // 댓글 개수
	
	private MultipartFile boardFile; // 파일 업로드 처리
	
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Timestamp getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(Timestamp boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public MultipartFile getBoardFile() {
		return boardFile;
	}
	public void setBoardFile(MultipartFile boardFile) {
		this.boardFile = boardFile;
	}

}