package com.kh.www.market.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	public int insertBoard(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("marketMapper.insertBoard");
	}
	
	public int writingMarket(SqlSessionTemplate sqlSession, Market m) {
		return sqlSession.insert("marketMapper.insertMarket",m);
	}
	
	public int insertFile(SqlSessionTemplate sqlSession, String renameFileName) {
		return sqlSession.insert("marketMapper.insertFile", renameFileName);
	}
	

}
