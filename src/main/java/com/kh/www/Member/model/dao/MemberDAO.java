package com.kh.www.Member.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
	
	
}
