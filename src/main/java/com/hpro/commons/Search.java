package com.hpro.commons;

// Pagianation 클래스를 상속받아서 기존 Pagination의 특성을 그대로 사용할 수 있도록 함
// -> Pagination 객체를 생성하기 보다는 Search 객체를 생성하여 Pagination을 사용함

public class Search extends Pagination{
	private String searchType;
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "Search [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
