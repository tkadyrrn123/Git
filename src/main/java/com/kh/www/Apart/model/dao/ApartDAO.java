package com.kh.www.Apart.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Apart.model.vo.Apart;
import com.kh.www.Member.model.vo.MemberCount;
import com.kh.www.admin.model.vo.SearchOption;
import com.kh.www.common.model.vo.PageInfo;

@Repository
public class ApartDAO {

	public int aptInsert(SqlSessionTemplate sqlSession, Apart apt) {
		return sqlSession.insert("aptMapper.aptInsert", apt);
	}

	public ArrayList<Apart> searchApt(SqlSessionTemplate sqlSession, String text) {
		return (ArrayList)sqlSession.selectList("aptMapper.searchApt", text);
	}

	public String donglist(SqlSessionTemplate sqlSession, String name) {
		return sqlSession.selectOne("aptMapper.donglist", name);
	}
	
	public int aptDupName(SqlSessionTemplate sqlSession, String name) {
	    return sqlSession.selectOne("aptMapper.aptDupName", name);
	}

	public ArrayList<Apart> apartList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("aptMapper.apartList");
	}

	public MemberCount aptCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("aptMapper.aptCount");
	}

	public int aptlistCount(SqlSessionTemplate sqlSession, int num) {
		return sqlSession.selectOne("aptMapper.aptlistCount", num);
	}

	public ArrayList<Apart> apartAllList(SqlSessionTemplate sqlSession, PageInfo pi, Integer num) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aptMapper.aptAlllist", num, rowBounds);
	}

	public int acceptlistCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("aptMapper.acceptlistCount");
	}

	public ArrayList<Apart> aptAcceptList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aptMapper.aptAcceptList", null, rowBounds);
	}

	public int searchApartCount(SqlSessionTemplate sqlSession, SearchOption so, int num) {
		HashMap<String,Object> hm = new HashMap<String, Object>();
		hm.put("so", so);
		hm.put("num", num);
		return sqlSession.selectOne("aptMapper.searchApartCount", hm);
	}

	public ArrayList<Apart> SearchApartList(SqlSessionTemplate sqlSession, PageInfo pi, SearchOption so, int num) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		HashMap<String,Object> hm = new HashMap<String, Object>();
		hm.put("so", so);
		hm.put("num", num);
		
		return (ArrayList)sqlSession.selectList("aptMapper.searchApartList", hm, rowBounds);
	}

	public int searchAptAcceptCount(SqlSessionTemplate sqlSession, SearchOption so) {
		
		HashMap<String,Object> hm = new HashMap<String, Object>();
		hm.put("so", so);
		
		return sqlSession.selectOne("aptMapper.searchAptAcceptCount", hm);
	}

	public ArrayList<Apart> searchAptAcceptList(SqlSessionTemplate sqlSession, PageInfo pi, SearchOption so) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		HashMap<String,Object> hm = new HashMap<String, Object>();
		hm.put("so", so);
		
		return (ArrayList)sqlSession.selectList("aptMapper.searchAptAcceptList", hm, rowBounds);
	}

	public int ApartAccept(SqlSessionTemplate sqlSession, String[] chkId) {
		return sqlSession.update("aptMapper.ApartAccept", chkId);
	}

	public int ApartDelete(SqlSessionTemplate sqlSession, String[] chkId) {
		return sqlSession.delete("aptMapper.ApartDelete", chkId);
	}

	public Apart info(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("aptMapper.info", userId);
	}

}
