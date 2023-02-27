package com.example.demo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("/goodM/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Value("${spring.servlet.multipart.location}") private String uploadDir;
	
	@GetMapping("/login")
	public String loginForm() {
		return "user/login";
	}
	
	@PostMapping("/login") 
	public String login(HttpServletRequest req, Model model) {
		String uid = req.getParameter("uid");
		String pwd = req.getParameter("pwd");
		HttpSession session = req.getSession();
		int result = userService.login(uid, pwd, session);
		switch(result) {
		case UserService.CORRECT_LOGIN:
			model.addAttribute("msg", session.getAttribute("uname") + "님 환영합니다.");			
			model.addAttribute("url", "/goodM/user/main");
			break;
		case UserService.WRONG_PASSWORD:
			model.addAttribute("msg", "잘못된 패스워드 입니다. 다시 입력하세요.");
			model.addAttribute("url", "/goodM/user/login"); 
			break;
		case UserService.UID_NOT_EXIST:
			model.addAttribute("msg", "회원 가입 페이지로 이동합니다.");
			model.addAttribute("url", "/goodM/user/register");
		}
		return "user/alertMsg";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/goodM/user/login";
	}
	
	@GetMapping("/main")
	public String main() {
		return "user/main";
	}
	
	@GetMapping("/about")
	public String about() {
		return "user/about";
	}
	
	@GetMapping("/register")
	public String registerForm() {
		return "user/register";
	}

	@PostMapping("/register")
	public String register(MultipartHttpServletRequest req, Model model) throws Exception{
		String uid = req.getParameter("uid").strip();
		String pwd = req.getParameter("pwd").strip();
		String pwd2 = req.getParameter("pwd2").strip();
		String uname = req.getParameter("uname").strip();
		String email = req.getParameter("email").strip();
		MultipartFile profile = req.getFile("filename");
		String filename = profile.getOriginalFilename();
		String imageFile_ = uploadDir + "/" + filename;
		File uploadFile = new File(imageFile_);
		profile.transferTo(uploadFile);

		User user = userService.getUser(uid);
		if (user != null) {
			model.addAttribute("msg", "중복 아이디입니다.");
			model.addAttribute("url", "/goodM/user/register");
			return "user/alertMsg";
		}
		if (pwd.equals(pwd2)) {
			user = new User(uid, pwd, uname, email, filename);
			userService.registerUser(user);
			return "redirect:/goodM/user/login";
		} else {
			model.addAttribute("msg", "패스워드 입력이 잘못되었습니다.");
			model.addAttribute("url", "/goodM/user/register");
			return "user/alertMsg";
		}
	}
	
	@GetMapping("/myPage")
	public String myPage(HttpServletRequest req, Model model) {
		List<User> userPage = userService.getUserInfo();		
		model.addAttribute("userPage", userPage);
		return "user/myPage";
	}

	//유저의 경우 유저 목록이 아닌 본인정보 페이지로 특정되야하는 부분 있음
	@GetMapping("/list/{page}")
	public String list(@PathVariable int page, HttpServletRequest req, Model model) {
		List<User> list = userService.getUserList(page);
		HttpSession session = req.getSession();
		session.setAttribute("currentUserPage", page);
		
		int totalUsers = userService.getUserCount();
		int totalPages = (int) Math.ceil(totalUsers / 10.);
		List<String> pageList = new ArrayList<>();
		for (int i = 1; i <= totalPages; i++)
			pageList.add(String.valueOf(i));
		model.addAttribute("pageList", pageList);
		
		model.addAttribute("userList", list);
		return "user/list";
	}
	
	@GetMapping("/update/{uid}")
	public String updateForm(@PathVariable String uid, Model model) {
		User user = userService.getUser(uid);
		model.addAttribute("user", user);
		return "user/update";
	}
	
	@PostMapping("/update")
	public String update(MultipartHttpServletRequest  req, Model model) throws Exception{
		String uid = req.getParameter("uid");
		String pwd = req.getParameter("pwd").strip();
		String pwd2 = req.getParameter("pwd2").strip();
		String uname = req.getParameter("uname").strip();
		String email = req.getParameter("email").strip();
		MultipartFile profile = req.getFile("filename");
		String filename = profile.getOriginalFilename();
		System.out.println(profile + "===" + filename);
		if (filename != null && !filename.equals("")) {
		    String imageFile_ = uploadDir + "/" + filename;
		    File uploadFile = new File(imageFile_);
		    profile.transferTo(uploadFile);
		} else
			filename = null;
		
		HttpSession session = req.getSession();
		User user;
		
		if (pwd == null || pwd.equals("")) {	// 패스워드를 입력하지 않은 경우
			user = new User(uid, uname, email, filename);
			userService.updateUser(user, "", filename);
			session.setAttribute("uname", uname);
			return "redirect:/goodM/user/myPage/";		
		} else if (pwd.equals(pwd2)) {			// 패스워드가 올바른 경우
			user = new User(uid, uname, email, filename);
			userService.updateUser(user, pwd, filename);
			session.setAttribute("uname", uname);
			return "redirect:/goodM/user/myPage/";
		} else {								// 패스워드를 잘못 입력한 경우
			model.addAttribute("msg", "패스워드 입력이 잘못되었습니다.");
			model.addAttribute("url", "/goodM/user/update/" + uid);
			return "user/alertMsg";
		}
	}
	
	//관리자에게 계정 삭제 요청으로 할지? 본인 삭제로 할지 체크 필요!
	@GetMapping("/delete/{uid}")
	public String delete(@PathVariable String uid, Model model) {
		model.addAttribute("uid", uid);
		return "user/delete";
	}
	
	@GetMapping("/deleteConfirm/{uid}")
	public String deleteConfirm(@PathVariable String uid, HttpServletRequest req) {
		userService.deleteUser(uid);
		HttpSession session = req.getSession();
		return "redirect:/goodM/user/logout/";
	}
	
}