<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1}">
	<script>
		alert("해당 강의평가 글이 삭제되었습니다.");
		location.href="evaluationList.le";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("데이터베이스 오류로 삭제 실패");
		history.go(-1);
	</script>
</c:if>