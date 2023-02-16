package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.Anniversary;

public interface AnniversaryService {
	
	List<Anniversary> getDayAnnivList(String sdate);

	List<Anniversary> getAnnivDays(String start, String end);
	
}