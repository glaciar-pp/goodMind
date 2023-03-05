package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.GenBoardDao;
import com.example.demo.dao.ReplyDao;
import com.example.demo.entity.GenBoard;
import com.example.demo.entity.GenLikeList;
import com.example.demo.entity.Reply;

@Service
public class GenBoardServiceImpl implements GenBoardService {

	@Autowired
	private GenBoardDao genBoardDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public List<GenBoard> getGenBoardList(int page, String field, String query) {
		int offset = (page - 1) * 10;
		query = "%"+query+"%";
		List<GenBoard> list = genBoardDao.getGenBoardList(offset, field, query);
		return list;
	}

	@Override
	public GenBoard getGenBoard(int genBid) {
		GenBoard genBoard = genBoardDao.getGenBoard(genBid);
		return genBoard;
	}

	@Override
	public void insertGenBoard(GenBoard genBoard) {
		genBoardDao.insertGenBoard(genBoard);
	}

	@Override
	public void updateGenBoard(GenBoard genBoard) {
		genBoardDao.updateGenBoard(genBoard);
	}

	@Override
	public void deleteGenBoard(int genBid) {
		genBoardDao.deleteGenBoard(genBid);
	}

	@Override
	public int getGenBoardCount(String field, String query) {
		query = "%"+query+"%";
		int count = genBoardDao.getGenBoardCount(field, query);
		return count;
	}

	@Override
	public void increaseViewCount(int genBid) {
		String field = "viewCount";
		genBoardDao.increaseCount(genBid, field);
	}

	@Override
	public void increaseReplyCount(int genBid) {
		String field = "replyCount";
		genBoardDao.increaseCount(genBid, field);
	}

	@Override
	public List<Reply> getReplyList(int genBid) {
		List<Reply> list = replyDao.getReplyList(genBid);
		return list;
	}

	@Override
	public void insertReply(Reply reply) {
		replyDao.insertReply(reply);
	}

	@Override
	public List<GenBoard> getGenBoardListByUid(String uid) {
		List<GenBoard> list = genBoardDao.getGenBoardListByUid(uid);
		return list;
	}
	
	@Override
	public int updateLikeCount(int genBid, String uid) {
		GenLikeList genLikeList = genBoardDao.getLikeEntry(genBid, uid);
		if (genLikeList == null) {
			genLikeList = new GenLikeList(genBid, uid);
			genBoardDao.insertLike(genLikeList);
			genBoardDao.increaseCount(genBid, "likeCount");
		}
		int count = genBoardDao.getLikeCount(genBid);
		return count;
	}

}
