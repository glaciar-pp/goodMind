package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.DiaryBoard;



public interface DiaryBoardService {

	public List<DiaryBoard> getDiaryBoardList(int page, String field, String query); // 괄호안 추가 2/10
	
	public DiaryBoard getDiaryBoard(int did);
	public void insertDiaryBoard(DiaryBoard diaryBoard);
	
	//=============2/3a 2줄 추가
	void updateDiaryBoard(DiaryBoard diaryBoard);
		
	void deleteDiaryBoard(int did);
	
	//=============2/10 추가
	public int getDiaryBoardCount(String field, String query);
		
}
