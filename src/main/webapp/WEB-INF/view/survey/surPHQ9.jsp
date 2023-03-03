<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="../common/top.jsp" %>
  <%@ include file="../common/heading.jsp" %>
  <!-- 설문 항목에 대한 값을 구한 뒤, result에 넣어준다. -->
  <script type="text/javascript">
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
		if (totalScore >= 0 && totalScore <= 4) {
			message = "당신의 점수는 " + totalScore + "점으로, '우울 아님'으로 분류되었습니다. 유의미한 우울감이 시사되지 않습니다.";
		} else if (totalScore >= 5 && totalScore <= 9) {
			message = "당신의 점수는 " + totalScore + "점으로, '가벼운 우울'으로 분류되었습니다."
			+ "다소 경미한 수준의 우울감이 있으나 일상생활에 지장을 줄 정도는 아닙니다. 다만, 이러한 기분상태가 지속될 경우 개인의 신체적, 심리적 대처자원을 저하시킬 수 있습니다. 그러한 경우, 가까운 지역센터나 전문기관을 방문하시기 바랍니다.";
		} else if (totalScore >= 10 && totalScore <= 19) {
			message = "당신의 점수는 " + totalScore + "점으로, '중간 정도의 우울'으로 분류되었습니다."
			+ "이러한 수준의 우울감은 흔히 신체적, 심리적 대처자원을 저하시키며 개인의 일상생활을 어렵게 만들기도 합니다. 가까운 지역센터나 전문기관을 방문하여 보다 상세한 평가와 도움을 받아보시기 바랍니다.";
		} else {
			message = "당신의 점수는 " + totalScore + "점으로, '심한 우울'으로 분류되었습니다. 전문기관의 치료적 개입과 평가가 요구됩니다.";
		}
		document.getElementById('result').innerText = message;
	}
</script>
</head>

<body>
	<div class="container-fluid" id="inFrame">
	<%@ include file="../common/aside.jsp" %>
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>자가진단 테스트</h2><a href="/goodM/survey/surList" class="button big">목록으로 돌아가기</a>
		<!-- 테스트 제목 -->
		<h3>-우울증 건강설문(PHQ-9)-</h3>	
		<!-- 테스트 내용 -->
		<p>지난 2주간, 얼마나 자주 다음과 같은 문제들로 곤란을 겪으셨습니까?<br>
	   		지난 2주 동안 아래와 같은 생각을 한 날을 헤아려서 해당하는 숫자에 표시하세요.    
		</p>
		<p id="source">
			※ 1번과 2번 질문에서 2점이나 3점을 받은 경우, 우울증에 부합되므로 설문을 진행해주세요.<br>
			 그렇지 않다면 유의한 수준의 우울감으로 시사되지 않는 점 참고 부탁 드립니다.
		</p>
		<!-- 항목 시작 -->
	    <table class="table">
		<tr>
			<th>항목</th>
			<th>없음</th>
			<th>2-6일</th>
			<th>7-12일</th>
			<th>거의 매일</th>
		</tr>
		 <tr class="survey">
		    <td >1. 기분이 가라앉거나, 우울하거나, 희망이 없다고 느꼈다.</td>
		    <td><input type="radio" name="s1" value="0"></td>
		    <td><input type="radio" name="s1" value="1"></td>
		    <td><input type="radio" name="s1" value="2"></td>
		    <td><input type="radio" name="s1" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>2. 평소 하던 일에 대한 흥미가 없어지거나 즐거움을 느끼지 못했다.</td>
		    <td><input type="radio" name="s2" value="0"></td>
		    <td><input type="radio" name="s2" value="1"></td>
		    <td><input type="radio" name="s2" value="2"></td>
		    <td><input type="radio" name="s2" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>3. 잠들기가 어렵거나 자주 깼다 / 혹은 너무 많이 잤다.</td>
		    <td><input type="radio" name="s3" value="0"></td>
		    <td><input type="radio" name="s3" value="1"></td>
		    <td><input type="radio" name="s3" value="2"></td>
		    <td><input type="radio" name="s3" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>4. 평소보다 식욕이 줄었다 / 혹은 평소보다 많이 먹었다.</td>
		    <td><input type="radio" name="s4" value="0"></td>
		    <td><input type="radio" name="s4" value="1"></td>
		    <td><input type="radio" name="s4" value="2"></td>
		    <td><input type="radio" name="s4" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>5. 다른 사람들이 눈치 챌 정도로 평소보다 말과 행동이 느려졌다 / 혹은 너무 안절부절 못해서 가만히 앉아있을 수 없었다.</td>
		    <td><input type="radio" name="s5" value="0"></td>
		    <td><input type="radio" name="s5" value="1"></td>
		    <td><input type="radio" name="s5" value="2"></td>
		    <td><input type="radio" name="s5" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>6. 피곤하고 기운이 없었다.</td>
		    <td><input type="radio" name="s6" value="0"></td>
		    <td><input type="radio" name="s6" value="1"></td>
		    <td><input type="radio" name="s6" value="2"></td>
		    <td><input type="radio" name="s6" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>7. 내가 잘못 했거나, 실패했다는 생각이 들었다 / 혹은 자신과 가족을 실망시켰다고 생각했다.</td>
		    <td><input type="radio" name="s7" value="0"></td>
		    <td><input type="radio" name="s7" value="1"></td>
		    <td><input type="radio" name="s7" value="2"></td>
		    <td><input type="radio" name="s7" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>8. 신문을 읽거나 TV를 보는 것과 같은 일상적인 일에도 집중할 수가 없었다.</td>
		    <td><input type="radio" name="s8" value="0"></td>
		    <td><input type="radio" name="s8" value="1"></td>
		    <td><input type="radio" name="s8" value="2"></td>
		    <td><input type="radio" name="s8" value="3"></td>
		</tr>
		<tr class="survey">
		    <td>9. 차라리 죽는 것이 더 낫겠다고 생각했다 / 혹은 자해할 생각을 했다.</td>
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
					박승진·최혜라·최지혜·김건우·홍진표(2010). 한글판 우울증 선별도구(Patient Health Questionnaire-9, PHQ-9)의 신뢰도와 타당도. 대한불안의학회지 6, 119-24.
				</li>
			</ol>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>