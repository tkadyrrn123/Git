package com.kh.www.market.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.www.common.Pagination;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.market.model.service.MarketService;

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
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		
		
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
