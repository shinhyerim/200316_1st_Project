<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/custom.css">

<title>Admin Main Page</title>
</head>
<body>
<%@include file ="../common/header.jsp" %>
	
<section class="page-section" id="services">
	<div class="container mt-5 mb-5">
		<h4 class="text-center mt-0">ADMIN PAGE</h4>
		<hr class="divider my-4" />
		<div class="row">
			<div class="col-lg-3 col-md-6 text-center">
				<div class="mt-5 mb-5">
					<i class="fa fa-address-book fa-5x mb-4"></i> 
					<h5 class="h4 mb-2"><a href="userAdmin.le" style="text-decoration:none;">회원관리</a></h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="mt-5 mb-5">
					<i class="fa fa-chalkboard-teacher fa-5x mb-4"></i>
					<h5 class="h4 mb-2"><a href="evaluationAdmin.le" style="text-decoration:none;">강의평가내역 관리</a></h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="mt-5 mb-5">
					<i class="fas fa-envelope-open-text fa-5x mb-4"></i>
					<h5 class="h4 mb-2"><a href="reportAdmin.le" style="text-decoration:none;">신고내역 관리</a></h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="mt-5 mb-5">
					<i class="fas fa-clipboard-check fa-5x mb-4"></i>
					<h5 class="h4 mb-2"><a href="boardAdmin.le" style="text-decoration:none;">자유게시판 관리</a></h5>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file ="../common/footer.jsp" %>
</body>
</html>