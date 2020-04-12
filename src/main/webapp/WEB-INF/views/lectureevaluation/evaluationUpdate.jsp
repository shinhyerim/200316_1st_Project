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
	<form class="form-group mt-5" action="updateAction.le" method="post">
		<input type="hidden" name="evaluationID" value="${evalUpdateContent.evaluationID}">
		<input type="hidden" id="page" name="page" value="${search.page}">
		<input type="hidden" id="range" name="range" value="${search.range}">
		<input type="hidden" id="searchType" name="searchType" value="${search.searchType}">
		<input type="hidden" id="keyword" name="keyword" value="${search.keyword}">
		<div class="text-center">
			<h4>강의평가 수정 양식</h4>
			<small>작성된 강의평가는 익명으로 등록됩니다.<br>욕설 또는 비방 목적의 글은 관리자에 의해 삭제될 수 있습니다.</small>
		</div>
		<div class="form-group">
			<label>강의명</label>
			<input type="text" name="lectureName" class="form-control" maxlength="20" value="${evalUpdateContent.lectureName}">
		</div>
		<div class="form-group">
			<label>교수명</label>
			<input type="text" name="professorName" class="form-control" maxlength="20" value="${evalUpdateContent.professorName}">
		</div>
		<div class="form-row">
			<div class="form-group col-sm-4">
				<label>수강연도</label>
				<select name="lectureYear" class="form-control">
				<c:forEach var="year" items="${yearList}">
					<option value="${year}" <c:if test="${evalUpdateContent.lectureYear == year}">${'selected'}</c:if>>${year}</option>
				</c:forEach>
				</select>
			</div>
			<div class="form-group col-sm-4">
				<label>수강 학기</label>
				<select name="semesterDivide" class="form-control">
				<c:forEach var="semester" items="${semesterList}">
					<option value="${semester}" <c:if test="${evalUpdateContent.semesterDivide == semester}">${'selected'}</c:if>>${semester}</option>
				</c:forEach>
				</select>
			</div>
			<div class="form-group col-sm-4">
				<label>강의구분</label>
				<select name="lectureDivide" class="form-control">
				<c:forEach var="lecture" items="${lectureList}">
					<option value="${lecture}" <c:if test="${evalUpdateContent.lectureDivide == lecture}">${'selected'}</c:if>>${lecture}</option>
				</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label>제목</label>
			<input type="text" name="evaluationTitle" class="form-control" maxlength="30" value="${evalUpdateContent.evaluationTitle}">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea name="evaluationContent" class="form-control" maxlength="2048" style="height:180px;">${evalUpdateContent.evaluationContent}</textarea>
		</div>
		<div class="form-row">
			<div class="form-group col-sm-3">
				<label>종합평가</label>
				<select name="totalScore" class="form-control">
				<c:forEach var="total" items="${scoreList}">
					<option value="${total}" <c:if test="${evalUpdateContent.totalScore == total}">${'selected'}</c:if>>${total}</option>
				</c:forEach>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label>성적부여 정도</label>
				<select name="creditScore" class="form-control">
				<c:forEach var="credit" items="${scoreList}">
					<option value="${credit}" <c:if test="${evalUpdateContent.creditScore == credit}">${'selected'}</c:if>>${credit}</option>
				</c:forEach>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label>강의진행 정도</label>
				<select name="comfortableScore" class="form-control">
				<c:forEach var="comfortable" items="${scoreList}">
					<option value="${comfortable}" <c:if test="${evalUpdateContent.comfortableScore == comfortable}">${'selected'}</c:if>>${comfortable}</option>
				</c:forEach>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label>강의내용 수준</label>
				<select name="contentScore" class="form-control">
				<c:forEach var="lecturecontent" items="${scoreList}">
					<option value="${lecturecontent}" <c:if test="${evalUpdateContent.contentScore == lecturecontent}">${'selected'}</c:if>>${lecturecontent}</option>
				</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-primary">수정하기</button>
			<button type="button" class="btn btn-secondary" onClick="history.go(-1);">수정취소</button>			
		</div>
	</form>
</section>

<%@include file ="../common/footer.jsp" %>
</body>
</html>