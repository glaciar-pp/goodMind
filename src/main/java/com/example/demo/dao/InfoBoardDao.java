package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.entity.InfoBoard;
import com.example.demo.entity.InfoLikeList;

@Mapper
public interface InfoBoardDao {

	@Select("SELECT b.infoBid, b.uid, b.title, b.filename, b.modTime, "
			+ "	b.viewCount, b.likeCount, u.uname FROM infoBoard AS b"
			+ "	JOIN users AS u"
			+ "	ON b.uid=u.uid"
			+ "	WHERE b.isDeleted=0 AND ${field} LIKE #{query}"
			+ "	ORDER BY infoBid DESC"
			+ "	LIMIT 12 OFFSET #{offset}")
	public List<InfoBoard> getInfoBoardList(int offset, String field, String query);

	@Select("SELECT COUNT(infoBid) FROM infoBoard AS b"
			+ "	JOIN users AS u"
			+ "	ON b.uid=u.uid"
			+ "	WHERE b.isDeleted=0 AND ${field} LIKE #{query}")
	public int getInfoBoardCount(String field, String query);
	
	@Select("SELECT b.infoBid, b.uid, b.title, b.filename, b.content, b.modTime, b.viewCount,"
			+ "	b.files, u.uname FROM infoBoard AS b"
			+ "	JOIN users AS u"
			+ "	ON b.uid=u.uid"
			+ "	WHERE b.infoBid=#{infoBid}")
	public InfoBoard getInfoBoard(int infoBid);
	
	@Update("UPDATE infoBoard SET ${field}=${field}+1 WHERE infoBid=#{infoBid}")
	public void increaseCount(int infoBid, String field);

	@Insert("INSERT INTO infoBoard VALUES(DEFAULT, #{uid}, #{title}, #{filename}, #{content},"
			+ " DEFAULT, DEFAULT, DEFAULT, #{files}, default)")
	public void insertInfoBoard(InfoBoard infoBoard);

	@Update("UPDATE infoBoard SET title=#{title}, filename=#{filename}, content=#{content}, "
			+ " modTime=NOW(), files=#{files} WHERE infoBid=#{infoBid}")
	public void updateInfoBoard(InfoBoard infoBoard);
	
	@Update("UPDATE infoBoard SET title=#{title}, filename=#{filename}, content=#{content}, "
			+ " modTime=NOW(), files=#{files} WHERE infoBid=#{infoBid}")
	public void updateWithImageInfoBoard(InfoBoard infoBoard);

	@Update("UPDATE infoBoard SET isDeleted=1 WHERE infoBid=#{infoBid}")
	public void deleteInfoBoard(int infoBid);
	
	@Select("select * from infoBoard where uid=#{uid} ORDER BY infoBid DESC")
	List<InfoBoard> getInfoBoardListByUid(String uid);

	@Select("select likeCount from infoBoard where infoBid=#{infoBid}")
	public int getLikeCount(int infoBid);

	@Insert("insert into infoLikeTable values(default, #{infoBid}, #{uid}, default)")
	public void insertLike(InfoLikeList infoLike);

	@Select("select * from infoLikeTable where infoBid=#{infoBid} and uid=#{uid}")
	public InfoLikeList getLikeEntry(int infoBid, String uid);

}
