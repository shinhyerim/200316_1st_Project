<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Board Write</title>
</head>
<body>
<%@include file ="../common/header.jsp" %>
	
<section class="container">
	<form method="post" action="boardWriteAction.le" class="form-group mt-5">
		<input type="hidden" name="userID" id="userID" value="${sessionScope.userInfo.userID}">
		<div class="text-center mb-4">
			<h4>글 작성 양식</h4>
		</div>
		<table class="table table-borded" style="text-align:center; border:1px solid #dddddd">
			<tbody>
				<tr>
					<td>작성자</td>
					<td>${sessionScope.userInfo.userID}</td>
				</tr>
				<tr>
					<td>글 제목</td>
					<td><input type="text" class="form-control" placeholder="제목을 작성해주세요" name="boardTitle" maxlength="50" required></td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td><textarea class="form-control" placeholder="내용을 작성해주세요" name="boardContent" maxlength="2048" style="height:350px;" required></textarea></td>
				</tr>
			</tbody>
		</table>
		<button type="submit" class="btn btn-primary pull-right">글쓰기</button>
	</form>
</section>

<%@include file ="../common/footer.jsp" %>
</body>
</html>