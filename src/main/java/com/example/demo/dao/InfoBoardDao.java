package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.entity.InfoBoard;

@Mapper
public interface InfoBoardDao {

	@Select("SELECT b.infoBid, b.uid, b.title, b.modTime, "
			+ "	b.viewCount, u.uname FROM infoBoard AS b"
			+ "	JOIN users AS u"
			+ "	ON b.uid=u.uid"
			+ "	WHERE b.isDeleted=0 AND ${field} LIKE #{query}"
			+ "	ORDER BY infoBid DESC"
			+ "	LIMIT 10 OFFSET #{offset}")
	public List<InfoBoard> getInfoBoardList(int offset, String field, String query);

	@Select("SELECT COUNT(infoBid) FROM infoBoard AS b"
			+ "	JOIN users AS u"
			+ "	ON b.uid=u.uid"
			+ "	WHERE b.isDeleted=0 AND ${field} LIKE #{query}")
	public int getInfoBoardCount(String field, String query);
	
	@Select("SELECT b.infoBid, b.uid, b.title, b.content, b.modTime, b.viewCount,"
			+ "	b.files, u.uname FROM infoBoard AS b"
			+ "	JOIN users AS u"
			+ "	ON b.uid=u.uid"
			+ "	WHERE b.infoBid=#{infoBid}")
	public InfoBoard getInfoBoard(int infoBid);
	
	@Update("UPDATE infoBoard SET ${field}=${field}+1 WHERE infoBid=#{infoBid}")
	public void increaseCount(int infoBid, String field);

	@Insert("INSERT INTO infoBoard VALUES(DEFAULT, #{uid}, #{title}, #{content},"
			+ " DEFAULT, DEFAULT, DEFAULT, #{files})")
	public void insertInfoBoard(InfoBoard infoBoard);

	@Update("UPDATE infoBoard SET title=#{title}, content=#{content}, "
			+ " modTime=NOW(), files=#{files} WHERE infoBid=#{infoBid}")
	public void updateInfoBoard(InfoBoard infoBoard);

	@Update("UPDATE infoBoard SET isDeleted=1 WHERE infoBid=#{infoBid}")
	public void deleteInfoBoard(int infoBid);
	
	@Select("select * from infoBoard where uid=#{uid} ORDER BY infoBid DESC")
	List<InfoBoard> getInfoBoardListByUid(String uid);
}
