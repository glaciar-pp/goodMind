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
  // 성별 기준이 포함된 자바스크립트
	function getScores() {
	    const result = {};
	    const surveys = document.querySelectorAll('.survey');
	    let totalScore = 0;
	    let allAnswered = true;
	    let gender = "";
	    const genderRadio = document.getElementsByName('gender');
	    for (let i = 0; i < genderRadio.length; i++) {
	        if (genderRadio[i].checked) {
	            gender = genderRadio[i].value;
	            break;
	        }
	    }
	    if (gender === "") {
	        alert("성별을 선택해주세요.");
	        return;
	    }
	    surveys.forEach((survey, index) => {
	        const sName = 's' + (index + 1);
	        const sNodeList = survey.querySelectorAll('input[name="' + sName + '"]:checked');
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
	    if (!allAnswered) {
	        alert("모든 항목에 응답해주세요.");
	        return;
	    }
	    let message = "";
	    if (gender === "남") {
	        if (totalScore >= 0 && totalScore <= 9) {
	            message = "당신의 점수는 " + totalScore + "점으로, '정상음주'로 분류되었습니다.\n"
	            + "비교적 건강하고 안전한 음주습관을 가지고 있습니다.";
	        } else if (totalScore >= 10 && totalScore <= 19) {
	            message = "당신의 점수는 " + totalScore + "점으로, '위험음주'로 분류되었습니다.\n"
	            + "음주에 대한 단기개입과 지속적인 모니터링이 필요합니다.";
	        } else {
	            message = "당신의 점수는 " + totalScore + "점으로, '알코올 사용 장애'로 분류되었습니다.\n"
	            + "알코올 사용 장애 진단척도 결과, '사용장애 추정군'으로 신체증상, 불안, 불면, 사회부적응, 우울 등 증상이 나타날 수 있으므로 세심한 관심과 전문가의 치료적 개입이 필요합니다.";
	        }
	    } else if (gender === "여") {
	        if (totalScore >= 0 && totalScore <= 5) {
	            message = "당신의 점수는 " + totalScore + "점으로, '정상음주'로 분류되었습니다.\n"
	            + "비교적 건강하고 안전한 음주습관을 가지고 있습니다.";
	        } else if (totalScore >= 6 && totalScore <= 9) {
				message = "당신의 점수는 " + totalScore + "점으로, '위험음주'로 분류되었습니다.\n"
	            + "음주에 대한 단기개입과 지속적인 모니터링이 필요합니다.";
			}else {
				message = "당신의 점수는 " + totalScore + "점으로, '알코올 사용 장애'로 분류되었습니다.\n"
	            + "알코올 사용 장애 진단척도 결과, '사용장애 추정군'으로 신체증상, 불안, 불면, 사회부적응, 우울 등 증상이 나타날 수 있으므로 세심한 관심과 전문가의 치료적 개입이 필요합니다.";
			}
		}else{
			alert("성별을 선택해주세요.");
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
		<h3>-위험음주자 선별도구(AUDIT_K)-</h3>	
		<!-- 테스트 내용 -->
		<p>다음의 각 문장을 읽고, 자신에게 알맞은 답변에 ○로 표시해주시기 바랍니다.</p>
		<h5>성별 선택(필수)</h5>
	    <input type="radio" name="gender" value="남">남성
	    <input type="radio" name="gender" value="여">여성
	    <!-- 항목 시작(value 숫자 순서대로) -->
	    <table class="table">
		<tr>
			<th>항목</th>
			<th>0점</th>
			<th>1점</th>
			<th>2점</th>
			<th>3점</th>
			<th>4점</th>
		</tr>
		 <tr class="survey">
		    <td >1. 술을 얼마나 자주 마십니까?</td>
		    <td><input type="radio" name="s1" value="0">전혀 마시지 않는다</td>
		    <td><input type="radio" name="s1" value="1">한달에 한번 미만</td>
		    <td><input type="radio" name="s1" value="2">한달에 2~4회</td>
		    <td><input type="radio" name="s1" value="3">1주일에 2~3회</td>
		    <td><input type="radio" name="s1" value="4">1주일에 4회 이상</td>
		</tr>
		<tr class="survey">
		    <td>2. 평소 술을 마시는 날 몇잔 정도나 마십니까.</td>
		    <td><input type="radio" name="s2" value="0">1~2잔</td>
		    <td><input type="radio" name="s2" value="1">3~4잔</td>
		    <td><input type="radio" name="s2" value="2">5~6잔</td>
		    <td><input type="radio" name="s2" value="3">7~9잔</td>
		    <td><input type="radio" name="s2" value="4">10잔 이상</td>
		</tr>
		<tr class="survey">
		    <td>3. 한번 술을 마실 때 소주 1병 또는 맥주 4병 이상의 음주는 얼마나 자주 하십니까?</td>
		    <td><input type="radio" name="s3" value="0">전혀 없다</td>
		    <td><input type="radio" name="s3" value="1">한달에 1번 미만</td>
		    <td><input type="radio" name="s3" value="2">한달에 한번</td>
		    <td><input type="radio" name="s3" value="3">일주일에 한번</td>
		    <td><input type="radio" name="s3" value="4">매일같이</td>
		</tr>
		<tr class="survey">
		    <td>4. 지난 1년간 술을 한번 마시기 시작하면 멈출 수 없다는 것을 안 때가 얼마나 자주 있었습니까?</td>
		    <td><input type="radio" name="s4" value="0">전혀 없다</td>
		    <td><input type="radio" name="s4" value="1">한달에 1번 미만</td>
		    <td><input type="radio" name="s4" value="2">한달에 한번</td>
		    <td><input type="radio" name="s4" value="3">일주일에 한번</td>
		    <td><input type="radio" name="s4" value="4">매일같이</td>
		</tr>
		<tr class="survey">
		    <td>5. 지난 1년간 당신은 평소 같으면 할 수 있었던 일을 음주 때문에 실패한 적이 얼마나 자주 있었습니까?</td>
		    <td><input type="radio" name="s5" value="0">전혀 없다</td>
		    <td><input type="radio" name="s5" value="1">한달에 1번 미만</td>
		    <td><input type="radio" name="s5" value="2">한달에 한번</td>
		    <td><input type="radio" name="s5" value="3">일주일에 한번</td>
		    <td><input type="radio" name="s5" value="4">매일같이</td>
		</tr>
		<tr class="survey">
		    <td>6. 지난 1년간 술을 마신 다음날 아침에 일을 나가기 위해 다시 해장술을 필요로 했던 적이 얼마나 자주 있었습니까?</td>
		    <td><input type="radio" name="s6" value="0">전혀 없다</td>
		    <td><input type="radio" name="s6" value="1">한달에 1번 미만</td>
		    <td><input type="radio" name="s6" value="2">한달에 한번</td>
		    <td><input type="radio" name="s6" value="3">일주일에 한번</td>
		    <td><input type="radio" name="s6" value="4">매일같이</td>
		</tr>
		<tr class="survey">
		    <td>7. 지난 1년간 음주 후에 죄책감이 들거나 후회를 한 적이 얼마나 자주 있었습니까?</td>
		    <td><input type="radio" name="s7" value="0">전혀 없다</td>
		    <td><input type="radio" name="s7" value="1">한달에 1번 미만</td>
		    <td><input type="radio" name="s7" value="2">한달에 한번</td>
		    <td><input type="radio" name="s7" value="3">일주일에 한번</td>
		    <td><input type="radio" name="s7" value="4">매일같이</td>
		</tr>
		<tr class="survey">
		    <td>8. 지난 1년간 음주 때문에 전날 밤에 있었던 일이 기억나지 않았던 적이 얼마나 자주 있었습니까? </td>
		    <td><input type="radio" name="s8" value="0">전혀 없다.</td>
		    <td><input type="radio" name="s8" value="1">한달에 1번 미만</td>
		    <td><input type="radio" name="s8" value="2">한달에 한번</td>
		    <td><input type="radio" name="s8" value="3">일주일에 한번</td>
		    <td><input type="radio" name="s8" value="4">매일같이</td>
		</tr>
		<tr class="survey">
		    <td>9. 음주로 인해 자신이나 다른 사람이 다친 적이 있었습니까?</td>
		    <td><input type="radio" name="s9" value="0">없었다</td>
		    <td colspan="2"><input type="radio" name="s9" value="2">있지만, 지난 1년간에는 없었다</td>
		    <td colspan="2"><input type="radio" name="s9" value="4">지난 1년간 있었다</td>
		</tr>
		<tr class="survey">
		    <td>10. 친척이나 친구, 또는 의사가 당신이 술 마시는 것을 걱정하거나 술 끊기를 권유한 적이 있습니까?</td>
		    <td><input type="radio" name="s10" value="0">전혀 없다</td>
		    <td colspan="2"><input type="radio" name="s10" value="2">있지만, 지난 1년간에는 없었다</td>
		    <td colspan="2"><input type="radio" name="s10" value="4">지난 1년간 있었다</td>
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
				조근호, 채숙희, 박애란, 이해국, 신임희, 민성호(2009). 위험 음주자의 선별을 위한 한국어판 Alcohol Use Disorders Identification Test(AUDIT-K)의 최적 절단값.
				J. Korean Academy of Addiction Psychiatry, 13(1), 34-40
				</li>
			</ol>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>