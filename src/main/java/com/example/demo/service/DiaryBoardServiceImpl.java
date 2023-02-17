package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.DiaryBoardDao;
import com.example.demo.entity.DiaryBoard;

@Service 
public class DiaryBoardServiceImpl implements DiaryBoardService {
	
	@Autowired private DiaryBoardDao diaryBoardDao;
	
	@Override
	public List<DiaryBoard> getDiaryBoardList(int page, String field, String query) {
		List<DiaryBoard> list = getDiaryBoardList(page, field, query, "%");
		return list;
	}

	@Override
	public DiaryBoard getDiaryBoard(int did) {
		DiaryBoard diaryBoard = diaryBoardDao.getDiaryBoard(did);
		return diaryBoard;
	}
	
	@Override
	public void insertDiaryBoard(DiaryBoard diaryBoard) {
		diaryBoardDao.insertDiaryBoard(diaryBoard);
	}
	
	//===2/3a add method (class에서 add됨)
	@Override
	public void updateDiaryBoard(DiaryBoard diaryBoard) {  // 젤끝에 d-> diaryBoard 로 수정 2/3a-1
		diaryBoardDao.updateDiaryBoard(diaryBoard);  // 젤끝에 d-> diaryBoard 로 수정 2/3a-1
	}

	@Override
	public void deleteDiaryBoard(int did) {
		diaryBoardDao.deleteDiaryBoard(did);
	}
	
	//===2/10 page추가 
	@Override
	public int getDiaryBoardCount(String field, String query, String uid) {  // uid추가 2/16b
		query = "%"+query+"%";
		int count = diaryBoardDao.getDiaryBoardCount(field, query, uid);  // uid추가 2/16b
		return count;
	}
	
	//===2/14 score추가
	@Override
	public int getDiaryBoardScore(int score) {
		score = diaryBoardDao.getDiaryBoardScore(score);
		return score;
	}
	
	//===2/15a update score 추가
	@Override   
	public void updateDiaryBoardScore(DiaryBoard diaryBoard) { 
		diaryBoardDao.updateDiaryBoard(diaryBoard);
	}

	//===2/15a update score 추가
	@Override
	public int updateDiaryBoardScore(int score) {
		score = diaryBoardDao.updateDiaryBoardScore(score);
		return score;
		}
	
	//===2/16b uid session 추가
	@Override 
	public List<DiaryBoard> getDiaryBoardList(int page, String field, String query, String uid) {
		int offset = (page - 1) * 10;
		query = "%"+query+"%";
		List<DiaryBoard> list = diaryBoardDao.getDiaryBoardList(offset, field, query, uid);
		return list;
	}
}