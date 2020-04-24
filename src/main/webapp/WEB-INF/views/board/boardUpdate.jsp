<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Board Update</title>
</head>
<body>
<%@include file ="../common/header.jsp" %>
	
<section class="container">
	<form method="post" action="boardUpdateAction.le" class="form-group mt-5">
		<!-- 해당 게시글 번호, 페이지 및 검색 정보를 hidden으로 전달 -->
		<input type="hidden" id="boardID" name="boardID" value="${boardDTO.boardID}">
		<input type="hidden" id="page" name="page" value="${search.page}">
		<input type="hidden" id="range" name="range" value="${search.range}">
		<input type="hidden" id="searchType" name="searchType" value="${search.searchType}">
		<input type="hidden" id="keyword" name="keyword" value="${search.keyword}">
		
		<div class="text-center mt-4">
			<h4>글 작성 양식</h4>
		</div>
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<tbody>
					<tr>
						<td>작성자</td>
						<td>${boardDTO.userID}</td>
					</tr>
					<tr>
						<td>글 제목</td>
						<td><input type="text" class="form-control" name="boardTitle" maxlength="50" value="${boardDTO.boardTitle}" required></td>
					</tr>
					<tr>
						<td>글 내용</td>
						<td><textarea class="form-control" name="boardContent" maxlength="2048" required>${boardDTO.boardContent}</textarea></td>
					</tr>
				</tbody>
		</table>
		<button type="submit" class="btn btn-primary pull-right">수정</button>
		<a type="button" class="btn btn-danger pull-rigt" style="text-decoraion:none;" href="boardList.le?boardID=${list.boardID}&page=${search.page}&range=${search.range}&searchType=${search.searchType}&keyword=${search.keyword}">취소</a>
	</form>
</section>

<%@include file ="../common/footer.jsp" %>

</body>
</html>