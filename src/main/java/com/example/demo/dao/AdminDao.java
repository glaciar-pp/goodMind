package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.entity.User;

@Mapper
public interface AdminDao {
	
	@Update("UPDATE users SET restoreRequest = 1 WHERE uid = #{uid}")
	int updateRequestRequest(String uid);
	
	@Select("SELECT * FROM users WHERE isDeleted=1 "
			+ "	ORDER BY regDate DESC, uid"
			+ "	LIMIT 10 OFFSET #{offset}")
	public List<User> deletedUserList(int offset);
	
	@Select("Select count(uid) from users where isDeleted=1")
	int getDeletedUserCount();

	@Update("UPDATE users SET restoreRequest = 0, isdeleted = 0 WHERE uid = #{uid}")
	void restoreUser(String uid);
	
	
}
