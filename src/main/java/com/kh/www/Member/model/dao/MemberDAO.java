package com.kh.www.Member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	public int dupid(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne(statement, parameter);
	}
	
}
