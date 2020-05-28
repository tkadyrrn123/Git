package com.kh.www.Member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("AptSearch.me")
	public String aptSearchView() {
		return "joinAptSearch";
	}
	
}
