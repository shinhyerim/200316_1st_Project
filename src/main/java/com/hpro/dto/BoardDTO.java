package com.hpro.dto;

import java.sql.Timestamp;

public class BoardDTO {
	private int boardID;
	private String userID;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardRegdate;
	private int hit;
	private int rownum;
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
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
}
