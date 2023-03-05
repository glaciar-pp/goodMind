package com.example.demo.controller;

import java.io.File;
import java.time.LocalDate;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.entity.GenBoard;
import com.example.demo.entity.Reply;
import com.example.demo.service.GenBoardService;
import com.example.demo.service.JSONUtil;

@Controller
@RequestMapping("/goodM/genBoard")
public class GenBoardController {

	@Autowired private GenBoardService genBoardService;
	@Value("${spring.servlet.multipart.location}") private String uploadDir;
	
	@GetMapping("/list")
	public String list(HttpServletRequest req, Model model) {
		String page_ = req.getParameter("p");
		String field = req.getParameter("f");
		String query = req.getParameter("q");
		
		int page = (page_ == null || page_.equals("")) ? 1 : Integer.parseInt(page_);
		field = (field == null || field.equals("")) ? "title" : field;
		query = (query == null || query.equals("")) ? "" : query;
		List<GenBoard> list = genBoardService.getGenBoardList(page, field, query);
		
		HttpSession session = req.getSession();
		session.setAttribute("currentGenBoardPage", page);
		model.addAttribute("field", field);
		model.addAttribute("query", query);
		
		int totalGenBoardNo = genBoardService.getGenBoardCount(field, query);
		int totalPages = (int) Math.ceil(totalGenBoardNo / 10.);
		
		int startPage = (int)(Math.ceil((page-0.5)/10) - 1) * 10 + 1;
		int endPage = Math.min(totalPages, startPage + 9);
		List<String> pageList = new ArrayList<>();
		for (int i = startPage; i <= endPage; i++) 
			pageList.add(String.valueOf(i));
		model.addAttribute("pageList", pageList);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPages", totalPages);
		
		String today = LocalDate.now().toString(); // 2022-12-28
		model.addAttribute("today", today);
		model.addAttribute("genBoardList", list);
		return "genBoard/list";
	}

	@GetMapping("/detail")
	public String detail(HttpServletRequest req, Model model) {
		int genBid = Integer.parseInt(req.getParameter("genBid"));
		String uid = req.getParameter("uid");
		String option = req.getParameter("option");
		HttpSession session = req.getSession();
		String sessionUid = (String) session.getAttribute("uid");

		// 조회수 증가. 단, 본인이 읽거나 댓글 작성후에는 제외.
		if (option == null && (!uid.equals(sessionUid))) 
			genBoardService.increaseViewCount(genBid);

		GenBoard genBoard = genBoardService.getGenBoard(genBid);
		String jsonFiles = genBoard.getFiles();
		if (!(jsonFiles == null || jsonFiles.equals(""))) {
			JSONUtil json = new JSONUtil();
			List<String> fileList = json.parse(jsonFiles);
			model.addAttribute("fileList", fileList);
		}
		model.addAttribute("genBoard", genBoard);
		List<Reply> replyList = genBoardService.getReplyList(genBid);
		model.addAttribute("replyList", replyList);
		return "genBoard/detail";
	}
	
	@PostMapping("/reply")
	public String reply(HttpServletRequest req, Model model) {
		String content = req.getParameter("content");
		int genBid = Integer.parseInt(req.getParameter("genBid"));
		String uid = req.getParameter("uid"); // 게시글의 uid
		
		// 게시글의 uid와 댓글을 쓰려고 하는 사람의 uid가 같으면 isMine이 1
		HttpSession session = req.getSession();
		String sessionUid = (String) session.getAttribute("uid");
		int isMine = (uid.equals(sessionUid)) ? 1 : 0;
		
		Reply reply = new Reply(content, isMine, sessionUid, genBid);
		genBoardService.insertReply(reply);
		genBoardService.increaseReplyCount(genBid);
		return "redirect:/goodM/genBoard/detail?genBid=" + genBid + "&uid=" + uid + "&option=DNI";	// Do Not Increase
	}
	
	@GetMapping("/write")
	public String write() {
		return "genBoard/write";
	}
	
