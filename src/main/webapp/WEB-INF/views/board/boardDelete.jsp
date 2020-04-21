<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result == 1}">
	<script>
		alert("글이 삭제되었습니다.");
		location.href="boardList.le";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("글 삭제에 실패하였습니다.");
		history.go(-1);
	</script>
</c:if>
