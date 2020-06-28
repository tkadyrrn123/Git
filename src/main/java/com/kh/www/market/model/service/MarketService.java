package com.kh.www.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.kh.www.common.model.vo.Comment;
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

	int insertComment(Comment c);

	ArrayList<Comment> selectComment(int boardNo);

	int getFilterResultListCount(HashMap hm);

	ArrayList<Market> selectFilterResultList(HashMap hm, PageInfo pi);

	ArrayList<Comment> selectRList(int boardNo);

	int insertFiles(String renameFileName);

	int modifyReply(Comment c);

	int deleteComment(int rNo);

	int updateMarketFile(Market ma);


}
