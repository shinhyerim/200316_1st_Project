<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<script src="resources/js/evaluationAdmin.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Admin - Lecture Evaluation List</title>
</head>
<body>
<%@include file ="../common/header.jsp" %>
	
<section class="container">
	<!-- 검색창 -->
	<div class="form-inline mt-3">
		<select class="form-control mx-1 mt-2" name="searchType" id="searchType">
			<option value=""<c:out value="${pagination.searchType == null ? 'selected' : '' }"/>>전체</option>
			<option value="title"<c:out value="${pagination.searchType eq 'title' ? 'selected' : '' }"/>>제목</option>
			<option value="content"<c:out value="${pagination.searchType eq 'content' ? 'selected' : '' }"/>>내용</option>
			<option value="reg_id"<c:out value="${pagination.searchType eq 'reg_id' ? 'selected' : '' }"/>>작성자</option>
			<option value="lectureName"<c:out value="${pagination.searchType eq 'lectureName' ? 'selected' : '' }"/>>교과목명</option>
		</select>
		<input type="text" class="form-control mx-1 mt-2" name="keyword" id="keyword" placeholder="내용을 입력하세요." value="${pagination.keyword}">
		<button class="btn btn-warning  mx-1 mt-2" name="btnSearch" id="btnSearch">검색</button>
		<a class="btn btn-primary mx-1 mt-2" href="evaluationWrite.le">등록하기</a>
	</div>
	<!-- 강의평가 목록 -->
	<div class="text-center mt-5 mb-3">
		<h4>강의평가 목록</h4>
	</div>
	<div class="form-group mt-4">
		<div class="row">
			<!-- 등록된 강의평가가 존재하지 않는 경우, 아래 문구 출력  -->
			<c:if test="${evaluationList == null}">
				<p> 등록된 강의평가 내역이 없습니다.</p>
			</c:if>
			<!-- 등록된 강의평가가 존재하는 경우, table형식으로 강의평가 목록 출력  -->
			<c:if test="${evaluationList != null}">
				<table class="table" style="text-align:center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align:center;">구분</th>
							<th style="background-color: #eeeeee; text-align:center;">교과목명</th>
							<th style="background-color: #eeeeee; text-align:center;">제목</th>
							<th style="background-color: #eeeeee; text-align:center;">작성자</th>
							<th style="background-color: #eeeeee; text-align:center;">추천수</th>
							<th style="background-color: #eeeeee; text-align:center;">작성일자</th>
							<th style="background-color: #eeeeee; text-align:center;">상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${evaluationList}" var="evaluationList">
							<tr>
								<td>${evaluationList.lectureDivide}</td>
								<td>${evaluationList.lectureName}</td>
								<td><a href="evaluationView.le?evaluationID=${evaluationList.evaluationID}" style="text-decoration:none;">${evaluationList.evaluationTitle}</a></td>
								<td>${evaluationList.userID}</td>
								<td>${evaluationList.likeCount}</td>
								<td>${evaluationList.evaluationRegdate}</td>
								<!-- 강의평가의 기본 상태는 '출력'이며, 사용자가 강의평가를 삭제할 경우 '출력'에서 '삭제'로 변경  -->
								<td>
									<c:if test="${evaluationList.evaluationStatus == 1}">출력</c:if>
									<c:if test="${evaluationList.evaluationStatus == 2}">삭제</c:if>
								</td>
								</tr>
							
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
	<!-- 페이징 처리  -->
	<%@include file ="../common/pagination.jsp" %>

</section>
<%@include file ="../common/footer.jsp" %>
</body>
</html>