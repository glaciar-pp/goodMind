package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.entity.Map;

@Service
public interface MapService {

	List<Map> getMapList();

	List<Map> getSearchList(String searchWord);
	
}
