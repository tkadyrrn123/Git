package com.kh.www.Member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Member.model.dao.MemberDAO;
import com.kh.www.Member.model.vo.Member;

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

}
