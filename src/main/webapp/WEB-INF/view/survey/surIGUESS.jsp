<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
 <%@ include file="../common/heading.jsp" %>
  <!-- 설문 항목에 대한 값을 구한 뒤, result에 넣어준다. -->
  <script type="text/javascript">
//다듬어진 첫번째 테스트 내용 예시  
	function getScores() {
		const result = {};
		const surveys = document.querySelectorAll('.survey');
		let totalScore = 0;
		// 전체 응답 여부
		let allAnswered = true; 
		surveys.forEach((survey, index) => {
			const sName = 's' + (index + 1);
			const sNodeList = survey.querySelectorAll('input[name="' + sName + '"]:checked');
			// 항목 전체 응답 여부
			if (sNodeList.length === 0) { 
				allAnswered = false;
			} else {
			let sScore = 0;
			sNodeList.forEach((node) => {
				sScore += parseInt(node.value);
				});
				totalScore += sScore;
			}
		});
		//항목 전체를 누르지않으면 진행되지 않는 알림창 이벤트 내용
		if (!allAnswered) { 
			alert("모든 항목에 응답해주세요.");
			return;
		}
		//결과
		let message = "";
		if (totalScore >= 0 && totalScore <= 9) {
			message = "당신의 점수는 " + totalScore + "점으로, 인터넷게임 사용 관련 장애가 있을 가능성이 낮습니다. 계속해서 건강한 습관을 영위해보세요!";
		} else {
			message = "당신의 점수는 " + totalScore + "점으로, 인터넷게임 사용 관련 장애가 있을 가능성이 있습니다. 추가적인 검사를 통해 인터넷게임 사용관련 장애가 있는지 확인해보시는 것을 추천합니다.";
		}
		document.getElementById('result').innerText = message;
	}
</script>
</head>

<body style="margin-bottom:100px">
	<div class="container-fluid" id="inFrame">
	<%@ include file="../common/aside.jsp" %>
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>자가진단 테스트</h2><a href="/goodM/survey/surList" class="button big">목록으로 돌아가기</a>
		<!-- 테스트 제목 -->
		<h3>-정신건강 자가진단-</h3>	
		<!-- 테스트 내용 -->
		<p>지난 12개월 동안, 인터넷게임과 관련하여 아래의 증상을 얼마나 경험하였습니까?    
		</p>

    <!-- 항목 시작(value 숫자 순서대로) -->
	    <table class="table">
		<tr>
			<th>항목</th>
			<th>전혀 아님</th>
			<th>가끔</th>
			<th>자주</th>
			<th>항상</th>
		</tr>
		 <tr class="survey">
		 	<td>1. 이전에 했던 인터넷게임에 대해 계속 생각하거나, 인터넷 게임을 할 생각에 몰두했다.</td>
		    <td><input type="radio" name="s1" value="0"></td>
		    <td><input type="radio" name="s1" value="1"></td>
		    <td><input type="radio" name="s1" value="2"></td>
		    <td><input type="radio" name="s1" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>2. 인터넷게임을 하지 않을때에는 초조하거나 불안하거나 슬프다.</td>
		    <td><input type="radio" name="s2" value="0"></td>
		    <td><input type="radio" name="s2" value="1"></td>
		    <td><input type="radio" name="s2" value="2"></td>
		    <td><input type="radio" name="s2" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>3. 인터넷에 쓰는 시간이 점점 길어진다.</td>
		    <td><input type="radio" name="s3" value="0"></td>
		    <td><input type="radio" name="s3" value="1"></td>
		    <td><input type="radio" name="s3" value="2"></td>
		    <td><input type="radio" name="s3" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>4. 인터넷게임을 하는 것을 조절하려고 해보았지만 성공하지 못했다.</td>
		    <td><input type="radio" name="s4" value="0"></td>
		    <td><input type="radio" name="s4" value="1"></td>
		    <td><input type="radio" name="s4" value="2"></td>
		    <td><input type="radio" name="s4" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>5. 인터넷게임으로 인해 예전의 다른 취미 생활이나 오락 활동에 대한 흥미가 줄어들었다.</td>
		    <td><input type="radio" name="s5" value="0"></td>
		    <td><input type="radio" name="s5" value="1"></td>
		    <td><input type="radio" name="s5" value="2"></td>
		    <td><input type="radio" name="s5" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>6. 사회적, 심리적 문제에도 불구하고 계속해서 인터넷게임을 과하게 한다.</td>
		    <td><input type="radio" name="s6" value="0"></td>
		    <td><input type="radio" name="s6" value="1"></td>
		    <td><input type="radio" name="s6" value="2"></td>
		    <td><input type="radio" name="s6" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>7. 가족이나 치료자, 또는 그 외의 사람에게 인터넷게임을 하는 데 사용한 시간을 속인 적이 있다.</td>
		    <td><input type="radio" name="s7" value="0"></td>
		    <td><input type="radio" name="s7" value="1"></td>
		    <td><input type="radio" name="s7" value="2"></td>
		    <td><input type="radio" name="s7" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>8. 부정적인 감정을 해소하거나 회피하기 위해 인터넷게임을 한다.</td>
		    <td><input type="radio" name="s8" value="0"></td>
		    <td><input type="radio" name="s8" value="1"></td>
		    <td><input type="radio" name="s8" value="2"></td>
		    <td><input type="radio" name="s8" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>9. 과도한 인터넷게임으로 인해 중요한 인간관계, 일, 교육이나 경력상의 기회를 위태롭게 하거나 잃은 적이 있다.</td>
		    <td><input type="radio" name="s9" value="0"></td>
		    <td><input type="radio" name="s9" value="1"></td>
		    <td><input type="radio" name="s9" value="2"></td>
		    <td><input type="radio" name="s9" value="3"></td>
		</tr>
    </table>
	<br>
		<button onclick="getScores()" class="btn btn-primary">결과 확인하기</button>
		<br>
		<br>
		<div id="surRes">
			<p id="result"></p>
		</div>
		<hr>
		<div id="source">
			<ol>
				<li>
					조선진, 이해국, 임현우, 조근호, 최삼욱, 오홍석. 중독 선별검사 도구 및 사용지침 개발. 2013, 가톨릭대학교, 한국건강증진재단.
				</li>
			</ol>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>