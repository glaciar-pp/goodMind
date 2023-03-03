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
		if (totalScore >= 1 && totalScore <= 18) {
			message = "당신의 점수는 " + totalScore + "점으로, '매우 낮음'으로 분류되었습니다. 스스로를 무가치하고 볼품없는 사람으로 여기며 자존감이 매우 낮은 수준으로 나타납니다.\n"
			+ "이러한 양상은 우울이나 기타 극심한 스트레스 사건과 같은 정서적, 상황적 요인들과 밀접한 관련이 있습니다. 이에 대한 탐색이 필히 병행되어야 할 것으로 보입니다.";
		} else if (totalScore >= 19 && totalScore <= 24) {
			message = "당신의 점수는 " + totalScore + "점으로, '낮음'으로 분류되었습니다. 스스로를 무가치하고 볼품없다고 여기며 자존감이 다소 낮은 수준으로 나타납니다.\n" 
			+ "이러한 수준의 우울감은 흔히 신체적, 심리적 대처자원을 저하시키며 개인의 일상생활을 어렵게 만들기도 합니다. 가까운 지역센터나 전문기관을 방문하여 보다 상세한 평가와 도움을 받아보시기 바랍니다.";
		} else if (totalScore >= 25 && totalScore <= 38) {
			message = "당신의 점수는 " + totalScore + "점으로, '보통'으로 분류되었습니다."
			+ "보통 수준의 자존감이 나타납니다.";
		}else if (totalScore >= 39 && totalScore <= 44) {
			message = "당신의 점수는 " + totalScore + "점으로, '높음'으로 분류되었습니다."
			+ "자신을 수용하고 존중하며 자존감이 다소 높은 수준으로 나타납니다.";
		}else {
			message = "당신의 점수는 " + totalScore + "점으로, '매우 높음'으로 분류되었습니다. 자신을 수용하고 존중하며, 스스로를 가치있다고 여기는 등, 자존감이 매우 높은 수준으로 나타납니다.";
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
		<h3>-자아존중감척도(RSES)-</h3>	
		<!-- 테스트 내용 -->
		<p>다음의 각 문항들을 읽고 최근 일주일 동안 자신에게 가장 적합하다고 생각되는 곳에 표기해 주십시오.  
		</p>
		<!-- 항목 시작(value 숫자 역순) -->
	    <table class="table">
		<tr>
			<th>항목</th>
			<th>매우 그렇지 않다</th>
			<th>대체로 그렇지 않다</th>
			<th>보통이다</th>
			<th>대체로 그렇다</th>
			<th>항상 그렇다</th>
		</tr>
		 <tr class="survey">
			    <td >1. 나는 남들만큼 가치있는 사람이다.</td>
			    <td><input type="radio" name="s1" value="1"></td>
			    <td><input type="radio" name="s1" value="2"></td>
			    <td><input type="radio" name="s1" value="3"></td>
			    <td><input type="radio" name="s1" value="4"></td>
			    <td><input type="radio" name="s1" value="5"></td>
			</tr>
			<tr class="survey">
			    <td>2. 나에게는 좋은 점이 많이 있다.</td>
			    <td><input type="radio" name="s2" value="1"></td>
			    <td><input type="radio" name="s2" value="2"></td>
			    <td><input type="radio" name="s2" value="3"></td>
			    <td><input type="radio" name="s2" value="4"></td>
			    <td><input type="radio" name="s2" value="5"></td>
			</tr>
			<tr class="survey">
			    <td>3. 대체로 봐서 나는 실패자이다.</td>
			    <td><input type="radio" name="s3" value="5"></td>
			    <td><input type="radio" name="s3" value="4"></td>
			    <td><input type="radio" name="s3" value="3"></td>
			    <td><input type="radio" name="s3" value="2"></td>
			    <td><input type="radio" name="s3" value="1"></td>
			</tr>
			<tr class="survey">
			    <td>4. 나는 남들만큼 일을 해낼 수 있다.</td>
			    <td><input type="radio" name="s4" value="1"></td>
			    <td><input type="radio" name="s4" value="2"></td>
			    <td><input type="radio" name="s4" value="3"></td>
			    <td><input type="radio" name="s4" value="4"></td>
			    <td><input type="radio" name="s4" value="5"></td>
			</tr>
			<tr class="survey">
			    <td>5. 내게는 자랑으로 여길만한 것이 별로 없다.</td>
			    <td><input type="radio" name="s5" value="5"></td>
			    <td><input type="radio" name="s5" value="4"></td>
			    <td><input type="radio" name="s5" value="3"></td>
			    <td><input type="radio" name="s5" value="2"></td>
			    <td><input type="radio" name="s5" value="1"></td>
			</tr>
			<tr class="survey">
			    <td>6. 나는 나 자신에 대해 괜찮게 생각한다.</td>
			    <td><input type="radio" name="s6" value="1"></td>
			    <td><input type="radio" name="s6" value="2"></td>
			    <td><input type="radio" name="s6" value="3"></td>
			    <td><input type="radio" name="s6" value="4"></td>
			    <td><input type="radio" name="s6" value="5"></td>
			</tr>
			<tr class="survey">
			    <td>7. 대체로 나는 나를 만족스럽게 생각한다.</td>
			    <td><input type="radio" name="s7" value="1"></td>
			    <td><input type="radio" name="s7" value="2"></td>
			    <td><input type="radio" name="s7" value="3"></td>
			    <td><input type="radio" name="s7" value="4"></td>
			    <td><input type="radio" name="s7" value="5"></td>
			</tr>
			<tr class="survey">
			    <td>8. 나는 자존심이 좀더 있었으면 좋겠다.</td>
			    <td><input type="radio" name="s8" value="5"></td>
			    <td><input type="radio" name="s8" value="4"></td>
			    <td><input type="radio" name="s8" value="3"></td>
			    <td><input type="radio" name="s8" value="2"></td>
			    <td><input type="radio" name="s8" value="1"></td>
			</tr>
			<tr class="survey">
			    <td>9. 나는 정말 가치없는 사람으로 생각될 때가 있다.</td>
			    <td><input type="radio" name="s9" value="5"></td>
			    <td><input type="radio" name="s9" value="4"></td>
			    <td><input type="radio" name="s9" value="3"></td>
			    <td><input type="radio" name="s9" value="2"></td>
			    <td><input type="radio" name="s9" value="1"></td>
			</tr>
			<tr class="survey">
			    <td>10. 나는 내가 좋은 점이 하나도 없다고 생각될 때가 있다.</td>
			    <td><input type="radio" name="s10" value="4"></td>
			    <td><input type="radio" name="s10" value="3"></td>
			    <td><input type="radio" name="s10" value="2"></td>
			    <td><input type="radio" name="s10" value="1"></td>
			    <td><input type="radio" name="s10" value="0"></td>
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
					 Rosenberg, M. (1965). 「Society and the adolescent self-image.Rev.ed. Princeton, NJ: Princeton University Press.
				</li>
			</ol>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>