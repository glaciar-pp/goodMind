package com.example.demo.entity;

import java.time.LocalDateTime;

public class DiaryBoard {
	private int did;
	private String uid;
	private String title;
	private String content;
	private LocalDateTime modTime;
	private int isDeleted;
	private String files;
	private String uname;
	private int score; // score 2/14추가
	private String dDate; // dDate 2/17추가
	
	public DiaryBoard() {}  // 게시글 생성시 필요한 생성자 
	public DiaryBoard(int did, String title, String content, String files, String dDate) {
		super();
		this.did = did;
		this.title = title;
		this.content = content;
		this.files = files;
		this.dDate = dDate; // 2/17추가
	}
	public DiaryBoard(String uid, String title, String content, String files, int score, String dDate) {
		super();
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.files = files;
		this.score = score; // score 2/14추가
		this.dDate = dDate; // 2/17추가
	}
	//===2/3a 추가
	public DiaryBoard(int did, String title, String content, String files, int score, String dDate) {
		super();
		this.did = did;
		this.title = title;
		this.content = content;
		this.files = files;
		this.score = score; // score 2/14추가
		this.dDate = dDate; // 2/17추가

	}
	
	//===2/1 constructor -> toString -> getters&setters 순서로  
	public DiaryBoard(int did, String uid, String title, String content, LocalDateTime modTime, int isDeleted,
			String files, int score, String uname, String dDate) {
		super();
		this.did = did;
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.modTime = modTime;
		this.isDeleted = isDeleted;
		this.files = files;
		this.score = score; // score 2/14추가
		this.uname = uname;
		this.dDate = dDate; // 2/17추가

	}
	
	@Override
	public String toString() { // score 2/14추가
		return "DiaryBoard [did=" + did + ", uid=" + uid + ", title=" + title + ", content=" + content + ", modTime="
				+ modTime + ", isDeleted=" + isDeleted + ", files=" + files + ", score=" + score + ", uname=" + uname + "]";
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getModTime() {
		return modTime;
	}

	public void setModTime(LocalDateTime modTime) {
		this.modTime = modTime;
	}

	public int getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}
	
	public int getScore() { // score 2/14추가
		return score;
	}
	
	public void setScore(int score) { // score 2/14추가
		this.score = score;
	}
	
	public String getUname() {
		return uname;
	}
	
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getdDate() { // dDate 2/17추가
		return dDate;
	}
	public void setdDate(String dDate) { // dDate 2/17추가
		this.dDate = dDate;
	}
	
}
