package com.kh.www.market.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.market.model.dao.MarketDAO;

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
	
}
