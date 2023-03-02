package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.GenBoard;
import com.example.demo.entity.Reply;

public interface GenBoardService {

	public List<GenBoard> getGenBoardList(int page, String field, String query);
	
	public GenBoard getGenBoard(int genBid);
	
	public void insertGenBoard(GenBoard genBoard);
	
	public void updateGenBoard(GenBoard genBoard);
	
	public void deleteGenBoard(int genBid);
	
	public int getGenBoardCount(String field, String query);
	
	public void increaseViewCount(int genBid);
	
	public void increaseReplyCount(int genBid);
	
	public List<Reply> getReplyList(int genBid);
	
	public void insertReply(Reply reply);
	
	public List<GenBoard> getGenBoardListByUid(String uid);
}
