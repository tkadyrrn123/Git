package com.kh.www.Member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.Member.model.vo.MemberCount;

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

	public ArrayList<Integer> newCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.newCount");
	}

	public MemberCount memberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.memberCount");
	}

	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.memberList");
	}

	public int dupNick(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("memberMapper.dupNick", nick);
	}
	
}
