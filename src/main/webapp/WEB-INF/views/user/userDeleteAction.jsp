<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1}">
	<script>
		alert("회원탈퇴가 정상적으로 처리되었습니다.");
		<% session.invalidate();%>
		location.href="evaluationList.le";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("회원탈퇴 처리 오류 발생");
		history.go(-1);
	</script>
</c:if>