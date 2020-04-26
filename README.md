
# :house: 자기PR 및 강의평가 사이트

![Hportfolio](https://user-images.githubusercontent.com/60491863/80310835-add0f780-8817-11ea-9d10-ab30332c3359.gif)


## :paperclip: 프로젝트 구성

- 본인에 대한 간단한 소개
- 강의평가 사이트(PORFOLIO에서 링크로 연결)

* * *

## :date: 개발 기간
- 2020.03.16.~2020.04.08.

* * *

## :computer: 개발 환경
- OS : Windows
- Server : Apache Tomcat 9.0
- Tool : STS · MySQL 5.7 Command Line Client
- Language : JAVA · JSP · JavaScript(JQuery · Ajax)
- Framework : Spring Framework · MyBatis · Bootstrap

* * *

## :open_file_folder: ERD
![그림1](https://user-images.githubusercontent.com/60491863/80311762-82044080-881c-11ea-8ae5-5d8d412bcfc8.png)


* * *

## :pushpin: 기능 서술

1. 강의평가 목록 출력 SQL문
- 강의평가 검색 기능 추가로 MyBatis의 동적SQL인 if 사용
- 이미 where절이 있으므로 if를 사용
```sql
<select id="list" resultType="evaluationDTO">
	SELECT * FROM lectureevaluation
    	WHERE evaluationStatus = 1
    	<if test="searchType != null">
		<if test="searchType == 'lectureName'">
			AND lectureName LIKE CONCAT('%', #{keyword}, '%')
		</if>
		<if test="searchType == 'professorName'">
			AND professorName LIKE CONCAT('%', #{keyword}, '%')
		</if>
		</if>
    	ORDER BY evaluationRegdate desc
    	Limit #{startList}, #{listSize}
</select>
```

* * *

2. 게시판 목록 출력 SQL문
- 게시글의 번호를 매기기 위해서 @ROWNUM 사용
- 게시글 검색 기능을 추가하면서 MyBatis의 동적SQL인 trim, if 사용
- where 절을 무조건적으로 생성하지 않기 때문에 where 대신 trim을 사용
```sql
<select id="list" resultType="boardDTO">
	SELECT * FROM(
		SELECT @ROWNUM := @ROWNUM + 1 AS rownum, b.*
		FROM board b, (SELECT @ROWNUM := 0) TMP
		ORDER BY boardRegdate desc) SUB
	<trim prefix="WHERE" prefixOverrides="AND|OR">
		<if test="searchType=='title'">
			AND boardTitle LIKE CONCAT('%', #{keyword}, '%')
		</if>
		<if test="searchType=='content' ">
			AND boardContent LIKE CONCAT('%', #{keyword}, '%')
		</if>
		<if test="searchType=='reg_id'">
			AND userID LIKE CONCAT('%', #{keyword}, '%')
		</if>	
	</trim>
	ORDER BY SUB.ROWNUM ASC 
    	LIMIT #{startList}, #{listSize}
</select>
```

* * *

3. 아이디 중복 여부 검사
- 소스 위치 : src/main/webapp/WEB_INF/views/user/userJoin
- 페이지 리로드 없이 처리하기 위해 ajax 사용
```javascript
function idCheckFunction(){
	var userID = $('#userID').val();
	$.ajax({
		type: 'POST',
		url: 'idcheck.le',
		// 파라미터값 : var값
		data: {userID : userID},
		success: function(result){
			console.log(result);
			if(result == 0){
				$('#idCheckMessage').html('사용 가능한 아이디입니다.');
			}else{
				$('#idCheckMessage').html('아이디 중복:사용 불가능한 아이디입니다.');
			}
		} 
	})
}
```

* * *

4. 비밀번호 일치 여부 검사
- 소스 위치 : src/main/webapp/WEB_INF/views/user/userJoin
- 페이지 리로드 없이 처리하기 위해 Ajax 사용
```javscript
function passwordCheckFunction(){
	var p1 = $('#userPassword').val();		
	var p2 = $('#userPassword2').val();
	
	if(p1 != p2){
		$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
	}else{
		$('#passwordCheckMessage').html('');
	}
}
```

5. 신고내역 처리 - 관리자
- 소스 위치 : src/main/webapp/WEB_INF/views/admin/reportView
- 신고내역 처리 페이지를 별도로 만들지 않고 처리하기 위해 Ajax 사용
```javascript
<script type="text/javascript">

// '사용자 신고 접수' → '접수 완료' 상태 변경 처리
function acceptFunction(){
	$.ajax({
		type: 'POST',
		url: 'reportAccept.le',
		data: {reportID : $('#accept').val()},
		success: function(acceptResult){
			console.log(acceptResult);
			if(acceptResult == 1){
				alert('신고 접수 처리 성공');
				location.href='reportView.le?reportID='+${reportContent.reportID};
			}else{
				alert('신고 접수 처리 실패');
				history.go(-1);
			}
		}
	});
	return
}

// '접수 완료' → '처리 완료' 상태 변경 처리
function successFunction(){
	$.ajax({
		type: 'POST',
		url: 'reportSuccess.le',
		data: {reportID : $('#success').val()},
		success: function(successResult){
			console.log(successResult);
			if(successResult == 1){
				alert('신고 처리 완료');
				location.href='reportView.le?reportID='+${reportContent.reportID};
			}else{
				alert('신고 처리 실패');
				history.go(-1);
			}
		}
	});
	return
}
</script>
```
* * *
5. 게시판 댓글
- 테이블의 구조는 위의 ERD에서 확인 가능
- 댓글의 경우 Ajax를 사용하기 때문에 @RestController 사용

- 댓글 컨트롤러
- 소스 위치 : src/main/java/com.hpro.controller/ReplyController
```java

package com.hpro.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hpro.dto.ReplyDTO;
import com.hpro.service.BoardService;

@RestController
public class ReplyController {

	// 로그
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService boardService;
	
	// 댓글 작성
	@RequestMapping(value="insertReply.le", method=RequestMethod.POST)
	public Map<String, Object> insertReply(@RequestBody ReplyDTO replyDTO) throws Exception{
		Map<String, Object> result = new HashMap<>();
		try {
			boardService.insertReply(replyDTO);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	// 댓글 삭제
	@RequestMapping(value="deleteReply.le", method=RequestMethod.POST)
	public int deleteReply(@RequestParam("replyID")int replyID) throws Exception{
		int result = boardService.deleteReply(replyID);
		return result;
	}
}
```

- 댓글 저장 및 삭제 처리
- 소스위치 : src/main/webapp/WEB_INF/views/board/boardView
- 페이지 리로드없이 처리하기 위해 Ajax를 사용

```javascript
// 댓글 저장
function insertReplyFunction(){
	var replyContext = $('#replyContext').val();
	var userID = $('#userID').val();
	var paramData = JSON.stringify({"replyContext" : replyContext, "userID" : userID, "boardID" : ${boardDTO.boardID} });
	var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
	
	$.ajax({
		url: 'insertReply.le',
		headers: headers,
		data: paramData,
		type: 'POST',
		dataType: 'text',
		success: function(result){
			console.log("댓글 작성 성공:"+result);
			alert("댓글 작성 성공");
			location.href="boardView.le?boardID="+${boardDTO.boardID};
		},
		error: function(error){
			console.log("에러 : "+error);
		}
	});
}
// 댓글 삭제
function deleteReplyFunction(replyID){
	var paramData = {"replyID":replyID};
	
	$.ajax({
		url: 'deleteReply.le',
		data: paramData,
		type: 'POST',
		dataType: 'text',
		success:function(result){
			console.log("댓글 삭제 성공 :"+result);
			alert("댓글이 삭제 되었습니다.");
			location.href="boardView.le?boardID="+${boardDTO.boardID};
		},
		error:function(error){
			console.log("에러: "+error);
			alert("댓글 삭제 에러 발생");
			history.go(-1);
		}
		
	});
}
```
- 댓글 작성 폼 및 댓글 목록 
- 소스위치 : src/main/webapp/WEB_INF/views/board/boardView
- 댓글 작성 폼의 경우 세션 정보가 있을 때만 나타나게 구현
- 작성한 댓글은 세션 정보의 사용자ID와 댓글의 사용자가ID가 일치하는 경우 '삭제'버튼을 생성해서 삭제 가능하게 함
```java
<!-- 댓글 작성 폼 -->
<c:if test="${sessionScope.userInfo != null}">
	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
		<form name="replyForm" id="replyForm" role="form" method="post">
			<!-- 게시글 번호, 페이지 및 검색 정보 hidden으로 넘겨줌  -->
			<input type="hidden" id="boardID" name="boardID" value="${boardDTO.boardID}"/> 
			<input type="hidden" id="page" name="page" value="${search.page}" /> 
			<input type="hidden" id="range" name="range" value="${search.range}" /> 
			<input type="hidden" id="searchType" name="searchType" value="${search.searchType}" />
			<input type="hidden" id="keyword" name="keyword" value="${search.keyword}"/>
			<div class="row">
				<div class="col-sm-10">
					<textarea id="replyContext" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>
				</div>
				<div class="col-sm-2">
					<input class="form-control" id="userID" placeholder="댓글 작성자" value="${sessionScope.userInfo.userID}"/>
					<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" Onclick="insertReplyFunction();" style="width: 100%; margin-top: 10px"> 저 장 </button>
				</div>
			</div>
		</form>
	</div>
</c:if>
<!-- 댓글 목록 -->
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
	<h6 class="border-bottom pb-2 mb-3">댓글 목록</h6>
	<div id="replyList">
		<!-- 댓글 목록이 있을 경우에만 출력  -->
		<c:forEach items="${replyList}" var="replyList">
			<li style="list-style:none;">
				<p id="replyInfo">
				<b>${replyList.userID}</b>&nbsp;
				<small><fmt:formatDate value="${replyList.replyRegdate}" pattern="yyyy-MM-dd"/></small>&nbsp;&nbsp;
				<!-- 공유된 세션의 userID와 댓글 작성자 userID가 일치하는 경우 '삭제'가능  -->
				<c:if test="${sessionScope.userInfo.userID eq replyList.userID}">
					<small><a onClick="deleteReplyFunction(${replyList.replyID});" style="text-decoraion:none; color:blue;">삭제</a></small>
				</c:if>
				</p>
				<hr>
				<p id="replyContext">${replyList.replyContext}</p>
			</li>
		</c:forEach>
	</div>
</div>
```
* * *

##### 참고한 사이트
[프로젝트 주제](https://www.youtube.com/playlist?list=PLRx0vPvlEmdAdWCQeUPnyMZ4PsW3dGuFB "프로젝트 주제")   
[게시판 댓글 관련 내용](https://freehoon.tistory.com/115?category=735500 "게시판 댓글 관련 내용")   
[template](https://startbootstrap.com/themes/sb-admin-2/ "index template")   
[template](https://startbootstrap.com/themes/resume/ "login, join, userUpdate template")   
