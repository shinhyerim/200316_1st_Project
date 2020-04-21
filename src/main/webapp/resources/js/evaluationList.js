/**
 * 
 */

// 검색창
$(document).on('click', '#btnSearch', function(e){
	e.preventDefault();
	var url = "evaluationList.le";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
	
	location.href = url;
});

// ------------------  Pagination 처리 -------------------------

// 이전 버튼 이벤트
function fn_prev(page, range, rangeSize, searchType, keyword){
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;	
	var url = "evaluationList.le";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword" + keyword;
		
	location.href = url;
}
// 페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword){
	var url = "evaluationList.le";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword" + keyword;
		
	location.href = url;
}
// 다음 버튼 이벤트
function fn_next(page, range, rangeSize, searchType, keyword){
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	var url = "evaluationList.le";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword" + keyword;
		
	location.href = url;
}