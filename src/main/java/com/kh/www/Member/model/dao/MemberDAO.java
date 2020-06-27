package com.kh.www.Member.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Member.model.vo.BoardType;
import com.kh.www.Member.model.vo.LevelCount;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.Member.model.vo.MemberCount;
import com.kh.www.admin.model.vo.SearchOption;
import com.kh.www.common.model.vo.PageInfo;

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

	public ArrayList<Member> memberAllList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.memberAll",null,rowBounds);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getListCount");
	}

	public int getListCount(SqlSessionTemplate sqlSession, int num) {
		return sqlSession.selectOne("memberMapper.selectListCount", num);
	}

	public ArrayList<Member> memberAllList(SqlSessionTemplate sqlSession, PageInfo pi, int num) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", num, rowBounds);
	}

	public int SearchListCount(SqlSessionTemplate sqlSession, SearchOption so, int num) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("so", so);
		hm.put("num", num);
		return sqlSession.selectOne("memberMapper.searchListCount", hm);
	}

	public ArrayList<Member> SearchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchOption so, int num) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("so", so);
		hm.put("num", num);
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.searchList", hm, rowBounds);
	}

	public LevelCount levelCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.levelCount");
	}

	public int AcceptCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.AcceptCount");
	}

	public ArrayList<Member> AcceptList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.AcceptList",null,rowBounds);
	}

	public int AcceptSelectCount(SqlSessionTemplate sqlSession, int num) {
		return sqlSession.selectOne("memberMapper.AcceptSelectCount", num);
	}

	public ArrayList<Member> AcceptSelectList(SqlSessionTemplate sqlSession, PageInfo pi, int num) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.AcceptSelectList", num, rowBounds);
	}

	public int searchAcceptCount(SqlSessionTemplate sqlSession, SearchOption so, int num) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("so", so);
		hm.put("num", num);
		
		return sqlSession.selectOne("memberMapper.searchAcceptCount", hm);
	}

	public ArrayList<Member> searchAcceptlist(SqlSessionTemplate sqlSession, PageInfo pi, SearchOption so, int num) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("so", so);
		hm.put("num", num);
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.searchAcceptList", hm, rowBounds);
	}

	public int MemberAccept(SqlSessionTemplate sqlSession, String[] chkId) {
		System.out.println("dao: " + Arrays.toString(chkId));
		return sqlSession.update("memberMapper.MemberAccept",chkId);
	}

	public int InsertAdmin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.InsertAdmin", m);
	}

	public int MemberDelete(SqlSessionTemplate sqlSession, String[] chkId) {
		return sqlSession.delete("memberMapper.MemberDelete", chkId);
	}
//========================== 관리사무소 =========================================
	public int createCount(SqlSessionTemplate sqlSession, String aptName) {
		return sqlSession.selectOne("memberMapper.createCount", aptName);
	}

	public MemberCount AptMemberCount(SqlSessionTemplate sqlSession, String aptName) {
		return sqlSession.selectOne("memberMapper.AptMemberCount", aptName);
	}

	public ArrayList<Member> AptMemberfiveList(SqlSessionTemplate sqlSession, String aptName) {
		return (ArrayList)sqlSession.selectList("memberMapper.AptMemberfiveList", aptName);
	}

	public int AptMemberlistCount(SqlSessionTemplate sqlSession, String aptName, int num) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("aptName", aptName);
		hs.put("num", num);
		return sqlSession.selectOne("memberMapper.AptMemberlistCount", hs);
	}

	public ArrayList<Member> AptMemberList(SqlSessionTemplate sqlSession, PageInfo pi, String aptName, int num) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("aptName", aptName);
		hs.put("num", num);
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.AptMemberList", hs, rowBounds);
	}

	public int AptAdminMemberSearchCount(SqlSessionTemplate sqlSession, SearchOption so, int num, String aptName) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("aptName", aptName);
		hs.put("num", num);
		hs.put("so", so);
		
		return sqlSession.selectOne("memberMapper.AptAdminMemberSearchCount", hs);
	}

	public ArrayList<Member> AptAdminMemberSearchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchOption so,
													  int num, String aptName) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("aptName", aptName);
		hs.put("num", num);
		hs.put("so", so);
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.AptAdminMemberSearchList", hs);
	}

	public int AptAdminAcceptCount(SqlSessionTemplate sqlSession, String aptName) {
		return sqlSession.selectOne("memberMapper.AptAdminAcceptCount", aptName);
	}

	public ArrayList<Member> AptAdminAcceptList(SqlSessionTemplate sqlSession, PageInfo pi, String aptName) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.AptAdminAcceptList", aptName, rowBounds);
	}

	public int AptAdminAccept(SqlSessionTemplate sqlSession, String[] chkId) {
		return sqlSession.update("memberMapper.AptAdminAccept", chkId);
	}

	public int AptAdminDelete(SqlSessionTemplate sqlSession, String[] chkId) {
		return sqlSession.delete("memberMapper.AptAdminDelete", chkId);
	}

	public int AptAdminSearchCount(SqlSessionTemplate sqlSession, SearchOption so, String aptName) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("so", so);
		hs.put("aptName", aptName);
		
		return sqlSession.selectOne("memberMapper.AptAdminSearchCount", hs);
	}

	public ArrayList<Member> AptAdminSearchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchOption so,
												String aptName) {
		
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("so", so);
		hs.put("aptName", aptName);
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.AptAdminSearchList", hs, rowBounds);
	}

	public int AdminAptMemberDelete(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.AdminAptMemberDelete", userId);
	}

	public String idSearch(SqlSessionTemplate sqlSession, HashMap<String, Object> hs) {
		return sqlSession.selectOne("memberMapper.idSearch", hs);
	}

	public int searchPwdAlter(SqlSessionTemplate sqlSession, String userId, String uuid) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("userId", userId);
		hs.put("uuid", uuid);
		
		return sqlSession.update("memberMapper.searchPwdAlter", hs);
	}

	public ArrayList<BoardType> fiveBoardList(SqlSessionTemplate sqlSession, String aptName) {
		return (ArrayList)sqlSession.selectList("memberMapper.fiveBoardList", aptName);
	}

	public int AptBoardListCount(SqlSessionTemplate sqlSession, String aptName) {
		return sqlSession.selectOne("memberMapper.AptBoardListCount", aptName);
	}

	public ArrayList<BoardType> AptBoardList(SqlSessionTemplate sqlSession, PageInfo pi, String aptName) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.AptBoardList", aptName, rowBounds);
	}

	public int AptBoardSearchListCount(SqlSessionTemplate sqlSession, SearchOption so, String aptName) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("so", so);
		hs.put("aptName", aptName);
		
		return sqlSession.selectOne("memberMapper.AptBoardSearchListCount", hs);
	}

	public ArrayList<BoardType> AptBoardSearchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchOption so,
												   String aptName) {
		
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("so", so);
		hs.put("aptName", aptName);
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.AptBoardSearchList", hs, rowBounds);
	}

	public String idSearch(SqlSessionTemplate sqlSession, String user_Id, String user_email) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("userId", user_Id);
		hs.put("email", user_email);
		
		return sqlSession.selectOne("memberMapper.passSearchId", hs);
	}

	
}
