<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<title>Forgot ID</title>
</head>
<body class="bg-gradient-warning">
<section class="container mt-5">
	<!-- Outer Row -->
    <div class="row justify-content-center">
    <div class="col-xl-10 col-lg-12 col-md-9">
    <div class="card o-hidden border-0 shadow-lg my-5" style="width:100%;">
    	<div class="card-body p-0">
		<!-- Nested Row within Card Body -->
			<div class="row"  style="height:360px;">
				<!-- 이미지 출력  -->
				<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
				<!-- 아이디 찾기 관련 영역 -->
				<div class="col-lg-6 p-5">
				<div class="p-5">
				<div class="text-center">
					<h3 class="h4 text-gray-900 mb-2">아이디 확인</h3>
				</div>
				<!-- 가입된 정보가 존재하고 입력한 정보(이름,이메일)가 일치하는 경우 -->
				<c:if test="${userDTO != null}">
					<div class="text-center">
						<p>귀하의 아이디는 <b>${userDTO.userID}</b> 입니다.</p>
					</div>
                  	<button type="button" class="btn btn-primary btn-user btn-block" onClick="location.href='userLogin.le';">로그인</button>
                </c:if>
                <!-- 가입된 정보가 존재하지 않거나 입력한 정보(이름,이메일)가 일치하지 않을 경우 -->
				<c:if test="${userDTO == null }">
					<script>
						alert("성명과 이메일을 다시 확인해주세요.");
						history.go(-1);
                  	</script>
				</c:if>
				</div>
				</div>
			</div>
		</div>
	</div>
    </div>
    </div>
</section>
  
  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>