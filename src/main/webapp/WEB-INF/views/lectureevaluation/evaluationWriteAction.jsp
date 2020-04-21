<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1}">
	<script>
		alert("강의평가 등록에 성공하였습니다.");
		location.href="evaluationList.le";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("강의평가 등록에 실패하였습니다.");
		history.go(-1);
	</script>
</c:if>
