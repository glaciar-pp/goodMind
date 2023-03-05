package com.example.demo.entity;

import java.time.LocalDateTime;

public class GenLikeList {
	private int lid;
	private int genBid;
	private String uid;
	private LocalDateTime likeTime;

	public GenLikeList() { }
	public GenLikeList(int genBid, String uid) {
		this.genBid = genBid;
		this.uid = uid;
	}
	public GenLikeList(int lid, int genBid, String uid, LocalDateTime likeTime) {
		this.lid = lid;
		this.genBid = genBid;
		this.uid = uid;
		this.likeTime = likeTime;
	}

	@Override
	public String toString() {
		return "Like [lid=" + lid + ", genBid=" + genBid + ", uid=" + uid + ", likeTime=" + likeTime + "]";
	}

	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public int getgenBid() {
		return genBid;
	}
	public void setgenBid(int genBid) {
		this.genBid = genBid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public LocalDateTime getLikeTime() {
		return likeTime;
	}
	public void setLikeTime(LocalDateTime likeTime) {
		this.likeTime = likeTime;
	}
}
