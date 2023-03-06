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
			message = "당신의 점수는 " + totalScore + "점으로, 불안이 시사되지 않습니다.";
		} else {
			message = "당신의 점수는 " + totalScore + "점으로, 불안이 시사됩니다. 주의가 필요합니다.";
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
		<h2>자가진단 테스트&ensp;<a href="/goodM/survey/surList" class="button big">목록으로 돌아가기</a></h2>
		<!-- 테스트 제목 -->
		<br>
		<h3 style="text-align: center; margin: 40px">-불안장애 척도(GAD-7)-</h3>	
		<!-- 테스트 내용 -->
		<p>: 지난 2주 동안 당신은 다음의 문제들로 인해서 얼마나 자주 방해를 받았습니까?
		</p>
    	<!-- 항목 시작(value 숫자 순서대로) -->
	    <table class="table">
		<tr style="background-color: #ccccff; vertical-align: middle;">
			<th class="col-4">항목</th>
			<th class="col-2">전혀 방해받지 않음</th>
			<th class="col-2">며칠 동안 방해 받음</th>
			<th class="col-2">2주 중 절반 이상 방해 받음</th>
			<th class="col-2">거의 매일 방해 받음</th>
		</tr>
		 <tr class="survey">
		    <td style="text-align: left;">1. 초조하거나 불안하거나 조마조마하게 느낀다.</td>
		    <td><input type="radio" name="s1" value="0"></td>
		    <td><input type="radio" name="s1" value="1"></td>
		    <td><input type="radio" name="s1" value="2"></td>
		    <td><input type="radio" name="s1" value="3"></td>
		</tr>
		<tr class="survey">
		    <td style="text-align: left;">2. 걱정하는 것을 멈추거나 조절할 수가 없다.</td>
		    <td><input type="radio" name="s2" value="0"></td>
		    <td><input type="radio" name="s2" value="1"></td>
		    <td><input type="radio" name="s2" value="2"></td>
		    <td><input type="radio" name="s2" value="3"></td>
		</tr>
		<tr class="survey">
		    <td style="text-align: left;">3. 여러 가지 것들에 대해 걱정을 너무 많이 한다.</td>
		    <td><input type="radio" name="s3" value="0"></td>
		    <td><input type="radio" name="s3" value="1"></td>
		    <td><input type="radio" name="s3" value="2"></td>
		    <td><input type="radio" name="s3" value="3"></td>
		</tr>
		<tr class="survey">
		    <td style="text-align: left;">4. 편하게 있기가 어렵다.</td>
		    <td><input type="radio" name="s4" value="0"></td>
		    <td><input type="radio" name="s4" value="1"></td>
		    <td><input type="radio" name="s4" value="2"></td>
		    <td><input type="radio" name="s4" value="3"></td>
		</tr>
		<tr class="survey">
		    <td style="text-align: left;">5. 너무 안절부절 못해서 가만히 있기가 힘들다.</td>
		    <td><input type="radio" name="s5" value="0"></td>
		    <td><input type="radio" name="s5" value="1"></td>
		    <td><input type="radio" name="s5" value="2"></td>
		    <td><input type="radio" name="s5" value="3"></td>
		</tr>
		<tr class="survey">
		    <td style="text-align: left;">6. 쉽게 짜증이 나거나 쉽게 성을 내게 된다.</td>
		    <td><input type="radio" name="s6" value="0"></td>
		    <td><input type="radio" name="s6" value="1"></td>
		    <td><input type="radio" name="s6" value="2"></td>
		    <td><input type="radio" name="s6" value="3"></td>
		</tr>
		<tr class="survey">
		    <td style="text-align: left;">7. 마치 끔찍한 일이 생길 것처럼 두렵게 느껴진다.</td>
		    <td><input type="radio" name="s7" value="0"></td>
		    <td><input type="radio" name="s7" value="1"></td>
		    <td><input type="radio" name="s7" value="2"></td>
		    <td><input type="radio" name="s7" value="3"></td>
		</tr>
    </table>
	<p id="source">
		※ 모든 척도는 증상의 정도, 성향을 파악하는 도구일 뿐입니다.
	</p>
	<br>
		<button onclick="getScores()" class="btn btn-lavender" style="display: block; margin: auto;">결과 확인하기</button>
		<br>
		<br>
		<div id="surRes">
			<p id="result"></p>
		</div>
		<hr>
		<div id="source">
			<ol>
				<li>
					 Spitzer RL, Kroenke K, Williams JB, et al.(2006). A brief measure for assessing generalized anxiety disorder: the GAD-7, Arch Intern Med 166, 1092–7
				</li>
				<li>
					www.phqscreeners.com
				</li>
			</ol>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>