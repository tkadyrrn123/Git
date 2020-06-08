package com.kh.www.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.www.Apart.model.service.ApartService;
import com.kh.www.Apart.model.vo.Apart;
import com.kh.www.Member.model.service.MemberService;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.Member.model.vo.MemberCount;

@Controller
public class Admincontroller {
	
	@Autowired
	private ApartService aptService;
	
	@Autowired
	private MemberService mService;
	
	//회원가입 신청한 회원이 몇명 있는지
	@RequestMapping("adminMain.adm")
	public String newCount(Model model) {
		
		//아파트신청,회원가입 인원수
		ArrayList<Integer> allcnt = mService.newCount();
		//회원가입된 모든 멤버 카운트
		MemberCount memberall = mService.memberCount();
		//가입된 멤버 5개
		ArrayList<Member> memberList = mService.memberList();
		//아파트 가입 리스트
		ArrayList<Apart> apartList = aptService.apartList();
		//아파트 가입 카운트
		MemberCount aptall = aptService.aptCount();
		
		model.addAttribute("newCount", allcnt)
		     .addAttribute("mall", memberall)
		     .addAttribute("mlist", memberList)
		     .addAttribute("alist", apartList)
			 .addAttribute("aall", aptall);
		
		return "AdminMain";
	}
	//로그아웃
	@RequestMapping("logout.adm")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:index.jsp";
	}
	
	
	
}
