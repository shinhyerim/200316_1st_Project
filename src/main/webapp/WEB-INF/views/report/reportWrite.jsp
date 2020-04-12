<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1}">
	<script>
		alert("신고가 접수되었습니다.");
		location.href="evaluationList.le";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("신고가 접수되지 않았습니다. 다시 확인해주세요.");
		history.go(-1);
	</script>
</c:if>
