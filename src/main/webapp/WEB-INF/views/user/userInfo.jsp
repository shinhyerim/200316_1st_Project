<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<title>User Info</title>
</head>
<body class="bg-gradient-warning">
<section class="container mt-5">
    <!-- Outer Row -->
	<div class="row justify-content-center">
		<div class="card o-hidden border-0 shadow-lg my-5" style="width:100%;">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row"  style="height:360px;">
					<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
					<div class="col-lg-6 p-5">
					<div class="p-5">
						<div class="text-center">
							<p>본인 확인을 위해 비밀번호를 입력해주세요.</p>
						</div>
						<form method="post" action="userInfoChk.le" style="padding-bottom: 20px;">
							<input type="hidden" name="userID" id="userID" value="${userInfo.userID}">
							<div class="form-group">
								<input type="password" class="form-control form-control-user" id="userPassword" name="userPassword" placeholder="Confrim Password"required>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<button type="submit" class="btn btn-primary btn-user btn-block">확인</button>
								</div>
				                <div class="col-sm-6">
				                	<button type="button" class="btn btn-secondary btn-user btn-block" onClick="location.href='userMain.le';">취소</button>	
				                </div>			
							</div>
		                 </form>
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