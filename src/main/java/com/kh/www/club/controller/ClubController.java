package com.kh.www.club.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.www.club.model.service.ClubService;
import com.kh.www.club.model.vo.Club;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.PageInfo;



@Controller
public class ClubController {
	
	@Autowired
	private ClubService cService;
	
	@RequestMapping("clubList.cb")
	public String clubList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getListCount();
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<Club> list = cService.selectList(pi);
		
		
		
		return "club";
	}
	@RequestMapping("clubDetail.cb")
	public String clubDetail() {
		return "clubDetail";
	}
	@RequestMapping("clubUpdate.cb")
	public String clubUpdate() {
		return "clubUpdate";
	}
	
}
