<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
    <style>
        th, td { text-align: center; }
    </style>
</head>

<body style="height: 2000px">
    <%@ include file="../common/top.jsp" %>
    <div class="container-fluid" style="margin-top: 80px;">
		<div class="row">
			<div class="col-3" id="TCsoft">
				<img alt="기분어때 로고" src="/img/logo.png" style="height:80px; margin: 30px">
			</div>
			<div class="col-8">           
            <!-- =================== main =================== -->
            <form action="/goodM/home" method="post">
			<h1>만나서 반가워요!</h1>
			<br><br>
			<p>
				발전해가는 사회 속 우리는 꾸준히 성장해가고 있습니다.
				건강에 대한 관심도 높아지고 있지만, 상대적으로 마음의 건강에 대해서는 아직 부족한 실정입니다.
				좋아졌다고는 하지만 아직 편견어린 시선이나, 망설임, 방문시간 지정의 어려움 등으로 인해 안타깝게도 문앞까지 와서도 돌아서는 분들이 있죠.
			</p>
			<br><br><br>
			<p>
				이러한 상황에 도움이 되기 위해 '기분 어때'라는 서비스를
				생각하게 되었습니다.
				내 주변의 병원과 센터 찾는걸 도와드릴게요!

				직접 방문하는게 어렵다면 유선번호를 통한 상담이 가능한 센터도 있으니 도움이 필요하다면 연락해볼 수 있어요.
			</p>
			
			<p>
				자가검진도 해볼 수 있어요!
				그날 그날 기분이 어땠는지 기록도 남길 수 있어요.
				기분이 좋을 때도, 좋지 않을 때도 기분어때에 오셔서 힐링해보세요.
			</p>
			
			<h1>오늘, 기분 어때?</h1>
			<img class="float-end" src="/img/home_bg.svg">
            <!-- =================== main =================== -->
            </form>
        </div>
    </div>
    	</div>
    <%@ include file="../common/bottom.jsp" %>
</body>
</html>