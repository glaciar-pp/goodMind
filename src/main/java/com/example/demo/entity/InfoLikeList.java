package com.example.demo.entity;

import java.time.LocalDateTime;

public class InfoLikeList {
	private int lid;
	private int infoBid;
	private String uid;
	private LocalDateTime likeTime;

	public InfoLikeList() { }
	public InfoLikeList(int infoBid, String uid) {
		this.infoBid = infoBid;
		this.uid = uid;
	}
	public InfoLikeList(int lid, int infoBid, String uid, LocalDateTime likeTime) {
		this.lid = lid;
		this.infoBid = infoBid;
		this.uid = uid;
		this.likeTime = likeTime;
	}

	@Override
	public String toString() {
		return "Like [lid=" + lid + ", infoBid=" + infoBid + ", uid=" + uid + ", likeTime=" + likeTime + "]";
	}

	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public int getinfoBid() {
		return infoBid;
	}
	public void setinfoBid(int infoBid) {
		this.infoBid = infoBid;
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
