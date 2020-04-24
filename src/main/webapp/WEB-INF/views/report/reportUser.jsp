<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>User - Report View</title>
</head>
<body>
<%@include file ="../common/header.jsp" %>

<section class="container">
	<div class="form-group mt-5 mb-5">
		<div class="text-center mt-5 mb-3">
			<h5>${sessionScope.userInfo.userID} 님의 신고내역</h5>
		</div>
		<!-- 신고내역 목록  -->
		<!-- 작성된 신고내역이 존재하지 않는 경우 아래 문구 출력 -->
		<c:if test="${userReportList == null}">
			<div class="form-group mt-5">
				<p>작성된 신고내역이 없습니다.</p>
			</div>
		</c:if>
		<!-- 작성된 신고내역이 존재하는 경우 card형식으로 출력  -->
		<c:if test="${userReportList != null}">
			<c:forEach  items="${userReportList}" var="userReportList">
				<div class="card bg-light mt-3 mb-3">
					<div class="card-header bg-light">
						<p class="mb-0">구분 : ${userReportList.reportDivide} </p>
					</div>
					<div class="card-body">
						<h5 class="card-title">${userReportList.reportTitle}&nbsp;</h5>
						<p class="card-text">${userReportList.reportContent}</p>
						<p> 신고일자 : <fmt:formatDate value="${userReportList.reportRegdate}" type="date" dateStyle="full" /></p>
						<!-- 관리자의 처리 상태에 따라 다르게 출력  -->
						<c:if test="${userReportList.reportStatus == 1}">
							<p> 처리상태 : <b style="color:red;">신고 접수</b>
						</c:if>
						<c:if test="${userReportList.reportStatus == 0}">
							<p> 처리상태 : <b style="color:red;">접수 완료</b>
						</c:if>
						<c:if test="${userReportList.reportStatus == 2}">
							<p> 처리상태 : <b style="color:red;">처리 완료</b>
						</c:if>
					</div>
					<div class="card-footer">
						<div class="row">
							<div class="col-sm-3"><a class="btn btn-danger" href="reportDelete.le?reportID=${list.reportID}">삭제</a></div>
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