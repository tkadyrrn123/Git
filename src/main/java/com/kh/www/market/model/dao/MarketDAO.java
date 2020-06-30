package com.kh.www.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.market.model.vo.Market;

@Repository("mDAO")
public class MarketDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("marketMapper.getListCount");
	}

	public ArrayList<Market> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("marketMapper.selectList", null, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Market m) {
		return sqlSession.insert("marketMapper.insertBoard",m);
	}
	
	public int writingMarket(SqlSessionTemplate sqlSession, Market m) {
		return sqlSession.insert("marketMapper.insertMarket",m);
	}
	
	public int insertFile(SqlSessionTemplate sqlSession, String renameFileName) {
		return sqlSession.insert("marketMapper.insertFile", renameFileName);
	}

	public Market selectMarketList(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("marketMapper.selectMarketList", boardNo);
	}

	public int upCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("marketMapper.upCount", boardNo);
	}
	
	public int deleteMarket(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("marketMapper.deleteMarket",boardNo);
	}

	public Market selectUpdateMarket(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("marketMapper.selectUpdateMarket", boardNo);
	}

	public int updateMarket(SqlSessionTemplate sqlSession, Market ma) {
		return sqlSession.update("marketMapper.updateMarket", ma);
	}

	public int updatePrice(SqlSessionTemplate sqlSession, Market ma) {
		return sqlSession.update("marketMapper.updatePrice", ma);
	}

	public int insertComment(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.insert("marketMapper.insertComment", c);
	}

	public ArrayList<Comment> selectComment(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectComment", boardNo);
	}

	public int getFilterResultListCount(SqlSessionTemplate sqlSession, HashMap hm) {
		return sqlSession.selectOne("marketMapper.selectFilterResultCount",hm);
	}

	public ArrayList<Market> selectFilterResultList(SqlSessionTemplate sqlSession, HashMap hm, PageInfo pi) {
		hm.put("pi", pi);
		return (ArrayList)sqlSession.selectList("marketMapper.selectFilterResultList", hm);
	}

	public ArrayList<Comment> selectRList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectRList", boardNo);
	}

	public int insertFiles(SqlSessionTemplate sqlSession, String renameFileName) {
		return sqlSession.insert("marketMapper.insertFiles", renameFileName);
	}

	public int modifyReply(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.update("marketMapper.modifyReply", c);
	}

	public int deleteComment(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.update("marketMapper.deleteComment",rNo);
	}

	public int updateMarketFile(SqlSessionTemplate sqlSession, Market ma) {
		return sqlSession.update("marketMapper.updateFile",ma);
	}


}
