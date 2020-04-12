<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
// ID중복확인
function idCheckFunction(){
	var userID = $('#userID').val();
	$.ajax({
		type: 'POST',
		url: 'idcheck.le',
		// 파라미터값 : var값
		data: {userID : userID},
		success: function(result){
			console.log(result);
			
			if(result == 0){
				$('#idCheckMessage').html('사용 가능한 아이디입니다.');
			}else{
				$('#idCheckMessage').html('아이디 중복:사용 불가능한 아이디입니다.');
			}
		} 
	})
}

// 비밀번호 확인
function passwordCheckFunction(){
	var p1 = $('#userPassword').val();		
	var p2 = $('#userPassword2').val();
	if(p1 != p2){
		$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
	}else{
		$('#passwordCheckMessage').html('');
	}
}
</script>
<title>User Join</title>
</head>
<body class="bg-gradient-warning">
<section class="container">
	<div class="card o-hidden border-0 shadow-lg my-5">
		<div class="card-body p-0">
		<!-- Nested Row within Card Body -->
		<div class="row">
        	<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
	        <div class="col-lg-7">
		        <div class="p-5">
					<div class="text-center">
						<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
					</div>
					<form method="post" action="userJoinAction.le" style="padding-bottom: 20px;">
						<div class="form-group">
			            	<label>아이디</label><input type="text" class="form-control form-control-user" name="userID" id="userID" onKeyUp="idCheckFunction();" placeholder="ID" required>
			               	<small style="color:red; text-align:left; font-weight:bold;" id="idCheckMessage"></small>
			           	</div>
			            <div class="form-group">
			                <label>비밀번호</label> <input type="password"  class="form-control form-control-user" id="userPassword" name="userPassword" placeholder="PASSWORD" required>
			            </div>
			            <div class="form-group">
			                <label>비밀번호 확인</label> <input type="password" id="userPassword2" name="userPassword2" class="form-control form-control-user" onKeyUp="passwordCheckFunction();" placeholder="Confirm Password" required>
			                <small style="color:red; text-align:left; font-weight:bold;" id="passwordCheckMessage"></small>
			            </div>
			            <div class="form-group">
							<label>성명</label> <input type="text" name="userName" class="form-control form-control-user" placeholder="Name" required>
						</div>
			            <div class="form-group">
							<label>학과</label> <input type="text" name="userDepartment" class="form-control form-control-user" placeholder="Department" required>
						</div>
			            <div class="form-group">
							<label>이메일</label> <input type="email" name="userEmail" class="form-control form-control-user" placeholder="ex) lecture@gmail.com" required>
			            </div>
			            <div class="form-group row">
			                <div class="col-sm-6">
			                	<button type="submit" class="btn btn-success btn-user btn-block">회원가입</button>
			                </div>
			                <div class="col-sm-6">
			                	<button type="button" class="btn btn-danger btn-user btn-block" onClick="location.href='evaluationList.le';" style="text-decoration:none;">취소</button>
			                </div>
			            </div>
					</form>
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