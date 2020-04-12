<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/custom.css">
<script type="text/javascript">
$(document).ready(function(){
	showReplyList(); // View페이지를 열게 되면 댓글이 뜨도록 함수를 호출해줌
});

function showReplyList(){
	var url = "replyList.le";
	var paramData = {"boardID" : ${boardDTO.boardID}};
	console.log(paramData);
	$.ajax({
		type: 'POST',
		url: url,
		data: paramData,
		success: function(result){
			console.log(result);
			var htmls="";
			if(result.length < 1){
				htmls = '등록된 댓글이 없습니다.';
			}else{ //반복을 통해 댓글 수만큼 html 문장을 생성함
				$(result).each(function(){
					htmls += '<div class="media text-muted pt-3" id="replyID' + this.replyID + '">';
                    htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
                    htmls += '<title>Placeholder</title>';
                    htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
                    htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
                    htmls += '</svg>';
                    htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
                    htmls += '<span class="d-block">';
                    htmls += '<strong class="text-gray-dark">' + this.userID + '</strong>';
                    htmls += '<span style="padding-left: 7px; font-size: 9pt">';
                    htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.replyID + ', \'' + this.userID + '\', \'' + this.replyContext + '\' )" style="padding-right:5px">수정</a>';
                    htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.replyID + ')" >삭제</a>';
                    htmls += '</span>';
                    htmls += '</span>';
                    htmls += this.replyContext;
                    htmls += '</p>';
                    htmls += '</div>';
				}); // each end
			}
			$("#replyList").html(htmls); // 댓글 리스트 영역에 출력 됨
		} // Ajax success end
	}); // Ajax end
}

//댓글 저장
function insertReplyFunction(){
	var replyContext = $('#replyContext').val();
	var userID = $('#userID').val();
	// JSON.stringify() : JSON객체를 JSON형태의 문자열로 변환해줌
	// JSON.parse() : JSON형태의 문자열을 JSON객체로 변환해줌
	var paramData = JSON.stringify({"replyContext" : replyContext, "userID" : userID, "boardID" : ${boardDTO.boardID}});
	var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
	
	$.ajax({
		url: 'insertReply.le',
		headers: headers,
		data: paramData,
		type: 'POST',
		dataType: 'text',
		success: function(result){
			console.log("성공: "+result);
			showReplyList();
			
			$('#replyContext').val();
			$('#userID').val();
		},
		error: function(error){
			console.log("에러 : "+error);
		}
	});
}

// 댓글 수정폼 : 위의 댓글 리스트에 fn_editReply 있음
function fn_editReply(replyID, userID, replyContext){
		var htmls = "";
		htmls += '<div class="media text-muted pt-3" id="replyID' + replyID + '">';
		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		htmls += '<title>Placeholder</title>';
		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
		htmls += '</svg>';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		htmls += '<strong class="text-gray-dark">' + userID + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + replyID + ', \'' + userID + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';		
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
		htmls += replyContext;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';

		$('#replyID' + replyID).replaceWith(htmls);
		$('#replyID' + replyID + ' #editContent').focus();
	}
	
// 댓글 수정
function fn_updateReply(replyID, userID){
	var replyEditContent = $('#editContent').val();
	var paramData = JSON.stringify({"replyContext":replyEditContent},{"replyID":replyID});
	var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
	
	$.ajax({
		url: 'updateReply.le',
		headers: headers,
		data: paramData,
		type: 'POST',
		dataType: 'text',
		success:function(result){
			console.log("수정성공: "+ result);
			showReplyList();
		},
		error:function(error){
			console.log("에러:" + error);
		}
	});
}

// 댓글 삭제
function fn_deleteReply(replyID){
	var paramData = {"replyID":replyID};
	
	$.ajax({
		url: 'deleteReply.le',
		data: paramData,
		type: 'POST',
		dataType: 'text',
		success:function(result){
			console.log("삭제 완료: "+result);
			showReplyList();
		},
		error:function(error){
			console.log("에러: "+error);
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
		
		<c:if test="${sessionScope.userInfo.userID != null && sessionScope.userInfo.userID eq boardDTO.userID}">
			<a class="btn btn-warning" href="boardUpdate.le?boardID=${boardDTO.boardID}&page=${search.page}&range=${search.range}&searchType=${search.searchType}&keyword=${search.keyword}" style="text-decoration:none;">수정하기</a>
			<a class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')" href="boardDelete.le?boardID=${boardDTO.boardID}" style="text-decoration:none;">삭제하기</a>
		</c:if>
		
		<c:if test="${sessionScope.userInfo.userID != 'admin'}">
			<a class="btn btn-primary" href="boardList.le?page=${search.page}&range=${search.range}&searchType=${search.searchType}&keyword=${search.keyword}" style="text-decoraiton:none;">목록으로</a>
		</c:if>
		
		<c:if test="${sessionScope.userInfo.userID eq 'admin'}">
			<a class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')" href="boardDelete.le?boardID=${boardDTO.boardID}" style="text-decoration:none;">삭제하기</a>
			<a class="btn btn-primary" href="boardAdmin.le" style="text-decoration:none;">목록으로</a>
		</c:if>
	</form>
	
	<hr class="mt-4 mb-3">
	
	<!-- 댓글 작성 폼 -->
	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
		<!-- spring에서 제공하는 form 라이브러리 -->
		<form:form name="form" id="form" role="form" modelAttribute="replyDTO" method="post">
			<form:hidden path="boardID" id="boardID"/>
			<div class="row">
				<div class="col-sm-10">
					<form:textarea path="replyContext" id="replyContext" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
				</div>
				<div class="col-sm-2">
					<form:input path="userID" class="form-control" id="userID" placeholder="댓글 작성자" value="${sessionScope.userInfo.userID}"></form:input>
					<c:if test="${sessionScope.userInfo != null}">
						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" Onclick="insertReplyFunction();" style="width: 100%; margin-top: 10px"> 저 장 </button>
					</c:if>
				</div>
			</div>
		</form:form>
	</div>
	<!-- 댓글 목록 -->
	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
		<h6 class="border-bottom pb-2 mb-0">댓글 목록</h6>
		<div id="replyList"></div>
	</div>
</section>

<%@include file ="../common/footer.jsp" %>
</body>
</html>