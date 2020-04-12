package com.hpro.dto;

import java.sql.Timestamp;

public class ReplyDTO {
	private int replyID;
	private int boardID;
	private String replyContext;
	private String userID;
	private Timestamp replyRegdate;
	
	public int getReplyID() {
		return replyID;
	}
	public void setReplyID(int replyID) {
		this.replyID = replyID;
	}
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getReplyContext() {
		return replyContext;
	}
	public void setReplyContext(String replyContext) {
		this.replyContext = replyContext;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Timestamp getReplyRegdate() {
		return replyRegdate;
	}
	public void setReplyRegdate(Timestamp replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	
	
}
