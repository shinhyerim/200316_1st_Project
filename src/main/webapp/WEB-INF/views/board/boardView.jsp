<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/custom.css">
<script type="text/javascript">
//댓글 저장
function insertReplyFunction(){
	var replyContext = $('#replyContext').val();
	var userID = $('#userID').val();
	// JSON.stringify() : JSON객체를 JSON형태의 문자열로 변환해줌
	// JSON.parse() : JSON형태의 문자열을 JSON객체로 변환해줌
	var paramData = JSON.stringify({"replyContext" : replyContext, "userID" : userID, "boardID" : ${boardDTO.boardID} });
	var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
	
	$.ajax({
		url: 'insertReply.le',
		headers: headers,
		data: paramData,
		type: 'POST',
		dataType: 'text',
		success: function(result){
			console.log("댓글 작성 성공:"+result);
			alert("댓글 작성 성공");
			location.href="boardView.le?boardID="+${boardDTO.boardID};
		},
		error: function(error){
			console.log("에러 : "+error);
		}
	});
}
//댓글 삭제
function deleteReplyFunction(replyID){
	var paramData = {"replyID":replyID};
	
	$.ajax({
		url: 'deleteReply.le',
		data: paramData,
		type: 'POST',
		dataType: 'text',
		success:function(result){
			console.log("댓글 삭제 성공 :"+result);
			alert("댓글이 삭제 되었습니다.");
			location.href="boardView.le?boardID="+${boardDTO.boardID};
		},
		error:function(error){
			console.log("에러: "+error);
			alert("댓글 삭제 에러 발생");
			history.go(-1);
		}
		
	});
}
</script>
<title>Board View</title>
</head>
<body>
<%@include file ="../common/header.jsp" %>

	<section class="container">
		<form class="form-group mt-5">
			<!-- 게시글 번호 및 페이지, 검색 정보를 hidden으로 넘겨줌 -->
			<input type="hidden" id="boardID" name="boardID" value="${boardDTO.boardID}"> 
			<input type="hidden" id="page" name="page" value="${search.page}"> 
			<input type="hidden" id="range" name="range" value="${search.range}"> 
			<input type="hidden" id="searchType" name="searchType" value="${search.searchType}"> 
			<input type="hidden" id="keyword" name="keyword" value="${search.keyword}">
			<table class="table table-borded">
				<tbody>
					<tr>
						<td>작성자</td>
						<td>${boardDTO.userID}</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td>${boardDTO.hit}</td>
					</tr>
					<tr>
						<td>글 제목</td>
						<td>${boardDTO.boardTitle}</td>
					</tr>
					<tr>
						<td>글 내용</td>
						<td>${boardDTO.boardContent}</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td>${boardDTO.boardRegdate}</td>
					</tr>
				</tbody>
			</table>
			
			<!-- 공유된 세션의 userID가 존재하고, userID와 게시글의 userID가 일치하는 경우 '수정','삭제'버튼 생성   -->
			<c:if test="${sessionScope.userInfo.userID != null && sessionScope.userInfo.userID eq boardDTO.userID}">
				<a class="btn btn-warning" href="boardUpdate.le?boardID=${boardDTO.boardID}&page=${search.page}&range=${search.range}&searchType=${search.searchType}&keyword=${search.keyword}" style="text-decoration: none;">수정하기</a>
				<a class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')" href="boardDelete.le?boardID=${boardDTO.boardID}" style="text-decoration: none;">삭제하기</a>
			</c:if>
			
			<!-- 일반 사용자(게시글 작성자 포함)에게 보여지는 게시글 목록 이동 버튼  -->
			<c:if test="${sessionScope.userInfo.userID != 'admin'}">
				<a class="btn btn-primary" href="boardList.le?page=${search.page}&range=${search.range}&searchType=${search.searchType}&keyword=${search.keyword}"
					style="text-decoraiton: none;">목록으로</a>
			</c:if>

			<!-- 관리자의 경우 게시물 삭제가 가능하며, 관리자 페이지의 게시글 목록으로 이동하는 버튼 생성  -->
			<c:if test="${sessionScope.userInfo.userID eq 'admin'}">
				<a class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')"
					href="boardDelete.le?boardID=${boardDTO.boardID}" style="text-decoration: none;">삭제하기</a>
				<a class="btn btn-primary" href="boardAdmin.le" style="text-decoration: none;">목록으로</a>
			</c:if>
		</form>

		<hr class="mt-4 mb-3">

		<!-- 댓글 작성 폼 -->
		<c:if test="${sessionScope.userInfo != null}">
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form name="replyForm" id="replyForm" role="form" method="post">
					<!-- 게시글 번호, 페이지 및 검색 정보 hidden으로 넘겨줌  -->
					<input type="hidden" id="boardID" name="boardID" value="${boardDTO.boardID}"/> 
					<input type="hidden" id="page" name="page" value="${search.page}" /> 
					<input type="hidden" id="range" name="range" value="${search.range}" /> 
					<input type="hidden" id="searchType" name="searchType" value="${search.searchType}" />
					<input type="hidden" id="keyword" name="keyword" value="${search.keyword}"/>
					<div class="row">
						<div class="col-sm-10">
							<textarea id="replyContext" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>
						</div>
						<div class="col-sm-2">
							<input class="form-control" id="userID" placeholder="댓글 작성자" value="${sessionScope.userInfo.userID}"/>
							<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" Onclick="insertReplyFunction();" style="width: 100%; margin-top: 10px"> 저 장 </button>
						</div>
					</div>
				</form>
			</div>
		</c:if>
		<!-- 댓글 목록 -->
		<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
			<h6 class="border-bottom pb-2 mb-3">댓글 목록</h6>
			<div id="replyList">
				<!-- 댓글 목록이 있을 경우에만 출력  -->
				<c:forEach items="${replyList}" var="replyList">
					<li style="list-style:none;">
						<p id="replyInfo">
							<b>${replyList.userID}</b>&nbsp;
							<small><fmt:formatDate value="${replyList.replyRegdate}" pattern="yyyy-MM-dd"/></small>&nbsp;&nbsp;
							<!-- 공유된 세션의 userID와 댓글 작성자 userID가 일치하는 경우 '삭제'가능  -->
							<c:if test="${sessionScope.userInfo.userID eq replyList.userID}">
								<small><a onClick="deleteReplyFunction(${replyList.replyID});" style="text-decoraion:none; color:blue;">삭제</a></small>
							</c:if>
						</p>
						<hr>
						<p id="replyContext">${replyList.replyContext}</p>
					</li>
				</c:forEach>
			</div>
		</div>
	</section>

<%@include file ="../common/footer.jsp" %>
</body>
</html>