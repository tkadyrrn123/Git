package com.kh.www.Member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	
	// 아파트 검색 팝업창 이동
	@RequestMapping("AptSearch.me")
	public String aptSearchView() {
		return "../Apart/joinAptSearch";
	}
	
}
