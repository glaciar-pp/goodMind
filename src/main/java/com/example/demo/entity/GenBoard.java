package com.example.demo.entity;

import java.time.LocalDateTime;

public class GenBoard {
	private int genBid;
	private String uid;
	private String title;
	private String content;
	private LocalDateTime modTime;
	private int viewCount;
	private int replyCount;
	private int isDeleted;
	private String files;
	private String uname;
	private int likeCount;

	
	public GenBoard() {}
	// 게시글 생성시 필요한 생성자
	public GenBoard(String uid, String title, String content, String files) {
		super();
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.files = files;
	}
	
	// 게시글 수정시 필요한 생성자	
	public GenBoard(int genBid, String title, String content, String files) {
		super();
		this.genBid = genBid;
		this.title = title;
		this.content = content;
		this.files = files;
	}
	public GenBoard(int genBid, String uid, String title, String content, LocalDateTime modTime, int viewCount,
			int replyCount, int isDeleted, String files, String uname, int likeCount) {
		super();
		this.genBid = genBid;
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.modTime = modTime;
		this.viewCount = viewCount;
		this.replyCount = replyCount;
		this.isDeleted = isDeleted;
		this.files = files;
		this.uname = uname;
		this.likeCount = likeCount;
	}
	public int getGenBid() {
		return genBid;
	}
	public void setGenBid(int genBid) {
		this.genBid = genBid;
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
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
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