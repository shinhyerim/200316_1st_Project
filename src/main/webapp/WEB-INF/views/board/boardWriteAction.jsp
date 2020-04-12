<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1}">
	<script>
		alert("글 작성에 성공했습니다.");
		location.href="boardList.le";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("글 작성에 실패했습니다.")
		history.go(-1);
	</script>
</c:if>

