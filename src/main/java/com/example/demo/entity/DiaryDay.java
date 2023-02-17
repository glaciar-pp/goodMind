package com.example.demo.entity;

import java.util.List;

public class DiaryDay {
	private int day;
	private int date;	// 요일 (0-일요일, ..., 6-토요일)
	private int isHoliday;
	private int isOtherMonth;
	private String sdate;		// 20230214
	private List<String> annivList;
	private List<DiaryBoard> diaryBoardList;
	
	public DiaryDay() { }

	public DiaryDay(int day, int date, int isHoliday, int isOtherMonth, String sdate, List<String> annivList,
			List<DiaryBoard> diaryBoardList) {
		this.day = day;
		this.date = date;
		this.isHoliday = isHoliday;
		this.isOtherMonth = isOtherMonth;
		this.sdate = sdate;
		this.annivList = annivList;
		this.diaryBoardList = diaryBoardList;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public int getIsHoliday() {
		return isHoliday;
	}

	public void setIsHoliday(int isHoliday) {
		this.isHoliday = isHoliday;
	}

	public int getIsOtherMonth() {
		return isOtherMonth;
	}

	public void setIsOtherMonth(int isOtherMonth) {
		this.isOtherMonth = isOtherMonth;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public List<String> getAnnivList() {
		return annivList;
	}

	public void setAnnivList(List<String> annivList) {
		this.annivList = annivList;
	}

	public List<DiaryBoard> getDiaryBoardList() {
		return diaryBoardList;
	}

	public void setDiaryBoardList(List<DiaryBoard> diaryBoardList) {
		this.diaryBoardList = diaryBoardList;
	}
	
}
