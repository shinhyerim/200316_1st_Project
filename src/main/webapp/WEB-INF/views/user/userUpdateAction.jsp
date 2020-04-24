<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1}">
	<script type="text/javascript">
		var chk = confirm("회원정보가 수정되었습니다. 로그아웃하시겠습니까?");
		if(chk == true){
			location.href='userLogout.le';
		} else{
			location.href='userUpdate.le';
		}
	</script>
</c:if>
