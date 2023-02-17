package com.example.demo.service;

import com.example.demo.entity.DiaryDay;

public interface DiaryService {

	boolean isLeapYear(int year);
	
	DiaryDay generateDiaryDay(String uid, String dDate, int date, int isOtherMonth);
}
