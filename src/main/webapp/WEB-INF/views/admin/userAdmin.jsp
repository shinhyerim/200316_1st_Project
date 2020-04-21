<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/custom.css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<script>
	// 이전 버튼 이벤트
	function fn_prev(page, range, rangeSize){
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "userAdmin.le";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
	
	// 페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword){
		var url = "userAdmin.le";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
	
	// 다음 버튼 이벤트
	function fn_next(page, range, rangeSize){
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		
		var url = "userAdmin.le";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
</script>
<title>Admin - User List</title>
</head>
<body>
<%@include file ="../common/header.jsp" %>
	
<section class="container mt-5 mb-5">
	<div class="text-center mt-5 mb-3">
		<h4>회원 목록</h4>
	</div>
	<!-- 회원  목록 -->
	<div class="form-group mt-4">
		<div class="row">
			<table class="table" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">번호</th>
						<th style="background-color: #eeeeee; text-align:center;">아이디</th>
						<th style="background-color: #eeeeee; text-align:center;">패스워드</th>
						<th style="background-color: #eeeeee; text-align:center;">이름</th>
						<th style="background-color: #eeeeee; text-align:center;">학과</th>
						<th style="background-color: #eeeeee; text-align:center;">이메일</th>
						<th style="background-color: #eeeeee; text-align:center;">가입일자</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list == null}">
							<p>홈페이지에 등록된 회원이 없습니다.</p>
					</c:if>
					<c:if test="${list != null}">
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.rownum}</td>
								<td>${list.userID}</td>
								<td>${list.userPassword}</td>
								<td>${list.userName}</td>
								<td>${list.userDepartment}</td>
								<td>${list.userEmail}</td>
								<td>${list.userRegdate}</td>
							</tr> 
						</c:forEach>
					</c:if>	
				</tbody>
			</table>
		</div>
	</div>
	<!-- Pagination -->
	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}')">이전</a></li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
					<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pagination.next}">					
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')" >다음</a></li>
			</c:if>
		</ul>
	</div>
</section>

<%@include file ="../common/footer.jsp" %>
</body>
</html>