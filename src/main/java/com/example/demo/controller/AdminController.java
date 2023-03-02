package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entity.User;
import com.example.demo.service.AdminService;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("/goodM/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
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
	
	@GetMapping("/restoreRequest")
	public String restoreRequest() {
		return "admin/restoreRequest";
	}
	
	@PostMapping("/request")
	public String request(HttpServletRequest request, Model model) {
	    String uid = request.getParameter("uid");
	    String pwd = request.getParameter("pwd");

	    User u = userService.getUser(uid);
	    if (u != null && u.getUid() != null) {
	        // 탈퇴 회원인지 확인
	        if (u.getIsDeleted() == 1) {
	            // pwd가 맞는지 확인
	            if (!BCrypt.checkpw(pwd, u.getPwd())) {
	                model.addAttribute("msg", "비밀번호가 틀렸습니다.");
	                model.addAttribute("wrongPwd", true);
	            } else {
	            	adminService.updateRestoreRequest(uid);
	                model.addAttribute("msg", "복원 요청 되었습니다. 소요시간이 며칠 걸릴 수 있습니다.");
	                model.addAttribute("correctRequest", true);
	            }
	        } else {
	            model.addAttribute("msg", "탈퇴한 회원이 아닙니다.");
	            model.addAttribute("wrongUid", true);
	        }
	    } else {
	        model.addAttribute("msg", "ID가 존재하지 않습니다.");
	        model.addAttribute("noneUid", true);
	        model.addAttribute("wrongPwd", false);
	        model.addAttribute("wrongUid", false);
	        model.addAttribute("correctRequest", false);
	    }

	    return "admin/alertMsg";
	}
}
