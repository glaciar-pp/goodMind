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
    	let msg = '${msg}';
    	let url = '${url}';
    	
    	if('${confirm}') {
    		alertify.confirm(msg, function(e) {
    			if(e) {
    				alertify.success("확인")
    				location.href = "/goodM/admin/restoreRequest";
    			} else {
    				alertify.error("취소")
    				location.href = "/goodM/user/login";
    			}
    		});
    	} else {
    		alertify.alert(msg, function() {
                alertify.message('OK');
                location.href = url;
            });	
    	}
    </script> 
</body>
</html>