<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<title>Login</title>
</head>
<body class="bg-gradient-warning">
<section class="container mt-5">
    <!-- Outer Row -->
    <div class="row justify-content-center">
      <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome!</h1>
                  </div>
                  <!-- 로그인 폼  -->
                  <form class="user" action="userLoginAction.le" method="post">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" name="userID" id="userID"  placeholder="ID">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" name="userPassword" id="userPassword" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block">로그인</button>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="passwordFind.le">비밀번호 찾기</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="idFind.le">아이디 찾기</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="userJoin.le">회원가입하러 가기</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="evaluationList.le">메인으로</a>
                  </div>
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