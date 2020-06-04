package com.kh.www.market.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.market.model.service.MarketService;
import com.kh.www.market.model.vo.Market;

@Controller
public class MarketController {
	
	@Autowired
	private MarketService mService;
	
	@RequestMapping("market.ma")
	public String marketList(@RequestParam("page") Integer page) {
		
		int listCount = mService.getListCount();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		PageInfo pi = Pagenation.getPageInfo(currentPage,listCount);
		
		ArrayList<Market> list = mService.selectList(pi);
		
		
		
		return "marketList";
	}
	
	@RequestMapping("marketDetail.ma")
	public String marketDetail() {
		return "marketDetail";
	}
	
	@RequestMapping("writingMarket.ma")
	public String writingMarket() {
		return "writingMarket";
	}
}
