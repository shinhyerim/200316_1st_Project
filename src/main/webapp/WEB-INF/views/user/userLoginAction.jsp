<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == -1 }">
	<script>
		location.href="evaluationList.le";
	</script>
</c:if>

<c:if test="${result == 1}">
	<script>
		alert("등록된 회원정보가 존재하지 않습니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 2}">
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
</c:if>