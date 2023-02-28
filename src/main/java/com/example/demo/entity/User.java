package com.example.demo.entity;

import java.time.LocalDate;

public class User {
	private String uid;
	private String pwd;
	private String uname;
	private String email;
	private LocalDate regDate;
	private int isDeleted;
	private String filename;
	private String admin;
	private int restoreRequest;
	
	public User() {}
	public User(String uid, String uname, String email, String filename) {
		this.uid = uid;
		this.uname = uname;
		this.email = email;
		this.filename = filename;
	}
	public User(String uid, String pwd, String uname, String email, String filename) {
		this.uid = uid;
		this.pwd = pwd;
		this.uname = uname;
		this.email = email;
		this.filename = filename;
	}
	public User(String uid, String pwd, String uname, String email, LocalDate regDate, int isDeleted, String filename) {
		this.uid = uid;
		this.pwd = pwd;
		this.uname = uname;
		this.email = email;
		this.regDate = regDate;
		this.isDeleted = isDeleted;
		this.filename = filename;
	}
	public User(String uid, String pwd, String uname, String email, LocalDate regDate, int isDeleted, String filename,
			String admin) {
		super();
		this.uid = uid;
		this.pwd = pwd;
		this.uname = uname;
		this.email = email;
		this.regDate = regDate;
		this.isDeleted = isDeleted;
		this.filename = filename;
		this.admin = admin;
	}
	
	public User(String uid, String pwd, String uname, String email, LocalDate regDate, int isDeleted, String filename,
			String admin, int restoreRequest) {
		super();
		this.uid = uid;
		this.pwd = pwd;
		this.uname = uname;
		this.email = email;
		this.regDate = regDate;
		this.isDeleted = isDeleted;
		this.filename = filename;
		this.admin = admin;
		this.restoreRequest = restoreRequest;
	}
	
	@Override
	public String toString() {
		return "User [uid=" + uid + ", pwd=" + pwd + ", uname=" + uname + ", email=" + email + ", regDate=" + regDate
				+ ", isDeleted=" + isDeleted + ", filename=" + filename + ", admin=" + admin + ", restoreRequest="
				+ restoreRequest + "]";
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public LocalDate getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDate regDate) {
		this.regDate = regDate;
	}
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public int getRestoreRequest() {
		return restoreRequest;
	}
	public void setRestoreRequest(int restoreRequest) {
		this.restoreRequest = restoreRequest;
	}
	
}