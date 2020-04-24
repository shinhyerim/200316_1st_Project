<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<script src="resources/js/evaluationList.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Lecture Evaluation List</title>
</head>
<body>

<%@include file ="common/header.jsp" %>

<section class="container">
	<!-- 공유된 세션이 존재하지 않을 때는 아래 문구가 출력되도록 함  -->
	<c:if test="${sessionScope.userInfo == null}">
	<div class="text-left mt-3 pl-1">
		<small style="color:red;">강의평가 등록 및 추천은 로그인 후 이용가능합니다.</small>
	</div>
	</c:if>
	<!-- 강의평가 검색창  -->
	<div class="form-inline mt-3">
		<select class="form-control mx-1 mt-2" name="searchType" id="searchType">
			<option value=""<c:out value="${pagination.searchType == null ? 'selected' : '' }"/>>전체</option>
			<option value="lectureName"<c:out value="${pagination.searchType eq 'lectureName' ? 'selected' : '' }"/>>교과목명</option>
			<option value="professorName"<c:out value="${pagination.searchType eq 'professorName' ? 'selected' : '' }"/>>교수명</option>
		</select>
		<input type="text" class="form-control mx-1 mt-2" name="keyword" id="keyword" placeholder="내용을 입력하세요." value="${pagination.keyword}">
		<button class="btn btn-warning mx-1 mt-2" name="btnSearch" id="btnSearch">검색</button>
		<!-- 공유된 세션이 존재할 때만 등록하기, 신고하기 버튼이 생성됨 -->
		<c:if test="${sessionScope.userInfo != null }">
			<a class="btn btn-primary mx-1 mt-2" href="evaluationWrite.le">등록하기</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고하기</a>
		</c:if>	
	</div>
	<!-- 강의평가 출력부분  -->
	<!-- 등록된 강의평가가 없을 때 아래 문구 출력 -->
	<c:if test="${list == null}">
		<div class="form-group mt-5">
			<p>등록된 강의평가가 없습니다. '등록하기'버튼을 눌러 강의평가를 등록해주세요.</p>
		</div>
	</c:if>
	<!-- 등록된 강의평가가 있을 때 강의평가 내용을 card형식으로 출력 -->
	<c:if test="${list != null}">
		<c:forEach  items="${list}" var="list">
			<div class="card bg-light mt-3 mb-3">
				<div class="card-header bg-light">
					<div class="row">
						<div class="col-8 text-left">${list.lectureName}&nbsp;&nbsp;<small>[ ${list.lectureYear}학년도 ${list.semesterDivide} 담당교수 ${list.professorName} ]</small></div>
					</div>
				</div>
				<div class="card-body">
					<h5 class="card-title" style="font-family: 'Noto Sans KR', sans-serif; font-weight:bold;">${list.evaluationTitle}&nbsp;</h5>
					<p class="card-text">${list.evaluationContent}</p>
					<div class="row">
						<div class="col-9 text-left">
							종합&nbsp;<span style="color:red;">${list.totalScore}</span>
							성적부여 여부&nbsp;<span style="color:red;">${list.creditScore}</span>
							강의진행 정도&nbsp;<span style="color:red;">${list.comfortableScore}</span>
							강의내용 수준&nbsp;<span style="color:red;">${list.contentScore}</span>
							&nbsp;&nbsp;<span style="color:green;">[추천 : ${list.likeCount}]</span>
						</div>
						<div class="col-3 text-right">
						<!-- 공유된 세션이 존재할 때만 '추천'이 가능하도록 함  -->
						<c:if test="${sessionScope.userInfo != null}">
							<a class="btn btn-warning"onClick="return confirm('추천하시겠습니까?')" href="like.le?evaluationID=${list.evaluationID}">추천</a>
						</c:if>
						<!-- 공유된 세션의 userID와 강의평가의 userID가 일치하는 경우에만 수정,삭제 버튼이 생성됨 -->
						<c:if test="${sessionScope.userInfo.userID eq list.userID}">
							<a class="btn btn-primary" href="update.le?evaluationID=${list.evaluationID}">수정</a>
							<a class="btn btn-danger" onClick="return confirm('삭제하시겠습니까?')" href="delete.le?evaluationID=${list.evaluationID}">삭제</a>
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
	
	<!-- 페이징처리 -->
	<%@include file ="common/pagination.jsp" %>
</section>

<!-- 신고하기는 modal창을 이용  -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">신고하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<form action="reportWrite.le" method="post">
					<!-- userID는 현재 공유된 세션의 id값을 hidden으로 넘겨줌 -->
					<input type="hidden" name="userID" value="${sessionScope.userInfo.userID}">
					<div class="form-group">
						<label>구분</label>
						<select name="reportDivide" class="form-control">
							<option value="강의평가">강의평가</option>
							<option value="자유게시판">자유게시판</option>
						</select>
					</div>
					<div class="form-group">
						<label>신고 제목</label>
						<input type="text" name="reportTitle" class="form-control" maxlength="30" required>
					</div>
					<div class="form-group">
						<label>신고 내용</label>
						<textarea name="reportContent" class="form-control" maxlength="1024" style="height:180px;" placeholder="필수 작성 내용 :신고하고자 하는 글의 제목 및 사유" required></textarea>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">신고하기</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file ="common/footer.jsp" %>

</body>
</html>