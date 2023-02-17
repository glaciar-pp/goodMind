package com.example.demo.chatBot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ChatbotService;

@Controller
@RequestMapping("/goodM/chat")
public class ChatController {
	
	@Autowired
	private ChatbotService chatbotService;
	
	@GetMapping("/gibuni")
	public String gibuni(String result) {
		result = chatbotService.main("");
		System.out.println("위");
		return "chat/gibuni";
	}
	
	@ResponseBody
	@PostMapping("/gibuni")
	public String gibuniResult(@RequestParam("message")String inputText) throws Exception { 
		String msg = ""; 
		msg = chatbotService.main(inputText); 
		return msg;
	    }

}