	@PostMapping("/write")
	public String write(MultipartHttpServletRequest req) {
		String uid = (String) req.getParameter("uid");
		String title = (String) req.getParameter("title");
		String content = (String) req.getParameter("content");
		List<MultipartFile> fileList = req.getFiles("files");
		List<String> list = new ArrayList<>();
		// File upload
		for (MultipartFile file: fileList) {
			list.add(file.getOriginalFilename());
			String uploadFile = uploadDir + "/" + file.getOriginalFilename();
			File fileName = new File(uploadFile);
			try {
				file.transferTo(fileName);
			} catch (Exception e) {
//				e.printStackTrace();
			}
		}
		JSONUtil json = new JSONUtil();
		String files = json.stringify(list);
		GenBoard genBoard = new GenBoard(uid, title, content, files); 
		genBoardService.insertGenBoard(genBoard);
		return "redirect:/goodM/genBoard/list?p=1&f=&q=";
	}
	
	@GetMapping("/update")
	public String updateForm(HttpServletRequest req, Model model) {
		int genBid = Integer.parseInt(req.getParameter("genBid"));
		GenBoard genBoard = genBoardService.getGenBoard(genBid);
		HttpSession session = req.getSession();
		
		String jsonFiles = genBoard.getFiles();
		if (!(jsonFiles == null || jsonFiles.equals(""))) {
			JSONUtil json = new JSONUtil();
			List<String> fileList = json.parse(jsonFiles);
			session.setAttribute("fileList", fileList);
		}
		model.addAttribute("genBoard", genBoard);
		return "genBoard/update";
	}
	
	@PostMapping("/update")
	public String update(MultipartHttpServletRequest req) {
		int genBid = Integer.parseInt(req.getParameter("genBid"));
		String uid = req.getParameter("uid");
		String title = (String) req.getParameter("title");
		String content = (String) req.getParameter("content");
		
		HttpSession session = req.getSession();
		List<String> additionalFileList = (List<String>) session.getAttribute("fileList");
		String[] delFileList = req.getParameterValues("delFile");
		if (delFileList != null) {
			for (String delName: delFileList) {
				File delFile = new File(uploadDir + "/" + delName);
				delFile.delete();
				additionalFileList.remove(delName);
			}
			session.setAttribute("fileList", additionalFileList);
		}
		
		List<MultipartFile> fileList = req.getFiles("files");
		List<String> newFileList = new ArrayList<>();
		// File upload
		for (MultipartFile file: fileList) {
			newFileList.add(file.getOriginalFilename());
			String uploadFile = uploadDir + "/" + file.getOriginalFilename();
			File fileName = new File(uploadFile);
			try {
				file.transferTo(fileName);
			} catch (Exception e) {
//				e.printStackTrace();
			}
		}
		for (String fname: newFileList) {
			additionalFileList.add(fname);
		}
		List<String> newAdditionalFileList = new ArrayList<>();
		for (String afname: additionalFileList) {
			if (afname.equals(""))
				continue;
			newAdditionalFileList.add(afname);
		}
		JSONUtil json = new JSONUtil();
		String files = json.stringify(newAdditionalFileList);
		GenBoard genBoard = new GenBoard(genBid, title, content, files);
		genBoardService.updateGenBoard(genBoard);
		
		return "redirect:/goodM/genBoard/detail?genBid=" + genBid + "&uid=" + uid + "&option=DNI";
	}
	
	@GetMapping("/delete")
	public String delete(HttpServletRequest req, Model model) {
		int genBid = Integer.parseInt(req.getParameter("genBid"));
		model.addAttribute("genBid", genBid);
		return "genBoard/delete";
	}
	
	@GetMapping("/deleteConfirm")
	public String deleteConfirm(HttpServletRequest req) {
		int genBid = Integer.parseInt(req.getParameter("genBid"));
		genBoardService.deleteGenBoard(genBid);
		
		HttpSession session = req.getSession();
		return "redirect:/goodM/genBoard/list?p=" + session.getAttribute("currentGenBoardPage") + "&f=&q=";
	}
	
	@ResponseBody
	@GetMapping("/like/{genBid}/{uid}")
	public String like(@PathVariable int genBid, @PathVariable String uid) {
		int count = genBoardService.updateLikeCount(genBid, uid);
		return count + "";
	}
}
