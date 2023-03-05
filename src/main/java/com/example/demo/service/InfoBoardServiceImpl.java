package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.InfoBoardDao;
import com.example.demo.entity.InfoBoard;
import com.example.demo.entity.InfoLikeList;

@Service
public class InfoBoardServiceImpl implements InfoBoardService {

	@Autowired
	private InfoBoardDao infoBoardDao;
	
	@Override
	public List<InfoBoard> getInfoBoardList(int page, String field, String query) {
		int offset = (page - 1) * 10;
		query = "%"+query+"%";
		List<InfoBoard> list = infoBoardDao.getInfoBoardList(offset, field, query);
		return list;
	}

	@Override
	public InfoBoard getInfoBoard(int infoBid) {
		InfoBoard infoBoard = infoBoardDao.getInfoBoard(infoBid);
		return infoBoard;
	}

	@Override
	public void insertInfoBoard(InfoBoard infoBoard) {
		infoBoardDao.insertInfoBoard(infoBoard);
	}

	@Override
	public void updateInfoBoard(InfoBoard infoBoard) {
		infoBoardDao.updateInfoBoard(infoBoard);
	}

	@Override
	public void deleteInfoBoard(int infoBid) {
		infoBoardDao.deleteInfoBoard(infoBid);
	}

	@Override
	public int getInfoBoardCount(String field, String query) {
		query = "%"+query+"%";
		int count = infoBoardDao.getInfoBoardCount(field, query);
		return count;
	}

	@Override
	public void increaseViewCount(int infoBid) {
		String field = "viewCount";
		infoBoardDao.increaseCount(infoBid, field);
	}

	@Override
	public List<InfoBoard> getInfoBoardListByUid(String uid) {
		List<InfoBoard> list = infoBoardDao.getInfoBoardListByUid(uid);
		return list;
	}
	
	@Override
	public int updateLikeCount(int infoBid, String uid) {
		InfoLikeList infoLikeList = infoBoardDao.getLikeEntry(infoBid, uid);
		if (infoLikeList == null) {
			infoLikeList = new InfoLikeList(infoBid, uid);
			infoBoardDao.insertLike(infoLikeList);
			infoBoardDao.increaseCount(infoBid, "likeCount");
		}
		int count = infoBoardDao.getLikeCount(infoBid);
		return count;
	}

}
