<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
<div id="paginationBox mt-3">
	<!-- PagiNation:부트스트랩 웹 디자인 프레임워크에서 제공되는 하나의 기술, 여러개의 페이지가 있는 하나의 구성요소를 작업할 때 사용함 -->
	<ul class="pagination">
		<!-- '이전'버튼 -->
		<c:if test="${pagination.prev}">
			<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}','${search.searchType}','${search.keyword}')">이전</a></li>
		</c:if>
		
		<!-- 페이지 번호 처리 : 반복문을 사용하여 페이지를 반복해서 출력, 반복 시작 번호와 끝 번호 지정 -->
		<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
			<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
				<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}','${search.searchType}','${search.keyword}')"> ${idx}</a>
			</li>
		</c:forEach>
		
		<!-- '다음'버튼  -->
		<c:if test="${pagination.next}">
			<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}','${search.searchType}','${search.keyword}')" >다음</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>