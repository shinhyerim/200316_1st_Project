package com.hpro.commons;

public class Pagination {
	
	private int listSize = 10; 	// 목록 개수
	private int rangeSize = 10; // 페이지 범위
	private int page; 			// 현재 목록의 페이지 번호
	private int range; 			// 페이지 범위 시작 번호
	private int listCnt; 		// 전체 게시물 개수
	private double pageCnt; 	// 전페 페이지 범위 개수
	private int startList; 		// 게시판 시작 번호
	private int startPage;  	// 각 페이지 범위 시작 번호
	private int endPage; 		// 각 페이지 범위 끝 번호
	private boolean prev; 		// 이전 페이지 여부
	private boolean next; 		// 다음  페이지 여부
	
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

	public void pageInfo(int page, int range, int listCnt) { // page=현재 페이지 정보, range=현재 페이지 범위 정보, listCnt=게시물의 총 개수
		this.page = page; 
		this.range = range;
		this.listCnt = listCnt;
		
		// 전체 페이지 수 
		// int를 사용할 경우, 값이 정수로만 반환되어 반올림 처리 X → 마지막 페이지가 누락되므로 double 사용
		this.pageCnt = Math.ceil((double)listCnt/listSize); 
		
		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;
		
		// 끝 페이지 , 다음 버튼의 활성화 여부 판단을 위해
		this.endPage = range * rangeSize;
		
		// 게시판 시작번호, mySQL을 이용해 원하는 목록을 가져오기 위해
		this.startList = (page - 1) * listSize;
		
		// 이전 페이지 여부
		// 페이지의 범위가 1이면 false이므로 이전 페이지 여부는 false
		this.prev = range == 1 ? false : true;
		
		// 다음 페이지 여부
		// 끝 페이지가 전체 페이지 수보다 크면 false이므로 다음 페이지 여부는 false
		this.next = endPage > pageCnt ? false : true;
		
		// 끝 페이지가 전체 페이지 수보다 큰 경우: endPage에 pageCnt값을 할당하고, 다음 페이지 여부는 false
		if(this.endPage > this.pageCnt) {
			this.endPage = (int) this.pageCnt;
			this.next = false;
		}
	}
	

}
