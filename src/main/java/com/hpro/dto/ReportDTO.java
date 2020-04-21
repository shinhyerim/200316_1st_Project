package com.hpro.dto;

import java.sql.Timestamp;

public class ReportDTO {
	private Integer reportID;
	private String userID;
	private String reportDivide;
	private String reportTitle;
	private String reportContent;
	private Timestamp reportRegdate;
	private int reportStatus;
	private int rownum;
	
	public Integer getReportID() {
		return reportID;
	}
	public void setReportID(Integer reportID) {
		this.reportID = reportID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getReportDivide() {
		return reportDivide;
	}
	public void setReportDivide(String reportDivide) {
		this.reportDivide = reportDivide;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Timestamp getReportRegdate() {
		return reportRegdate;
	}
	public void setReportRegdate(Timestamp reportRegdate) {
		this.reportRegdate = reportRegdate;
	}
	
	public int getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(int reportStatus) {
		this.reportStatus = reportStatus;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
}
