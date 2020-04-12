<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<title>Forgot Password</title>
</head>
<body class="bg-gradient-warning">
<section class="container mt-5">
    <!-- Outer Row -->
	<div class="row justify-content-center">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row" style="width:964px;">
					<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
					<div class="col-lg-6">
                	<div class="p-5">
	                  	<div class="text-center">
	                    	<h3 class="h4 text-gray-900 mb-2">비밀번호 찾기</h3>
	                    	<p>아이디와 이메일을 입력해주세요</p>
	                  	</div>
	                  	<form class="user" method="post" action="passwordFindAction.le">
	                    	<div class="form-group">
								<input type="text" class="form-control form-control-user" id="userID" name="userID" placeholder="ID" required>
							</div>
	                    	<div class="form-group">
								<input type="email" class="form-control form-control-user" id="userEmail" name="userEmail" placeholder="Email" required>
							</div>
	                    	<button type="submit" class="btn btn-primary btn-user btn-block">Click</button>
						</form>
						<hr>
						<div class="text-center">
							<a class="small" href="userJoin.le">회원가입 하러 가기</a>
						</div>
						<div class="text-center">
							<a class="small" href="userLogin.le">로그인 하러 가기</a>
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