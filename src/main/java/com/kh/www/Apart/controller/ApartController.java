package com.kh.www.Apart.controller;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.www.Apart.model.service.ApartService;
import com.kh.www.Apart.model.vo.Apart;


@Controller
public class ApartController {
	
	@Autowired
	private ApartService aptService;
	
	
	@RequestMapping("searchApt.apt")
	public String searchApt(@RequestParam("searchText") String text, Model model) {
		System.out.println("검색어: "+text);
		
		ArrayList<Apart> list = aptService.searchApt(text);
		System.out.println(list);
		if(list != null) {
			model.addAttribute("list", list);
		}else {
			model.addAttribute("msg", "검색결과가 없습니다.");
		}
		return "joinAptSearch";
	}
	
}
