<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- 회원정보수정을 위한 본인확인성공 메세지 출력 -->
<c:if test="${result > 0}">
	<script>
		alert("본인 확인에 성공했습니다.");
	</script>
</c:if>

<script type="text/javascript">

// 비밀번호 일치 여부 검사
function passwordCheckFunction(){
	var p1 = $('#userPassword').val();		
	var p2 = $('#userPassword2').val();
	if(p1 != p2){
		$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
	}else{
		$('#passwordCheckMessage').html('');
	}
}

// 회원탈퇴
function userDeleteFunction(){
	var dchk = confirm('정말로 탈퇴하시겠습니까?');
	if(dchk == true){
		location.href='userDelete.le';
	}else{
		history.go(-1);
	}
}
</script>
<title>강의평가 사이트</title>
</head>
<body class="bg-gradient-warning">
<div class="container">
	<div class="card o-hidden border-0 shadow-lg my-5">
		<div class="card-body p-0">
		<!-- Nested Row within Card Body -->
		<div class="row">
        	<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
	        <div class="col-lg-7">
		        <div class="p-5">
					<div class="text-center">
						<h1 class="h4 text-gray-900 mb-4">${userInfo.userID}님의 회원정보</h1>
					</div>
					<form method="post" action="userUpdateAction.le" style="padding-bottom: 20px;">
						<div class="form-group">
			            	<label>아이디</label><input type="text" class="form-control form-control-user" name="userID" id="userID" onKeyUp="idCheckFunction();" value="${userInfo.userID}" readonly>
			           	</div>
			            <div class="form-group">
			                <label>비밀번호</label> <input type="password"  class="form-control form-control-user" id="userPassword" name="userPassword" value="${userInfo.userPassword}"required>
			            </div>
			            <div class="form-group">
			                <label>비밀번호 확인</label> <input type="password" id="userPassword2" name="userPassword2" class="form-control form-control-user" onKeyUp="passwordCheckFunction();" placeholder="Confirm Password" required>
			                <small style="color:red; text-align:left; font-weight:bold;" id="passwordCheckMessage"></small>
			            </div>
			            <div class="form-group">
							<label>성명</label> <input type="text" name="userName" class="form-control form-control-user" value="${userInfo.userName}" required>
						</div>
			            <div class="form-group">
							<label>학과</label> <input type="text" name="userDepartment" class="form-control form-control-user" value="${userInfo.userDepartment}" required>
						</div>
			            <div class="form-group">
							<label>이메일</label> <input type="email" name="userEmail" class="form-control form-control-user"  value="${userInfo.userEmail}" required>
			            </div>
			            <div class="form-group row">
			                <div class="col-sm-4">
			                	<button type="submit" class="btn btn-success btn-user btn-block">회원정보 수정</button>
			                </div>
			                <div class="col-sm-4">
			                	<button type="button" class="btn btn-danger btn-user btn-block" onClick="userDeleteFunction();" style="text-decoration:none;">회원탈퇴</button>
			                </div>
			                <div class="col-sm-4">
			                	<button type="button" class="btn btn-primary btn-user btn-block" onClick="location.href='userMain.le';" style="text-decoration:none;">취소</button>
			                </div>
			            </div>
					</form>
				</div>
	        </div>
		</div>
		</div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>