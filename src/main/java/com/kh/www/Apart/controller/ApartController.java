package com.kh.www.Apart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		}else {
			model.addAttribute("msg", "검색결과가 없습니다.");
		}
		return "joinAptSearch";
	}
	
	// 카카오 지도
//	@RequestMapping(value = "address", method = RequestMethod.GET)
//	public Map<String, Object> address(String loc) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		// 서비스에서 주소를 가져오는 메소드 호출
//		String address = aptService.address(loc);
//		map.put("address", address);
//		return map;
//	}
	
	// 아파트 정보
	@RequestMapping("information.apt")
	public String information(@RequestParam("userId") String userId, Model model) {
		Apart apt = aptService.info(userId);
		if(apt != null) {
			model.addAttribute("apt", apt);
		}else {
			model.addAttribute("msg", "아파트 위치 조회에 실패했습니다.");
		}
		return "information";
	}
	// 아파트 인사말	
	@RequestMapping("welcome.apt")
	public String welcome() {
		return "welcome";
	}
}
