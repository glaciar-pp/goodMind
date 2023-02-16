package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.entity.DiaryBoard;

@Mapper
public interface DiaryBoardDao {
	// sql내의 table명 수정시 여기도 확인 (diary_Board에서 diaboard로 바뀜)
	// sql내의 table명 한번 더 바뀜 (diaboard -> diaryBoard로 바뀜) 2/9 
	@Select("SELECT d.did, d.uid, d.title, d.content, d.modTime, "
			+ "d.files, u.uname from diaryBoard AS d " 
			+ "JOIN users AS u ON d.uid=u.uid "
			+ "WHERE d.isDeleted=0 and ${field} like #{query} and d.uid=#{uid}" // d.did -> did로 수정 + and이하 추가 2/10 -> did를 다시 d.uid=#{uid} 2/16b수정
			+ "ORDER BY did DESC limit 10 offset #{offset}") // limit 이하부터 추가 2/10
	public List<DiaryBoard> getDiaryBoardList(int offset, String field, String query, String uid); // uid 2/16b추가 (session)
	 
	@Select("SELECT COUNT(did) FROM diaryBoard AS d"
			+ "	JOIN users AS u"
			+ "	ON d.uid=u.uid"
			+ "	WHERE d.isDeleted=0 AND ${field} LIKE #{query} and d.uid=#{uid}") // and d.uid=#{uid} 2/16b추가
	public int getDiaryBoardCount(String field, String query, String uid); // uid 2/16b추가 (session)
	 
	@Select("select * from diaryBoard where did=#{did}")
	DiaryBoard getDiaryBoard(int did);
	 
	@Insert("insert into diaryBoard values(default,#{uid},#{title},#{content},default,default,#{files},#{score})") //score 추가 2/14
	void insertDiaryBoard(DiaryBoard diaryBoard);  // d-> diaryBoard 로 수정 2/3a-1
	//===2/1까지 write부분까지 dao 작성완료 
	 
	//===update부터는 2/3a 추가
	@Update("UPDATE diaryBoard SET ${field}=${field}+1 WHERE did=#{did}")
	void increaseCount(int did, String field);
	
	@Update("UPDATE diaryBoard SET title=#{title}, content=#{content}, "
			+ " modTime=NOW(), files=#{files}, score=#{score}, WHERE did=#{did}") // score 추가 2/14
	void updateDiaryBoard(DiaryBoard diaryBoard);
	
	@Update("UPDATE diaryBoard SET isDeleted=1 WHERE did=#{did}")
	void deleteDiaryBoard(int did);

	public int getDiaryBoardScore(int score);  // score 추가 2/14

	public int updateDiaryBoardScore(int score);  // score 추가 2/14
}
