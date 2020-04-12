<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>User Main Page</title>
</head>
<body>
	<%@include file ="../common/header.jsp" %>
	
	<section class="page-section" id="services">
		<div class="container mt-5 mb-5">
			<h4 class="text-center mt-0">MY PAGE</h4>
			<hr class="divider my-4" />
			<div class="row">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5 mb-5">
						<i class="fa fa-address-card fa-4x mb-4"></i> 
						<h5 class="h4 mb-2"><a href="userInfo.le" style="text-decoration:none;">회원정보관리</a></h5>
						<p class="text-muted mb-0">회원정보수정 및 탈퇴</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5 mb-5">
						<i class="fa fa-edit fa-4x mb-4"></i>
						<h5 class="h4 mb-2"><a href="evaluationUser.le?userID=${sessionScope.userInfo.userID}" style="text-decoration:none;">강의평가내역 관리</a></h5>
						<p class="text-muted mb-0">강의평가내역 열람</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5 mb-5">
						<i class="fas fa-poo fa-4x mb-4"></i>
						<h5 class="h4 mb-2"><a href="reportUser.le?userID=${sessionScope.userInfo.userID}" style="text-decoration:none;">신고내역 관리</a></h5>
						<p class="text-muted mb-0">신고내역 열람</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5 mb-5">
						<i class="fas fa-pen-nib fa-4x mb-4"></i>
						<h5 class="h4 mb-2"><a href="boardUser.le?userID=${sessionScope.userInfo.userID}" style="text-decoration:none;">게시글 내역 관리</a></h5>
						<p class="text-muted mb-0">게시글 열람 또는 수정 및 삭제</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file ="../common/footer.jsp" %>
</body>
</html>