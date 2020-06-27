package com.kh.www.Member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Member.model.dao.MemberDAO;
import com.kh.www.Member.model.vo.BoardType;
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

	@Override
	public int createCount(String aptName) {
		return mDAO.createCount(sqlSession, aptName);
	}

	@Override
	public MemberCount AptMemberCount(String aptName) {
		return mDAO.AptMemberCount(sqlSession, aptName);
	}

	@Override
	public ArrayList<Member> AptMemberfiveList(String aptName) {
		return mDAO.AptMemberfiveList(sqlSession, aptName);
	}

	@Override
	public int AptMemberlistCount(String aptName, int num) {
		return mDAO.AptMemberlistCount(sqlSession, aptName, num);
	}

	@Override
	public ArrayList<Member> AptMemberList(PageInfo pi, String aptName, int num) {
		return mDAO.AptMemberList(sqlSession, pi, aptName, num);
	}

	@Override
	public int AptAdminMemberSearchCount(SearchOption so, int num, String aptName) {
		return mDAO.AptAdminMemberSearchCount(sqlSession, so, num, aptName);
	}

	@Override
	public ArrayList<Member> AptAdminMemberSearchList(PageInfo pi, SearchOption so, int num, String aptName) {
		return mDAO.AptAdminMemberSearchList(sqlSession, pi, so, num, aptName);
	}

	@Override
	public int AptAdminAcceptCount(String aptName) {
		return mDAO.AptAdminAcceptCount(sqlSession, aptName);
	}

	@Override
	public ArrayList<Member> AptAdminAcceptList(PageInfo pi, String aptName) {
		return mDAO.AptAdminAcceptList(sqlSession, pi, aptName);
	}

	@Override
	public int AptAdminAccept(String[] chkId) {
		return mDAO.AptAdminAccept(sqlSession, chkId);
	}

	@Override
	public int AptAdminDelete(String[] chkId) {
		return mDAO.AptAdminDelete(sqlSession, chkId);
	}

	@Override
	public int AptAdminSearchCount(SearchOption so, String aptName) {
		return mDAO.AptAdminSearchCount(sqlSession, so, aptName);
	}

	@Override
	public ArrayList<Member> AptAdminSearchList(PageInfo pi, SearchOption so, String aptName) {
		return mDAO.AptAdminSearchList(sqlSession, pi, so, aptName);
	}

	@Override
	public int AdminAptMemberDelete(String userId) {
		return mDAO.AdminAptMemberDelete(sqlSession, userId);
	}

	@Override
	public String idSearch(String email) {
		return mDAO.idSearch(sqlSession, email);
	}

	@Override
	public int searchPwdAlter(String userId, String uuid) {
		return mDAO.searchPwdAlter(sqlSession, userId, uuid);
	}

	@Override
	public ArrayList<BoardType> fiveBoardList(String aptName) {
		return mDAO.fiveBoardList(sqlSession, aptName);
	}

	@Override
	public int AptBoardListCount(String aptName) {
		return mDAO.AptBoardListCount(sqlSession, aptName);
	}

	@Override
	public ArrayList<BoardType> AptBoardList(PageInfo pi, String aptName) {
		return mDAO.AptBoardList(sqlSession, pi, aptName);
	}

	@Override
	public int AptBoardSearchListCount(SearchOption so, String aptName) {
		return mDAO.AptBoardSearchListCount(sqlSession, so, aptName);
	}

	@Override
	public ArrayList<BoardType> AptBoardSearchList(PageInfo pi, SearchOption so, String aptName) {
		return mDAO.AptBoardSearchList(sqlSession, pi, so, aptName);
	}

	@Override
	public String idSearch(String user_Id, String user_email) {
		return mDAO.idSearch(sqlSession, user_Id, user_email);
	}


}
