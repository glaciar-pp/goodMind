package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.SentimentUtil;

@Controller
@RequestMapping("/goodM/sentiment")
public class SentimentController {
	
	@Autowired private SentimentUtil sentimentUtil;

	@GetMapping("/sentiment")
	public String sentimentForm() {
		return "sentiment/sentimentForm";
	}
	
	@PostMapping("/sentiment")
	public String sentiment(String content, Model model) throws Exception {
		String result = sentimentUtil.getSentimentResult(content.replace("\n", " ").replace("\r", ""));
		model.addAttribute("content", content.replace("\n", "<br>").replace("\r", ""));
		model.addAttribute("result", result);
		return "sentiment/sentimentResult";
	}
// 이 파일은 마지막에 서비스가 안정적으로 돌아가는지 테스트 완료후에 삭제해도 됩니다. 
}