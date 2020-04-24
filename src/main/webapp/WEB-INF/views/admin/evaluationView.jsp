<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Admin - Lecture Evaluation View</title>
</head>
<body>
<%@include file ="../common/header.jsp" %>
	
<section class="container">
	<!-- 관리자는 강의평가 상세 내역을 확인만 할 수 있을 뿐 수정은 할 수 없기 때문에 readonly 설정  -->
	<form class="form-group mt-5 mb-5">
	<div class="text-left mt-5">
			<h5 class="center">No.&nbsp;${adminEvaluationContent.evaluationID}</h5>
		</div>
		<div class="form-group">
			<label>작성자&nbsp;</label>
			<input type="text" name="userID" class="form-control" value="${adminEvaluationContent.userID}" readonly>
		</div>
		<div class="form-group">
			<label>강의명</label>
			<input type="text" name="lectureName" class="form-control" value="${adminEvaluationContent.lectureName}" readonly>
		</div>
		<div class="form-group">
			<label>교수명</label>
			<input type="text" name="professorName" class="form-control" value="${adminEvaluationContent.professorName}" readonly>
		</div>
		<div class="form-row">
			<div class="form-group col-sm-4">
				<label>수강연도</label>
				<input type="text" name="lectureYear" class="form-control" value="${adminEvaluationContent.lectureYear}" readonly>
			</div>
			<div class="form-group col-sm-4">
				<label>수강 학기</label>
				<input type="text" name="semesterYear" class="form-control" value="${adminEvaluationContent.semesterDivide}" readonly>
			</div>
			<div class="form-group col-sm-4">
				<label>강의구분</label>
				<input type="text" name="lectureDivide" class="form-control" value="${adminEvaluationContent.lectureDivide}" readonly>
			</div>
		</div>
		<div class="form-group">
			<label>제목</label>
			<input type="text" name="evaluationTitle" class="form-control" value="${adminEvaluationContent.evaluationTitle}" readonly>
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea name="evaluationContent" class="form-control"style="height:180px;" readonly>${adminEvaluationContent.evaluationContent}</textarea>
		</div>
		<div class="form-row">
			<div class="form-group col-sm-3">
				<label>종합평가</label>
				<input type="text" name="totalScore" class="form-control" value="${adminEvaluationContent.totalScore}" readonly>
			</div>
			<div class="form-group col-sm-3">
				<label>성적부여 정도</label>
				<input type="text" name="creditScore" class="form-control" value="${adminEvaluationContent.creditScore}" readonly>
			</div>
			<div class="form-group col-sm-3">
				<label>강의진행 정도</label>
				<input type="text" name="comfortableScore" class="form-control" value="${adminEvaluationContent.comfortableScore}" readonly>
			</div>
			<div class="form-group col-sm-3">
				<label>강의내용 수준</label>
				<input type="text" name="contentScore" class="form-control" value="${adminEvaluationContent.contentScore}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-2">
				<a class="btn btn-danger btn-block" href="adminDelete.le?evaluationID=${adminEvaluationContent.evaluationID}">삭제</a>
			</div>
			<div class="col-sm-2">
				<a class="btn btn-primary btn-block" href="evaluationAdmin.le">목록</a>
			</div>
		</div>
	</form>
</section>

<%@include file ="../common/footer.jsp" %>
</body>
</html>