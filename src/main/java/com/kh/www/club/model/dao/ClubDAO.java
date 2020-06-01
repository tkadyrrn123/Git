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

}
