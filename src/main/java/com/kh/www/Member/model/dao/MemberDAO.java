package com.kh.www.Member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Member.model.vo.Member;

@Repository
public class MemberDAO {

	public int dupid(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.dupid", id);
	}

	public int InsertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.InsertMember", m);
	}

	public Member Login(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.LoginMember", id);
	}
	
}
