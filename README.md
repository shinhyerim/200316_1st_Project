
## :house: 자기PR 및 강의평가 사이트

![Hportfolio](https://user-images.githubusercontent.com/60491863/80310835-add0f780-8817-11ea-9d10-ab30332c3359.gif)


### :paperclip: 프로젝트 구성
- 본인에 대한 간단한 소개
- 강의평가 사이트(PORFOLIO에서 링크로 연결)

### :date: 개발 기간
- 2020.03.16.~2020.04.08.

### :computer: 개발 환경
- OS : Windows
- Server : Apache Tomcat 9.0
- Tool : STS · MySQL 5.7 Command Line Client
- Language : JAVA · JSP · JavaScript(JQuery · Ajax)
- Framework : Spring Framework · MyBatis · Bootstrap

### :open_file_folder: ERD
![그림1](https://user-images.githubusercontent.com/60491863/80311762-82044080-881c-11ea-8ae5-5d8d412bcfc8.png)


### :pushpin: 기능 서술

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
3. 신고내역 처리 - 관리자
- 소스 위치 : src/main/webapp/WEB_INF/views/admin/reportView
- 신고내역 처리 페이지를 별도로 만들지 않고 처리하기 위해 ajax 사용
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
