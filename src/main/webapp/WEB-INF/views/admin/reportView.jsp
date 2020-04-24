<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<script type="text/javascript">

// '사용자 신고 접수' → '접수 완료' 상태 변경 처리
function acceptFunction(){
	$.ajax({
		type: 'POST',
		url: 'reportAccept.le',
		data: {reportID : $('#accept').val()},
		success: function(acceptResult){
			console.log(acceptResult);
			if(acceptResult == 1){
				alert('신고 접수 처리 성공');
				location.href='reportView.le?reportID='+${reportContent.reportID};
			}else{
				alert('신고 접수 처리 실패');
				history.go(-1);
			}
		}
	});
	return
}

// '접수 완료' → '처리 완료' 상태 변경 처리
function successFunction(){
	$.ajax({
		type: 'POST',
		url: 'reportSuccess.le',
		data: {reportID : $('#success').val()},
		success: function(successResult){
			console.log(successResult);
			if(successResult == 1){
				alert('신고 처리 완료');
				location.href='reportView.le?reportID='+${reportContent.reportID};
			}else{
				alert('신고 처리 실패');
				history.go(-1);
			}
		}
	});
	return
}
</script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Admin - Report View</title>
</head>
<body>
<%@include file ="../common/header.jsp" %>
	
<section class="container">
	<form class="form-group mt-5 mb-5">
		<div class="text-left mt-5">
			<h5 class="center">No.&nbsp;${reportContent.reportID}</h5>
		</div>	
		<div class="form-group">
			<label>구분</label>
			<input type="text" name="reportDivide" class="form-control" value="${reportContent.reportDivide}" readonly>
		</div>
		<div class="form-group">
			<label>작성자</label>
			<input type="text" name="userID" class="form-control" value="${reportContent.userID}" readonly>
		</div>
		<div class="form-group">
			<label>제목</label>
			<input type="text" name="reportTitle" class="form-control" value="${reportContent.reportTitle}" readonly>
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea name="reportContent" class="form-control"style="height:180px;" readonly>${reportContent.reportContent}</textarea>	
		</div>
		<div class="form-group">
			<label>신고일자</label>
			<input type="text" name="reportRegdate" class="form-control" value="${reportContent.reportRegdate}" readonly>
		</div>
		<div class="form-group">
			<label>처리상태</label>
			<c:if test="${reportContent.reportStatus == 0}">
				<p style="color:red;"><b>접수 완료</b></p>
			</c:if>
			<c:if test="${reportContent.reportStatus == 1}">
				<p style="color:red;"><b>사용자 신고 접수</b></p>
			</c:if>
			<c:if test="${reportContent.reportStatus == 2}">
				<p style="color:red;"><b>처리 완료</b></p>
			</c:if>
			<c:if test="${reportContent.reportStatus == 3}">
				<p style="color:red;"><b>사용자에 의한 삭제</b></p>
			</c:if>		
		</div>
		<div class="form-group">
			<button id="accept" class="btn btn-warning" onClick="acceptFunction();" value="${reportContent.reportID}">접수</button>
			<button id="success" class="btn btn-danger" onClick="successFunction();" value="${reportContent.reportID}">완료</button>
			<a class="btn btn-secondary" href="reportAdmin.le">목록</a>
		</div>
	</form>
</section>
<%@include file ="../common/footer.jsp" %>
</body>
</html>