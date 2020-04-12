<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<script src="resources/js/reportAdmin.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Admin - Report List</title>
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
		</select>
		<input type="text" class="form-control mx-1 mt-2" name="keyword" id="keyword" placeholder="내용을 입력하세요." value="${pagination.keyword}">
		<button class="btn btn-primary mx-1 mt-2" name="btnSearch" id="btnSearch">검색</button>
	</div>
	<!-- 게시글 목록  -->
	<div class="form-group mt-4">
		<div class="row">
			<table class="table" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">번호</th>
						<th style="background-color: #eeeeee; text-align:center;">구분</th>
						<th style="background-color: #eeeeee; text-align:center;">제목</th>
						<th style="background-color: #eeeeee; text-align:center;">작성자</th>
						<th style="background-color: #eeeeee; text-align:center;">작성일자</th>
						<th style="background-color: #eeeeee; text-align:center;">비고</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${adminReportList == null}">
						<p>접수된 신고내역이 없습니다.</p>
					</c:if>
					<c:if test="${adminReportList != null}">
						<c:forEach items="${adminReportList}" var="adminReportList">
							<tr>
								<td>${adminReportList.rownum}</td>
								<td>${adminReportList.reportDivide}</td>
								<td><a href="reportView.le?reportID=${adminReportList.reportID}" style="text-decoration:none;">${adminReportList.reportTitle}</a></td>
								<td>${adminReportList.userID}</td>
								<td>${adminReportList.reportRegdate}</td>
								<c:if test="${adminReportList.reportStatus == 0}">
									<td><b style="color:red;">접수 완료</b></td>
								</c:if>
								<c:if test="${adminReportList.reportStatus == 1}">
									<td><b style="color:red;">사용자 신고 접수</b></td>
								</c:if>
								<c:if test="${adminReportList.reportStatus == 2}">
									<td><b style="color:red;">처리 완료</b></td>
								</c:if>
								<c:if test="${adminReportList.reportStatus == 3}">
									<td><b style="color:red;">사용자에 의한 삭제</b></td>
								</c:if>									
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