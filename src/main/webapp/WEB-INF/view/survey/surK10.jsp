<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
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
			if (totalScore >= 0 && totalScore <= 12) {
				message = "당신의 점수는 " + totalScore + "점으로, 정신건강영역이 양호합니다.";
			} else {
				message = "당신의 점수는 " + totalScore + "점으로, 정신건강영역에 문제가 있을 수 있습니다.";
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
		<h4>-정신건강 자가진단-</h4>	
		<!-- 테스트 내용 -->
		<p>지난 1년 동안 귀하가 가장 우울 또는 불안했거나 스트레스가 가장 많았던 한달을 떠올려 보십시오.<br>
	    만약 그런 시기가 없었다면 지난 12개월 중 대표적인 달을 떠올려 주십시오.    
		</p>
		<!-- 항목 시작 -->
	    <table class="table">
			<tr>
				<th>항목</th>
				<th>한달내내</th>
				<th>한달 중 대부분</th>
				<th>한달 중 절반정도</th>
				<th>한달 중 며칠</th>
				<th>전혀 없었다</th>
			</tr>
			 <tr class="survey">
			    <td >1. 아무런 이유없이 기운이 없던 적이 얼마나 됩니까?</td>
			    <td><input type="radio" name="s1" value="4"></td>
			    <td><input type="radio" name="s1" value="3"></td>
			    <td><input type="radio" name="s1" value="2"></td>
			    <td><input type="radio" name="s1" value="1"></td>
			    <td><input type="radio" name="s1" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>2. 신경이 예민했던 날은 얼마나 됩니까?</td>
			    <td><input type="radio" name="s2" value="4"></td>
			    <td><input type="radio" name="s2" value="3"></td>
			    <td><input type="radio" name="s2" value="2"></td>
			    <td><input type="radio" name="s2" value="1"></td>
			    <td><input type="radio" name="s2" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>3. 신경이 너무 예민해서 귀하를 안정시킬 수 있는 것이 아무것도 없다고 느끼신 적이 얼마나 됩니까?</td>
			    <td><input type="radio" name="s3" value="4"></td>
			    <td><input type="radio" name="s3" value="3"></td>
			    <td><input type="radio" name="s3" value="2"></td>
			    <td><input type="radio" name="s3" value="1"></td>
			    <td><input type="radio" name="s3" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>4. 희망이 없다고 느끼신 적이 얼마나 됩니까?</td>
			    <td><input type="radio" name="s4" value="4"></td>
			    <td><input type="radio" name="s4" value="3"></td>
			    <td><input type="radio" name="s4" value="2"></td>
			    <td><input type="radio" name="s4" value="1"></td>
			    <td><input type="radio" name="s4" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>5. 안절부절 못하거나 조바심을 냈던 적은 얼마나 됩니까?</td>
			    <td><input type="radio" name="s5" value="4"></td>
			    <td><input type="radio" name="s5" value="3"></td>
			    <td><input type="radio" name="s5" value="2"></td>
			    <td><input type="radio" name="s5" value="1"></td>
			    <td><input type="radio" name="s5" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>6. 안절부절 못하거나 조바심을 내서 가만히 앉아있을 수 없다고 느끼신 적이 얼마나 됩니까?</td>
			    <td><input type="radio" name="s6" value="4"></td>
			    <td><input type="radio" name="s6" value="3"></td>
			    <td><input type="radio" name="s6" value="2"></td>
			    <td><input type="radio" name="s6" value="1"></td>
			    <td><input type="radio" name="s6" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>7. 우울했던 적이 얼마나 됩니까?</td>
			    <td><input type="radio" name="s7" value="4"></td>
			    <td><input type="radio" name="s7" value="3"></td>
			    <td><input type="radio" name="s7" value="2"></td>
			    <td><input type="radio" name="s7" value="1"></td>
			    <td><input type="radio" name="s7" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>8. 우울하여 기운을 북돋을 수 있는 것이 아무것도 없다고 느끼신 적이 얼마나 됩니까?</td>
			    <td><input type="radio" name="s8" value="4"></td>
			    <td><input type="radio" name="s8" value="3"></td>
			    <td><input type="radio" name="s8" value="2"></td>
			    <td><input type="radio" name="s8" value="1"></td>
			    <td><input type="radio" name="s8" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>9. 매사가 힘들다고 느끼신 적은 얼마나 됩니까?</td>
			    <td><input type="radio" name="s9" value="4"></td>
			    <td><input type="radio" name="s9" value="3"></td>
			    <td><input type="radio" name="s9" value="2"></td>
			    <td><input type="radio" name="s9" value="1"></td>
			    <td><input type="radio" name="s9" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>10. 자신을 가치없는 사람처럼 느끼신 적은 얼마나 됩니까?</td>
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
					김용석(2011). 한국어판 정신건강 선별도구(K10·K6)의 타당화 연구; 재가복지서비스 이용자를 대상으로, Mental Health & Social Work, Vol.37 2011. 4. pp. 65-88.
				</li>
				<li>
					www.hcp.med.harvard.edu/ncs/k6_scales.php
				</li>
			</ol>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>