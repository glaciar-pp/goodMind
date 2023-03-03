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
	  surveys.forEach((survey, index) => {
	    const sName = 's' + (index + 1);
	    const sNodeList = survey.querySelectorAll('input[name="' + sName + '"]:checked');
	    let sScore = 0;
	    sNodeList.forEach((node) => {
	      sScore += parseInt(node.value);
	    });
	    totalScore += sScore;
	  }); 

	  let message = "";
	  if (totalScore >= 0 && totalScore <= 50) {
	    message = "You scored between 0 and 50. Result A.";
	  } else if (totalScore >= 51 && totalScore <= 100) {
	    message = "You scored between 51 and 100. Result B.";
	  } else {
	    message = "Your score is out of range.";
	  }
	  
	  document.getElementById('result').innerText = message;
	}
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
		if (totalScore >= 0 && totalScore <= 12) {
			message = "당신의 점수는 " + totalScore + "점으로, 정신건강영역이 양호합니다.";
		} else {
			message = "당신의 점수는 " + totalScore + "점으로, 정신건강영역에 문제가 있을 수 있습니다.";
		}
		document.getElementById('result').innerText = message;
	}
/*  */
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
		<h3>-정신건강 자가진단-</h3>	
		<!-- 테스트 내용 -->
		<p>지난 1년 동안 귀하가 가장 우울 또는 불안했거나 스트레스가 가장 많았던 한달을 떠올려 보십시오.<br>
	    만약 그런 시기가 없었다면 지난 12개월 중 대표적인 달을 떠올려 주십시오.    
		</p>
		<!-- 항목 시작(value 숫자 역순) -->
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
    <!-- 항목 시작(value 숫자 순서대로) -->
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