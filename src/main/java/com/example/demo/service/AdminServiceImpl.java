package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.AdminDao;
import com.example.demo.entity.User;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public void updateRestoreRequest(String uid) {
		adminDao.updateRestoreRequest(uid);		
	}

	@Override
	public List<User> getDeltedUserList(int page) {
		int offset = (page - 1) * 10;
		List<User> list = adminDao.deletedUserList(offset);
		return list;
	}

	@Override
	public int getDeletedUserCount() {
		int count = adminDao.getDeletedUserCount();
		return count;
		
	}

	@Override
	public void restoreUser(String uid) {
		adminDao.restoreUser(uid);
	}
	
	
}
