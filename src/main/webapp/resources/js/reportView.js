/**
 * 사용자가 게시글 신고 후 신고 접수 처리 및 처리 완료를 담당하는 js파일
 */

function acceptFunction(){
	$.ajax({
		type: 'POST',
		url: 'reportAccept.le',
		data: {reportID : $('#accept').val()},
		success: function(acceptResult){
			console.log(acceptResult);
			if(acceptResult == 1){
				alert('신고 접수 처리 성공');
				location.href='reportAdmin.le';
			}else{
				alert('신고 접수 처리 실패');
				history.go(-1);
			}
		}
	});
	return
}

function successFunction(){
	$.ajax({
		type: 'POST',
		url: 'reportSuccess.le',
		data: {reportID : $('#success').val()},
		success: function(successResult){
			console.log(successResult);
			if(successResult == 1){
				alert('신고 처리 완료');
				location.href='reportAdmin.le';
			}else{
				alert('신고 처리 실패');
				history.go(-1);
			}
		}
	});
	return
}