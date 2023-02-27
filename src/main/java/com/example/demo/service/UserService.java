package com.example.demo.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.demo.entity.User;

public interface UserService {
	public static final int CORRECT_LOGIN = 0;
	public static final int WRONG_PASSWORD = 1;
	public static final int UID_NOT_EXIST = 2;
	public static final int IS_DELETED_1 = 3;
	
	// 유저 페이지
	List<User> getUserInfo();
	
	//유저 리스트
	List<User> getUserList(int page);

	User getUser(String uid);

	void registerUser(User user);
	
	void updateUser(User user, String newPwd, String filename);
	
	void deleteUser(String uid);

	int login(String uid, String pwd, HttpSession session);

	int getUserCount();
	
}
