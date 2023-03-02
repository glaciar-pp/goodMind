<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알림 메세지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
</head>
<body>
    <script>
		var msg = '${msg}';
		var noneUid = ${noneUid ? noneUid : false};
		var wrongPwd = ${wrongPwd ? wrongPwd : false};
		var wrongUid = ${wrongUid ? wrongUid : false};
		var correctRequest = ${correctRequest ? correctRequest : false};
		
		if (noneUid) {
			alertify.alert(msg, function() {
				alertify.message('ID를 확인해주세요.');
				location.href='/goodM/admin/restoreRequest';
			});
		} else if (wrongPwd) {
			alertify.alert(msg, function() {
				alertify.message('비밀번호를 확인해주세요.');
				location.href='/goodM/admin/restoreRequest';
			});
		} else if (wrongUid) {
			alertify.alert(msg, function() {
				alertify.message('탈퇴한 회원이 아닙니다.');
				location.href='/goodM/admin/restoreRequest';
			});
		} else if (correctRequest) {
			alertify.alert(msg, function() {
				alertify.message('복원 요청 되었습니다. 소요시간이 며칠 걸릴 수 있습니다.');
				location.href='/goodM/user/login';
			});
		}
    </script> 
</body>
</html>