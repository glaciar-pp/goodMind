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
	// 2/9 sql내의 table명 한번 더 바뀜 (diaboard -> diaryBoard로 바뀜)
	 @Select("SELECT d.did, d.uid, d.title, d.content, d.modTime, "
	 		+ "d.files, u.uname from diaryBoard AS d " 
	 		+ "JOIN users AS u ON d.uid=u.uid "
	 		+ "WHERE d.isDeleted=0 and ${field} like #{query} " // d.did -> did로 수정 + and이하 추가 2/10
	 		+ "ORDER BY did DESC limit 10 offset #{offset}") // limit 이하부터 추가 2/10
	 public List<DiaryBoard> getDiaryBoardList(int offset, String field, String query);
	 
	 @Select("SELECT COUNT(did) FROM diaryBoard AS d"
				+ "	JOIN users AS u"
				+ "	ON d.uid=u.uid"
				+ "	WHERE d.isDeleted=0 AND ${field} LIKE #{query}")
		public int getDiaryBoardCount(String field, String query);
	 
	 @Select("select * from diaryBoard where did=#{did}")
	 DiaryBoard getDiaryBoard(int did);
	 
	 @Insert("insert into diaryBoard values(default,#{uid},#{title},#{content},default,default,#{files})")
	 void insertDiaryBoard(DiaryBoard diaryborad);  //<-2/3a-1  d-> diaryBoard 로 수정
	 //===2/1까지 write부분까지 dao 작성==== 
	 
	 //===아래부터는 2/3a 추가
	 @Update("UPDATE diaryBoard SET ${field}=${field}+1 WHERE did=#{did}")
	 void increaseCount(int did, String field);

	 @Update("UPDATE diaryBoard SET title=#{title}, content=#{content}, "
			+ " modTime=NOW(), files=#{files} WHERE did=#{did}")
	 void updateDiaryBoard(DiaryBoard diaryBoard);

	 @Update("UPDATE diaryBoard SET isDeleted=1 WHERE did=#{did}")
	 void deleteDiaryBoard(int did);
	 
}
