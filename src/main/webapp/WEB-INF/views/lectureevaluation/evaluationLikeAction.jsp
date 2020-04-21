<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1}">
	<script>
		alert("추천 완료되었습니다.");
		location.href="evaluationList.le";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("데이터베이스 오류로 추천 실패");
		history.go(-1);
	</script>
</c:if>