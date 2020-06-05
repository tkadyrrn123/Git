package com.kh.www.market.model.service;

import java.util.ArrayList;

import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.market.model.vo.Market;

public interface MarketService {
	int getListCount();

	ArrayList<Market> selectList(PageInfo pi);

	int writingMarket(Market m);

	int insertBoard();

	int insertFile(String renameFileName);
}
