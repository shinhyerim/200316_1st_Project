<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Board List</title>
<script>
//검색
$(document).on('click', '#btnSearch', function(e){
	e.preventDefault();
	var url = "boardList.le";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
	
	location.href = url;
});	
// ------------------  Pagination 처리 -------------------------
// 이전 버튼 이벤트
function fn_prev(page, range, rangeSize, searchType, keyword){
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;	
	var url = "boardList.le";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword" + keyword;
		
	location.href = url;
}
	
// 페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword){
	var url = "boardList.le";
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
	var url = "boardList.le";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword" + keyword;
		
	location.href = url;
}
</script>
</head>
<body>
<%@include file ="../common/header.jsp" %>
	
<section class="container">
	<c:if test="${sessionScope.userInfo == null}">
		<div class="text-left mt-3 pl-1">
			<small style="color:red;">모든 기능은 로그인 후 가능합니다.</small>
		</div>
	</c:if>
	<!-- 검색창 -->
	<div class="form-inline mt-3">
		<select class="form-control mx-1 mt-2" name="searchType" id="searchType">
			<option value=""<c:out value="${pagination.searchType == null ? 'selected' : '' }"/>>전체</option>
			<option value="title"<c:out value="${pagination.searchType eq 'title' ? 'selected' : '' }"/>>제목</option>
			<option value="content"<c:out value="${pagination.searchType eq 'content' ? 'selected' : '' }"/>>내용</option>
			<option value="reg_id"<c:out value="${pagination.searchType eq 'reg_id' ? 'selected' : '' }"/>>작성자</option>
		</select>
		<input type="text" class="form-control mx-1 mt-2" name="keyword" id="keyword" placeholder="내용을 입력하세요." value="${pagination.keyword}">
		<button class="btn btn-primary mx-1 mt-2" name="btnSearch" id="btnSearch">검색</button>
		<c:if test="${sessionScope.userInfo != null }">
			<a class="btn btn-primary mx-1 mt-2" href="boardWrite.le">글작성</a>
		</c:if>	
	</div>
	<!-- 게시글 목록  -->
	<div class="form-group mt-4">
		<div class="row">
			<table class="table table-bordered" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">번호</th>
						<th style="background-color: #eeeeee; text-align:center;">제목</th>
						<th style="background-color: #eeeeee; text-align:center;">작성자</th>
						<th style="background-color: #eeeeee; text-align:center;">조회수</th>
						<th style="background-color: #eeeeee; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list == null}">
						<p> 작성된 글이 없습니다.</p>
					</c:if>
					<c:if test="${list != null}">
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.rownum}</td>
								<td><a href="boardView.le?boardID=${list.boardID}&page=${search.page}&range=${search.range}&searchType=${search.searchType}&keyword=${search.keyword}" style="text-decoration:none;">${list.boardTitle}</a></td>
								<td>${list.userID}</td>
								<td>${list.hit}</td>
								<td><fmt:formatDate value="${list.boardRegdate}" type="date" dateStyle="full" /></td>
							</tr> 
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Pagination -->
	<%@include file="../common/pagination.jsp" %>
</section>
<%@include file ="../common/footer.jsp" %>
</body>
</html>