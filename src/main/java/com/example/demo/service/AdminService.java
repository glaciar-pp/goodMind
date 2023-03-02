package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.User;

public interface AdminService {	
	
	void updateRestoreRequest(String uid);
	
	//유저 리스트
	List<User> getDeltedUserList(int page);

	int getDeletedUserCount();

	void restoreUser(String uid);
}
