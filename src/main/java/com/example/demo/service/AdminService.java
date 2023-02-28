package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.User;

public interface AdminService {
	 public static final int SUCCESS = 1;
	 public static final int FAIL = -1;
	
	int updateRestoreRequest(String uid);
	
	//유저 리스트
	List<User> getDeltedUserList(int page);

	int getDeletedUserCount();

	void restoreUser(String uid);
}
