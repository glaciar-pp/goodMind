package com.example.demo.service;

import java.util.List;

import javax.annotation.Resource;

import com.example.demo.entity.DiaryBoard;

public interface DiaryBoardService {

	public List<DiaryBoard> getDiaryBoardList(int page, String field, String query); // 괄호안 추가 2/10
	
	public DiaryBoard getDiaryBoard(int did);
	public void insertDiaryBoard(DiaryBoard diaryBoard);
	
	//===2/3a 2줄 추가
	void updateDiaryBoard(DiaryBoard diaryBoard);
		
	void deleteDiaryBoard(int did);
	
	//===2/10 추가
	public int getDiaryBoardCount(String field, String query, String uid); // 괄호안 uid추가 2/16b 

	//===2/14 score 추가
	public int getDiaryBoardScore(int score);

	public void updateDiaryBoardScore(DiaryBoard diaryBoard);

	//===2/14 update score 추가
	public int updateDiaryBoardScore(int score);
	
	//===2/15 uid session 추가
	public List<DiaryBoard> getDiaryBoardList(int page, String field, String query, String uid); // 괄호안 uid추가 2/16b 

}
