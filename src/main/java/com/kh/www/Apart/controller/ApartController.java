package com.kh.www.Apart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.www.Apart.model.exception.ApartException;
import com.kh.www.Apart.model.service.ApartService;
import com.kh.www.Apart.model.vo.Apart;


@Controller
public class ApartController {
	
	@Autowired
	private ApartService aptService;
	
	
	@RequestMapping("aptAdd.apt")
	public String aptInsert(@RequestParam("aptAdd_Name") String name, @RequestParam("address1") String address,
			                @RequestParam("aptAdd_dong") String[] dong, @RequestParam("aptAdd_phone") String phone,
			                Model model, HttpServletResponse response) throws IOException {
		
		System.out.println("이름:" + name);
		System.out.println("주소:" + address);
		System.out.println("동:" + Arrays.toString(dong));
		System.out.println("전화번호:" + phone);
		
		String dongjoin = String.join(",",dong);
		
		Apart apt = new Apart(name, dongjoin, address, phone);
		
		int result = aptService.aptInsert(apt);
		
		if(result>0) {
			model.addAttribute("msg","아파트를 신청하였습니다.");
			response.setContentType("text/html; charset=UTF-8");
			
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아파트를 신청하였습니다.'); history.go(-1);</script>");
            out.flush();


			return "redirect:index.jsp";
		}else {
			throw new ApartException("아파트 추가에 실패했습니다.");
		}
		
	}
	
	
	@RequestMapping("searchApt.apt")
	public String searchApt(@RequestParam("searchText") String text, Model model) {
		System.out.println("검색어: "+text);
		if(text.equals("")) {
			System.out.println("널값이네 ㅋ");
		}
		
		
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
