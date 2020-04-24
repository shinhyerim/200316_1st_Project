<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<script src="resources/js/evaluationUser.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Lecture Evaluation View - User</title>

</head>
<body>
<%@include file ="../common/header.jsp" %>
	
<section class="container mb-5">
	<!-- 강의평가 작성 내역  -->
	<div class="form-group mt-5 mb-5">
		<div class="text-center mt-5 mb-3">
			<h5>${sessionScope.userInfo.userID} 님의 강의평가 작성내역</h5>
		</div>
		<!-- 등록된 강의평가가 존재하지 않는 경우 아래 문구 출력  -->
		<c:if test="${userEvaluationList == null}">
			<div class="form-group mt-5">
				<p>등록된 강의평가가 없습니다. 강의평가를 등록해주세요.</p>
			</div>
		</c:if>
		<!-- 등록된 강의평가가 존재하는 경우 card형식으로 출력  -->
		<c:if test="${userEvaluationList != null}">
			<c:forEach  items="${userEvaluationList}" var="userEvaluationList">
				<div class="card bg-light mt-3 mb-3">
					<div class="card-header bg-light">
						<div class="row">
							<div class="col-8 text-left">${userEvaluationList.lectureName}&nbsp;&nbsp;<small>[ ${userEvaluationList.lectureYear} 학년도 ${userEvaluationList.semesterDivide} ${userEvaluationList.professorName} 교수 ]</small></div>
						</div>
					</div>
					<div class="card-body">
						<h5 class="card-title" style="font-family: 'Noto Sans KR', sans-serif; font-weight:bold;">${userEvaluationList.evaluationTitle}&nbsp;</h5>
						<p class="card-text">${userEvaluationList.evaluationContent}</p>
						<div class="row">
							<div class="col-9 text-left">
								종합&nbsp;<span style="color:red;">${userEvaluationList.totalScore}</span>
								성적부여 여부&nbsp;<span style="color:red;">${userEvaluationList.creditScore}</span>
								강의진행 정도&nbsp;<span style="color:red;">${userEvaluationList.comfortableScore}</span>
								강의내용 수준&nbsp;<span style="color:red;">${userEvaluationList.contentScore}</span>
								&nbsp;&nbsp;<span style="color:green;">[추천 : ${userEvaluationList.likeCount}]</span>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<div class="row">
							<div class="col-sm-3">
								<a class="btn btn-primary" href="update.le?evaluationID=${userEvaluationList.evaluationID}">수정</a>
								<a class="btn btn-danger" onClick="return confirm('삭제하시겠습니까?')" href="delete.le?evaluationID=${userEvaluationList.evaluationID}">삭제</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		</div>
</section>

<%@include file ="../common/footer.jsp" %>
</body>
</html>