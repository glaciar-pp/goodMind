package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.User;
import com.example.demo.service.AdminService;

@Controller
@RequestMapping("/goodM/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/deletedUserList/{page}")
	public String list(@PathVariable int page, HttpServletRequest req, Model model) {
		List<User> list = adminService.getDeltedUserList(page);
		HttpSession session = req.getSession();
		session.setAttribute("currentUserPage", page);
		
		int totalUsers = adminService.getDeletedUserCount();
		int totalPages = (int) Math.ceil(totalUsers / 10.);
		List<String> pageList = new ArrayList<>();
		for (int i = 1; i <= totalPages; i++)
			pageList.add(String.valueOf(i));
		model.addAttribute("pageList", pageList);
		
		model.addAttribute("deletedUserList", list);
		return "admin/deletedUserList";
	}
	
	@GetMapping("/restore/{uid}")
	public String restore(@PathVariable String uid) {
		adminService.restoreUser(uid);
		return "redirect:/goodM/admin/deletedUserList/1";
	}
}
