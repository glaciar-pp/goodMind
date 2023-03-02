package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/goodM/survey")
public class SurveyController {

	@GetMapping("/surList")
	public String surveyForm() {
		return "survey/surList";
	}
	//정신건강 자가진단
	@GetMapping("/surK10")
	public String surveyK10form() {
		return "survey/surK10";
	}
	
	@PostMapping("/surK10")
	public String surveyK10() {
		return "survey/surK10";
	}
	
	//우울증 건강설문(PHQ-9)
	@GetMapping("/surPHQ9")
	public String surveyPHQ9form() {
		return "survey/surPHQ9";
	}
	
	@PostMapping("/surPHQ9")
	public String surveyPHQ9() {
		return "survey/surPHQ9";
	}
	
	//불안장애 척도(GAD-7)
	@GetMapping("/surGAD7")
	public String surveyGAD7form() {
		return "survey/surGAD7";
	}
	
	@PostMapping("/surGAD7")
	public String surveyGAD7() {
		
		return "survey/surGAD7";
	}

	//자아존중감척도(RSES)
	@GetMapping("/surRSES")
	public String surveyRSESform() {
		return "survey/surRSES";
	}
	
	@PostMapping("/surRSES")
	public String surveyRSES() {
		return "survey/surRSES";
	}
	
	//스트레스 척도(PSS)
	@GetMapping("/surPSS")
	public String surveyPSSform() {
		return "survey/surPSS";
	}
	
	@PostMapping("/surPSS")
	public String surveyPSS() {
		return "survey/surPSS";
	}
	
	//위험음주자 선별도구(AUDIT-K)
	@GetMapping("/surAK")
	public String surveyAKform() {
		return "survey/surAK";
	}
	
	@PostMapping("/surAK")
	public String surveyAK() {
		return "survey/surAK";
	}
	//인터넷 게임중독(IGUESS)
	@GetMapping("/surIGUESS")
	public String surveyIGUESSform() {
		return "survey/surIGUESS";
	}
	
	@PostMapping("/surIGUESS")
	public String surIGUESS() {
		return "survey/surIGUESS";
	}
	
	//조기 정신증 선별도구(mKPQ-16)
	@GetMapping("/surMKPQ16")
	public String surveyMKPQ16form() {
		return "survey/surMKPQ16";
	}
	
	@PostMapping("/surMKPQ16")
	public String surMKPQ16() {
		return "survey/surMKPQ16";
	}
}
