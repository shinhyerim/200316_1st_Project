<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1}">
	<script>
		alert("글 수정에 성공하였습니다.");

		var url = "boardList.le";
		url = url + "?boardID=" + ${boardDTO.boardID};
		url = url + "&page=" + ${search.page};
		url = url + "&range=" + ${search.range};
		
		location.href= url;
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("글 수정에 실패하였습니다. 다시 확인해주세요.");
		history.go(-1);
	</script>
</c:if>