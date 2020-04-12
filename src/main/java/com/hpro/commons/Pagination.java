package com.hpro.commons;

public class Pagination {
	
	private int listSize = 10; // 목록 개수
	private int rangeSize = 10; // 페이지 범위
	private int page;
	private int range;
	private int listCnt;
	private double pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public double getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(double pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void pageInfo(int page, int range, int listCnt) { // page=현재페이지정보, range=현재페이지범위정보, listCnt=게시물의 총 개수
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		// 전체 페이지 수 
		this.pageCnt = Math.ceil((double)listCnt/listSize);
		
		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;
		
		// 끝 페이지 , 다음 버튼의 활성화 여부 판단을 위해
		this.endPage = range * rangeSize;
		
		// 게시판 시작번호, mySQL을 이용해 원하는 목록을 가져오기 위해
		this.startList = (page - 1) * listSize;
		
		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;
		
		// 다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if(this.endPage > this.pageCnt) {
			this.endPage = (int) this.pageCnt;
			this.next = false;
		}
	}
	

}
