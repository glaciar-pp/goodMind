package com.example.demo.entity;

import java.time.LocalDateTime;

public class InfoBoard {
	private int infoBid;
	private String uid;
	private String title;
	private String content;
	private LocalDateTime modTime;
	private int viewCount;
	private int isDeleted;
	private String files;
	private String uname;
	private int likeCount;

	public InfoBoard() {}
	// 게시글 생성시 필요한 생성자
	public InfoBoard(String uid, String title, String content, String files) {
		super();
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.files = files;
	}
	
	// 게시글 수정시 필요한 생성자	
	public InfoBoard(int infoBid, String title, String content, String files) {
		super();
		this.infoBid = infoBid;
		this.title = title;
		this.content = content;
		this.files = files;
	}
	public InfoBoard(int infoBid, String uid, String title, String content, LocalDateTime modTime, int viewCount,
			int isDeleted, String files, String uname, int likeCount) {
		super();
		this.infoBid = infoBid;
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.modTime = modTime;
		this.viewCount = viewCount;
		this.isDeleted = isDeleted;
		this.files = files;
		this.uname = uname;
		this.likeCount = likeCount;
	}
	public int getInfoBid() {
		return infoBid;
	}
	public void setInfoBid(int infoBid) {
		this.infoBid = infoBid;
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
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
}