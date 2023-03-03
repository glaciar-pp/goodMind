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
		if (totalScore >= 0 && totalScore <= 40) {
			message = "당신의 점수는 " + totalScore + "점 입니다. \n"
			+ "※ 진단을 목적으로하는 설문이 아니기에 점수 구분은 하지 않습니다.\n   점수가 높을수록 지각된 스트레스 정도가 심함을 의미합니다.";
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
		<h3>-스트레스 척도(PSS)-</h3>	
		<!-- 테스트 내용 -->
		<p>다음 문항들은 최근 1개월 동안 당신이 느끼고 생각한 것에 대한 것입니다.<br> 
		각 문항의 내용을 얼마나 자주 느꼈는지 ○로 표시해주시기 바랍니다.    
		</p>
		<!-- 항목 시작(value 숫자 역순) -->
	    <table class="table">
		<tr>
			<th>항목</th>
			<th>전혀 없음</th>
			<th>거의 없음</th>
			<th>때때로 있음</th>
			<th>자주 있음</th>
			<th>매우 자주</th>
		</tr>
		 <tr class="survey">
		    <td >1. 최근 1개월 동안, 예상치 못했던 일 때문에 당황했던 적이 얼마나 있었습니까?</td>
		    <td><input type="radio" name="s1" value="0"></td>
		    <td><input type="radio" name="s1" value="1"></td>
		    <td><input type="radio" name="s1" value="2"></td>
		    <td><input type="radio" name="s1" value="3"></td>
		    <td><input type="radio" name="s1" value="4"></td>
		</tr>
		<tr class="survey">
		    <td>2. 최근 1개월 동안, 인생에서 중요한 일들을 조절할 수 없다는 느낌을 얼마나 경험하였습니까?</td>
		    <td><input type="radio" name="s2" value="0"></td>
		    <td><input type="radio" name="s2" value="1"></td>
		    <td><input type="radio" name="s2" value="2"></td>
		    <td><input type="radio" name="s2" value="3"></td>
		    <td><input type="radio" name="s2" value="4"></td>
		</tr>
		<tr class="survey">
		    <td>3. 최근 1개월 동안, 신경이 예민해지고 스트레스를 받고 있다는 느낌을 얼마나 경험하였습니까?</td>
		    <td><input type="radio" name="s3" value="0"></td>
		    <td><input type="radio" name="s3" value="1"></td>
		    <td><input type="radio" name="s3" value="2"></td>
		    <td><input type="radio" name="s3" value="3"></td>
		    <td><input type="radio" name="s3" value="4"></td>
		</tr>
		<tr class="survey">
		    <td>4. 최근 1개월 동안, 당신의 개인적 문제들을 다루는데 있어서 얼마나 자주 자신감을 느끼셨습니까?</td>
		    <td><input type="radio" name="s4" value="4"></td>
		    <td><input type="radio" name="s4" value="3"></td>
		    <td><input type="radio" name="s4" value="2"></td>
		    <td><input type="radio" name="s4" value="1"></td>
		    <td><input type="radio" name="s4" value="0"></td>
		</tr>
		<tr class="survey">
		    <td>5. 최근 1개월 동안, 일상의 일들이 당신의 생각대로 진행되고 있다는 느낌을 얼마나 경험하였습니까?</td>
		    <td><input type="radio" name="s5" value="4"></td>
		    <td><input type="radio" name="s5" value="3"></td>
		    <td><input type="radio" name="s5" value="2"></td>
		    <td><input type="radio" name="s5" value="1"></td>
		    <td><input type="radio" name="s5" value="0"></td>
		</tr>
		<tr class="survey">
		    <td>6. 최근 1개월 동안, 당신이 꼭 해야하는 일을 처리할 수 없다고 생각한 적이 얼마나 있었습니까?</td>
		    <td><input type="radio" name="s6" value="0"></td>
		    <td><input type="radio" name="s6" value="1"></td>
		    <td><input type="radio" name="s6" value="2"></td>
		    <td><input type="radio" name="s6" value="3"></td>
		    <td><input type="radio" name="s6" value="4"></td>
		</tr>
		<tr class="survey">
		    <td>7. 최근 1개월 동안, 일상생활의 짜증을 얼마나 자주 잘 다스릴 수 있었습니까?</td>
		    <td><input type="radio" name="s7" value="4"></td>
		    <td><input type="radio" name="s7" value="3"></td>
		    <td><input type="radio" name="s7" value="2"></td>
		    <td><input type="radio" name="s7" value="1"></td>
		    <td><input type="radio" name="s7" value="0"></td>
		</tr>
		<tr class="survey">
		    <td>8. 최근 1개월 동안, 최상의 컨디션이라고 얼마나 자주 느끼셨습니까?</td>
		    <td><input type="radio" name="s8" value="4"></td>
		    <td><input type="radio" name="s8" value="3"></td>
		    <td><input type="radio" name="s8" value="2"></td>
		    <td><input type="radio" name="s8" value="1"></td>
		    <td><input type="radio" name="s8" value="0"></td>
		</tr>
		<tr class="survey">
		    <td>9. 최근 1개월 동안, 당신이 통제할 수 없는 일 때문에 화가 난 경험이 얼마나 있었습니까?</td>
		    <td><input type="radio" name="s9" value="0"></td>
		    <td><input type="radio" name="s9" value="1"></td>
		    <td><input type="radio" name="s9" value="2"></td>
		    <td><input type="radio" name="s9" value="3"></td>
		    <td><input type="radio" name="s9" value="4"></td>
		</tr>
		<tr class="survey">
		    <td>10. 최근 1개월 동안, 어려운 일들이 너무 많이 쌓여서 극복하지 못할 것 같은 느낌을 얼마나 자주 경험하셨습니까?</td>
		    <td><input type="radio" name="s10" value="0"></td>
		    <td><input type="radio" name="s10" value="1"></td>
		    <td><input type="radio" name="s10" value="2"></td>
		    <td><input type="radio" name="s10" value="3"></td>
		    <td><input type="radio" name="s10" value="3"></td>
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
					이종하, 신철민, 고영훈, 임재형, 조숙행, 김승현, 정인과, 한창수(2012). 한글판 스트레스 자각척도의 신뢰도와 타당도 연구. 정신신체의학 20(2), 127-134.
				</li>
			</ol>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>