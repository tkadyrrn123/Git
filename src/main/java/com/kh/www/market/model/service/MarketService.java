package com.kh.www.market.model.service;

import java.util.ArrayList;

import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.market.model.vo.Market;

public interface MarketService {
	int getListCount();

	ArrayList<Market> selectList(PageInfo pi);

	int writingMarket(Market m);

	int insertBoard(Market m);

	int insertFile(String renameFileName);

	Market selectMarketList(int boardNo);

	int deleteMarket(int boardNo);

	Market selectUpdateMarket(int boardNo);

	int updateMarket(Market ma);

	int updatePrice(Market ma);
}
