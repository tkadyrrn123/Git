package com.kh.www.club.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.club.model.vo.Club;
import com.kh.www.common.model.vo.PageInfo;

@Repository("cDAO")
public class ClubDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		int listCount = sqlSession.selectOne("clubMapper.getListCount");
		return listCount;
	}

	public ArrayList<Club> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		return null;
	}

	public int insertClub(SqlSessionTemplate sqlSession, Club c) {
		return sqlSession.insert("clubMapper.insertClub", c);
	}

	public int insertBoard(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("clubMapper.insertBoard");
	}

	public int insertFile(SqlSessionTemplate sqlSession, String renameFileName) {
		return sqlSession.insert("clubMapper.insertFile", renameFileName);
	}

	public int deleteClub(SqlSessionTemplate sqlSession) {
		return sqlSession.update("clubMapper.deleteClub");
	}

}
