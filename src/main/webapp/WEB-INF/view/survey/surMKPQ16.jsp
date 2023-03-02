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
		if (totalScore >= 1 && totalScore <= 6) {
			message = "당신의 점수는 " + totalScore + "점으로, 문제 가능성이 적은 것으로 시사됩니다.";
		} else {
			message = "당신의 점수는 " + totalScore + "점으로, 문제 가능성이 있는 것으로 시사됩니다. 7점 이상은 정신증 고위험군 선별을 위한 심층면담 대상자로 선정됩니다.";
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
		<p>지난 한 달 동안 다음의 생각, 느낌, 경험이 있었는지에 대해 '예' 또는 '아니오'에 체크해주십시오. 술이나 약을 복용하는 동안에만 경험하는 것은 포함하지 않습니다.   
		</p>
		<!-- 항목 시작(value 숫자 역순) -->
	    <table class="table">
			<tr>
				<th>항목</th>
				<th>예</th>
				<th>아니오</th>
			</tr>
			 <tr class="survey">
			    <td >1. 내가 이전에 즐겨했던 일에 흥미가 없어진다.</td>
			    <td><input type="radio" name="s1" value="1"></td>
			    <td><input type="radio" name="s1" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>2. 지금 경험하는 일이 마치 전에도 똑같이 일어났던 것처럼 느껴질 때가 종종 있다(데자뷰).</td>
			    <td><input type="radio" name="s2" value="1"></td>
			    <td><input type="radio" name="s2" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>3. 나는 때때로 다른 사람들이 느끼지 못하는 냄새나 맛을 느낀다.</td>
			    <td><input type="radio" name="s3" value="1"></td>
			    <td><input type="radio" name="s3" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>4. 나는 쿵, 찰칵, 쉿, 짝짝, 딸랑딸랑 거리는 등의 특이한 소리를 종종 듣는다.</td>
			    <td><input type="radio" name="s4" value="1"></td>
			    <td><input type="radio" name="s4" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>5. 때로는 내가 경험한 상황이 실제인지 상상인지 헷갈릴 때가 있다.</td>
			    <td><input type="radio" name="s5" value="1"></td>
			    <td><input type="radio" name="s5" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>6. 내가 다른 사람을 쳐다보거나 거울 속의 내 자신을 볼 때, 내 눈 바로 앞에서 얼굴이 바뀌는 것을 본 적이 있다.</td>
			    <td><input type="radio" name="s6" value="1"></td>
			    <td><input type="radio" name="s6" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>7. 나는 사람을 처음 만날 때 극도로 불안해진다.</td>
			    <td><input type="radio" name="s7" value="1"></td>
			    <td><input type="radio" name="s7" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>8. 다른 사람들이 확실히 볼 수 없는 것들을 본 적이 있다.</td>
			    <td><input type="radio" name="s8" value="1"></td>
			    <td><input type="radio" name="s8" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>9. 내 생각들은 가끔 너무 강렬해져서 마치 실제로 내게 말하는 것처럼 느낄 때가 있다.</td>
			    <td><input type="radio" name="s9" value="1"></td>
			    <td><input type="radio" name="s9" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>10. 나는 때때로 광고나 상품 진열대 또는 내 주변에 배치된 것들에서 특별한 의미를 발견한다.</td>
			    <td><input type="radio" name="s10" value="1"></td>
			    <td><input type="radio" name="s10" value="0"></td>
			</tr>
			<tr class="survey">
			    <td >11. 때때로 나는 내 아이디어나 생각을 통제하지 못한다고 느낄 때가 있다.</td>
			    <td><input type="radio" name="s1" value="1"></td>
			    <td><input type="radio" name="s1" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>12. 때때로 나는 평소에는 알아채지 못했을 희미한 소리에 갑자기 정신이 산만해진다.</td>
			    <td><input type="radio" name="s2" value="1"></td>
			    <td><input type="radio" name="s2" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>13. 다른 사람들이 듣지 못하는 속삭임이나 말소리를 들은 적이 있다.</td>
			    <td><input type="radio" name="s3" value="1"></td>
			    <td><input type="radio" name="s3" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>14. 나는 다른 사람들이 내게 앙심을 품고 있다고 느낀 적이 종종 있다.</td>
			    <td><input type="radio" name="s4" value="1"></td>
			    <td><input type="radio" name="s4" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>15. 보이진 않지만, 어떤 사람이나 힘이 내 주위에 존재하는 느낌을 받은 적이 있다.</td>
			    <td><input type="radio" name="s5" value="1"></td>
			    <td><input type="radio" name="s5" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>16. 나는 내 몸의 일부가 어떤 면에서 달라졌거나, 이전과 다르게 움직이고 있다고 느낀다.</td>
			    <td><input type="radio" name="s6" value="1"></td>
			    <td><input type="radio" name="s6" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>a. 가끔 나에 대한 음모(모함)가 있다는 느낌이 든다.</td>
			    <td><input type="radio" name="s7" value="1"></td>
			    <td><input type="radio" name="s7" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>b. 사람들이 말을 길게 하면 말뜻을 정확히 이해하기 어렵다.</td>
			    <td><input type="radio" name="s8" value="1"></td>
			    <td><input type="radio" name="s8" value="0"></td>
			</tr>
			<tr class="survey">
			    <td>c. 그럴리가 없는데 가끔 어떤 사건이나 방송들이 나와 관련이 있는 것 같다.</td>
			    <td><input type="radio" name="s9" value="1"></td>
			    <td><input type="radio" name="s9" value="0"></td>
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
					Sung-Wan Kim, Young-Chul Chung, Young-Shin Kang, Jae-Kyeong Kim, Ji-Eun Jang, Min Jhon, Ju-Yeon Lee, Jae-Min Kim, Il-Seon Shin, Jin-Sang Yoon (2018).
					Validation of the Korean version of the 16-Item Prodromal Questionnaire in a Non-Help-Seeking College Population. Psychiatry investig. 2018;15(2):111-117
				</li>
			</ol>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>