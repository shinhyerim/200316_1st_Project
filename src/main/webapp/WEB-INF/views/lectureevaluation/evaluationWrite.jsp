<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Lecture Evaluation</title>
</head>
<body>
<%
	String[] yearList={"2011","2012","2013","2014","2015","2016","2017","2018","2019","2020"};
	String[] semesterList={"1학기","여름학기","2학기","겨울학기"};
	String[] lectureList={"전공","교양","기타"};
	String[] scoreList={"A","B","C","D","F"};
	
	pageContext.setAttribute("yearList",yearList);
	pageContext.setAttribute("semesterList",semesterList);
	pageContext.setAttribute("lectureList",lectureList);
	pageContext.setAttribute("scoreList",scoreList);
%>

<%@include file ="../common/header.jsp" %>
	
<section class="container">
	<form class="form-group mt-5" action="evaluationWriteAction.le" method="post">
	<input type="hidden" name="userID" value="${sessionScope.userInfo.userID}">
		<div class="text-center">
			<h4>강의평가 작성 양식</h4>
			<small>작성된 강의평가는 익명으로 등록됩니다.<br>욕설 또는 비방 목적의 글은 관리자에 의해 삭제될 수 있습니다.</small>
		</div>
		<!-- 강의평가 작성 폼  -->
		<div class="form-group">
			<label>강의명</label>
			<input type="text" name="lectureName" class="form-control" maxlength="20">
		</div>
		<div class="form-group">
			<label>교수명</label>
			<input type="text" name="professorName" class="form-control" maxlength="20">
		</div>
		<div class="form-row">
			<div class="form-group col-sm-4">
				<label>수강연도</label>
				<select name="lectureYear" class="form-control">
				<c:forEach var="year" items="${yearList}">
					<option value="${year}">${year}</option>
				</c:forEach>
				</select>
			</div>
		<div class="form-group col-sm-4">
			<label>수강 학기</label>
				<select name="semesterDivide" class="form-control">
				<c:forEach var="semester" items="${semesterList}">
					<option value="${semester}">${semester}</option>
				</c:forEach>
				</select>
		</div>
		<div class="form-group col-sm-4">
			<label>강의구분</label>
				<select name="lectureDivide" class="form-control">
				<c:forEach var="lecture" items="${lectureList}">
					<option value="${lecture}">${lecture}</option>
				</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label>제목</label>
			<input type="text" name="evaluationTitle" class="form-control" maxlength="30">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea name="evaluationContent" class="form-control" maxlength="2048" style="height:180px;"></textarea>
		</div>
		<div class="form-row">
			<div class="form-group col-sm-3">
				<label>종합평가</label>
				<select name="totalScore" class="form-control">
					<c:forEach var="total" items="${scoreList}">
						<option value="${total}">${total}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label>성적부여 정도</label>
				<select name="creditScore" class="form-control">
					<c:forEach var="credit" items="${scoreList}">
						<option value="${credit}">${credit}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label>강의진행 정도</label>
				<select name="comfortableScore" class="form-control">
					<c:forEach var="comfortable" items="${scoreList}">
						<option value="${comfortable}">${comfortable}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label>강의내용 수준</label>
				<select name="contentScore" class="form-control">
					<c:forEach var="lecturecontent" items="${scoreList}">
						<option value="${lecturecontent}">${lecturecontent}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-primary">등록하기</button>
			<button type="button" class="btn btn-secondary" onClick="history.go(-1);">등록취소</button>
		</div>
	</form>
</section>

<%@include file ="../common/footer.jsp" %>

</body>
</html>