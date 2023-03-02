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
}
