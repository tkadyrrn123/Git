package com.kh.www.Member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Member.model.dao.MemberDAO;
import com.kh.www.Member.model.vo.LevelCount;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.Member.model.vo.MemberCount;
import com.kh.www.admin.model.vo.SearchOption;
import com.kh.www.common.model.vo.PageInfo;

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

	@Override
	public ArrayList<Member> memberAllList(PageInfo pi) {
		return mDAO.memberAllList(sqlSession, pi);
	}

	@Override
	public int getListCount() {
		return mDAO.getListCount(sqlSession);
	}

	@Override
	public int getListCount(int num) {
		return mDAO.getListCount(sqlSession, num);
	}

	@Override
	public ArrayList<Member> memberAllList(PageInfo pi, int num) {
		return mDAO.memberAllList(sqlSession, pi, num);
	}

	@Override
	public int SearchListCount(SearchOption so, int num) {
		return mDAO.SearchListCount(sqlSession, so, num);
	}

	@Override
	public ArrayList<Member> SearchList(PageInfo pi, SearchOption so, int num) {
		return mDAO.SearchList(sqlSession, pi, so, num);
	}

	@Override
	public LevelCount levelCount() {
		return mDAO.levelCount(sqlSession);
	}

	@Override
	public int AcceptListCount() {
		return mDAO.AcceptCount(sqlSession);
	}

	@Override
	public ArrayList<Member> AcceptList(PageInfo pi) {
		return mDAO.AcceptList(sqlSession, pi);
	}

	@Override
	public int AcceptSelectCount(int num) {
		return mDAO.AcceptSelectCount(sqlSession, num);
	}

	@Override
	public ArrayList<Member> AcceptSelectList(PageInfo pi, int num) {
		return mDAO.AcceptSelectList(sqlSession, pi, num);
	}

	@Override
	public int searchAcceptCount(SearchOption so, int num) {
		return mDAO.searchAcceptCount(sqlSession, so, num);
	}

	@Override
	public ArrayList<Member> searchAcceptlist(PageInfo pi, SearchOption so, int num) {
		return mDAO.searchAcceptlist(sqlSession, pi, so, num);
	}

	@Override
	public int MemberAccept(String[] chkId) {
		return mDAO.MemberAccept(sqlSession, chkId);
	}

	@Override
	public int InsertAdmin(Member m) {
		return mDAO.InsertAdmin(sqlSession, m);
	}

	@Override
	public int MemberDelete(String[] chkId) {
		return mDAO.MemberDelete(sqlSession, chkId);
	}

}
