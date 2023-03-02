package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.entity.GenBoard;

@Mapper
public interface GenBoardDao {

	@Select("SELECT b.genBid, b.uid, b.title, b.modTime, "
			+ "	b.viewCount, b.replyCount, u.uname FROM genBoard AS b"
			+ "	JOIN users AS u"
			+ "	ON b.uid=u.uid"
			+ "	WHERE b.isDeleted=0 AND ${field} LIKE #{query}"
			+ "	ORDER BY genBid DESC"
			+ "	LIMIT 10 OFFSET #{offset}")
	public List<GenBoard> getGenBoardList(int offset, String field, String query);

	@Select("SELECT COUNT(genBid) FROM genBoard AS b"
			+ "	JOIN users AS u"
			+ "	ON b.uid=u.uid"
			+ "	WHERE b.isDeleted=0 AND ${field} LIKE #{query}")
	public int getGenBoardCount(String field, String query);
	
	@Select("SELECT b.genBid, b.uid, b.title, b.content, b.modTime, b.viewCount,"
			+ "	b.replyCount, b.files, u.uname FROM genBoard AS b"
			+ "	JOIN users AS u"
			+ "	ON b.uid=u.uid"
			+ "	WHERE b.genBid=#{genBid}")
	public GenBoard getGenBoard(int genBid);
	
	@Update("UPDATE genBoard SET ${field}=${field}+1 WHERE genBid=#{genBid}")
	public void increaseCount(int genBid, String field);

	@Insert("INSERT INTO genBoard VALUES(DEFAULT, #{uid}, #{title}, #{content},"
			+ " DEFAULT, DEFAULT, DEFAULT, DEFAULT, #{files})")
	public void insertGenBoard(GenBoard genBoard);

	@Update("UPDATE genBoard SET title=#{title}, content=#{content}, "
			+ " modTime=NOW(), files=#{files} WHERE genBid=#{genBid}")
	public void updateGenBoard(GenBoard genBoard);

	@Update("UPDATE genBoard SET isDeleted=1 WHERE genBid=#{genBid}")
	public void deleteGenBoard(int genBid);
	
	@Select("select * from genBoard where uid=#{uid} ORDER BY genBid DESC")
	List<GenBoard> getGenBoardListByUid(String uid);
	
}
