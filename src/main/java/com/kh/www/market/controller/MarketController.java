package com.kh.www.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {
	@RequestMapping("market.ma")
	public String marketList() {
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
