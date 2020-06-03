package com.kh.www.club.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("cDAO")
public class ClubDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		int listCount = sqlSession.selectOne("clubMapper.getListCount");
		return listCount;
	}

}
