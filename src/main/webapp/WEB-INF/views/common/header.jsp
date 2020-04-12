<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
<title>Common - Header</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">H's Portfolio</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="evaluationList.le">강의평가</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="boardList.le">자유게시판</a>
				</li>
			<c:if test="${sessionScope.userInfo == null }">
				<li class="nav-item">
					<a class="nav-link" href="userLogin.le">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="userJoin.le">회원가입</a>
				</li>
			</c:if>
			<c:if test="${sessionScope.userInfo != null }">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">회원관리</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
					<c:if test="${sessionScope.userInfo.userID == 'admin'}">
						<a class="nav-link" href="adminMain.le">마이페이지</a>
					</c:if>
					<c:if test="${sessionScope.userInfo.userID != 'admin'}">
						<a class="nav-link" href="userMain.le">마이페이지</a>
					</c:if>
						<a class="nav-link" href="userLogout.le">로그아웃</a>
					</div>
				</li>
			</c:if>
			</ul>
			<c:if test="${sessionScope.userInfo != null}">
				<li class="nav-item dropdown" style="text-align:right; list-style:none;">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">${sessionScope.userInfo.userID}님</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<c:if test="${sessionScope.userInfo.userID == 'admin'}">
							<a class="dropdown-item" href="adminMain.le">마이페이지</a>
						</c:if>
						<c:if test="${sessionScope.userInfo.userID != 'admin'}">
							<a class="dropdown-item" href="userMain.le">마이페이지</a>
						</c:if>
						<a class="dropdown-item" href="userLogout.le">로그아웃</a>
					</div>
				</li>
			</c:if>
		</div>
	</nav>
</body>
</html>