<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>

<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/custom.css">

<title>Board View - User</title>
</head>
<body>
<%@include file ="../common/header.jsp" %>
	
<section class="container mb-5">	
	<!-- 게시글 목록  -->
	<div class="form-group mt-5 mb-5">
		<div class="text-center mt-5 mb-3">
			<h5>${sessionScope.userInfo.userID} 님의 글 작성내역</h5>
		</div>
		<div class="row">
			<table class="table" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">번호</th>
						<th style="background-color: #eeeeee; text-align:center;">제목</th>
						<th style="background-color: #eeeeee; text-align:center;">조회수</th>
						<th style="background-color: #eeeeee; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list == null}">
						<p>작성된 글이 없습니다. 자유게시판에 글을 등록해주세요.</p>
					</c:if>
					<c:if test="${list != null}">
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.rownum}</td>
								<td><a href="boardView.le?boardID=${list.boardID}" style="text-decoration:none;">${list.boardTitle}</a></td>
								<td>${list.hit}</td>
								<td><fmt:formatDate value="${list.boardRegdate}" type="date" dateStyle="full" /></td>
							</tr> 
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</section>

<%@include file ="../common/footer.jsp" %>
</body>
</html>