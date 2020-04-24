<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 1}">
	<script>
		alert("삭제 완료되었습니다."); // 삭제 완료되었다는 알림창은 생성되었지만, 실제로 삭제된 것은 아님 (DB에 존재, 관리자 페이지에서 확인 가능)
		location.href="reportUser.le";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("데이터베이스 오류로 인한 실패");
		location.go(-1);
	</script>
</c:if>