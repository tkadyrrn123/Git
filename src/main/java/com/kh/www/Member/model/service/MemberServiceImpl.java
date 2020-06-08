package com.kh.www.Member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Member.model.dao.MemberDAO;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.Member.model.vo.MemberCount;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int dupid(String id) {
		return mDAO.dupid(sqlSession, id);
	}

	@Override
	public int InsertMember(Member m) {
		return mDAO.InsertMember(sqlSession, m);
	}

	@Override
	public Member Login(String id) {
		return mDAO.Login(sqlSession, id);
	}

	@Override
	public ArrayList<Integer> newCount() {
		return mDAO.newCount(sqlSession);
	}

	@Override
	public MemberCount memberCount() {
		return mDAO.memberCount(sqlSession);
	}

	@Override
	public ArrayList<Member> memberList() {
		return mDAO.memberList(sqlSession);
	}

	@Override
	public int dupNick(String nick) {
		return mDAO.dupNick(sqlSession, nick);
	}

}
