package com.kh.www.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.market.model.dao.MarketDAO;
import com.kh.www.market.model.vo.Market;

@Service("mService")
public class MarketServiceImpl implements MarketService {

	@Autowired
	private MarketDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return mDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Market> selectList(PageInfo pi) {
		return mDAO.selectList(sqlSession, pi);
	}
	
}
