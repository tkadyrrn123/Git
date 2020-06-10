package com.kh.www.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.www.Apart.model.service.ApartService;
import com.kh.www.Apart.model.vo.Apart;
import com.kh.www.Member.model.service.MemberService;
import com.kh.www.Member.model.vo.LevelCount;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.Member.model.vo.MemberCount;
import com.kh.www.admin.model.vo.SearchOption;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.PageInfo;

import oracle.sql.ARRAY;
import sun.security.krb5.internal.PAData;

@SessionAttributes({"mall","lvCnt"})
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
		//회원가입된  멤버 카운트
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
	//회원 전체 목록 리스트
	@RequestMapping("MemberList.adm")
	public String memberList(Model model,@RequestParam(value="page", required = false) Integer page, HttpSession session) {
		
		int currentPage = 1;
		int num = 0;
		
		if(page != null) {
			currentPage = page;
		}
		
		// 회원 수
		int listCount = mService.getListCount();
		//회원 페이징
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		//회원 리스트
		ArrayList<Member> mAllList = mService.memberAllList(pi);
		
		
		model.addAttribute("mlist", mAllList)
			 .addAttribute("pi",pi)
			 .addAttribute("num",num);
		
		return "AdminMemberList";
	}
	
	@RequestMapping("selectList.adm")
	public String acceptList(Model model,@RequestParam(value="page", required = false) Integer page,
							 @RequestParam("num") int num) throws IOException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		// 회원 수
		int listCount = mService.getListCount(num);
		//페이징
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		//회원 리스트
		ArrayList<Member> mAllList = mService.memberAllList(pi,num);
		
		System.out.println(listCount);
		model.addAttribute("mlist", mAllList)
			 .addAttribute("pi",pi)
			 .addAttribute("num",num);
		
		return "AdminMemberList";
	}
	
	@RequestMapping("searchMember.adm")
	public String searchMember(@RequestParam("searchOption") String searchOption, @RequestParam("searchText") String text,
							   @RequestParam(value="page", required = false) Integer page, @RequestParam("num") int num,
							   Model model) {
		
		SearchOption so = new SearchOption();
		if(searchOption.equals("회원아이디")) {
			so.setUserId(text);
		}else if(searchOption.equals("닉네임")) {
			so.setNickName(text);
		}else if(searchOption.equals("이름")) {
			so.setUserName(text);
		}else if(searchOption.equals("전화번호")) {
			so.setPhone(text);
		}else if(searchOption.equals("이메일")) {
			so.setEmail(text);
		}else if(searchOption.equals("아파트")) {
			so.setAptName(text);
		}
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		//회원수 
		int listCount = mService.SearchListCount(so, num);
		//페이징
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		//회원 리스트
		ArrayList<Member> mAllList = mService.SearchList(pi, so, num);
		
		
		model.addAttribute("mlist", mAllList)
			 .addAttribute("pi",pi)
			 .addAttribute("num",num)
			 .addAttribute("searchOption", searchOption)
		     .addAttribute("searchText", text);
		
		return "AdminMemberList";
	}
	
	@RequestMapping("AcceptList.adm")
	public String AcceptList(@RequestParam(value="page", required = false) Integer page,
							 Model model) {
		int num=1;
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		//승인 대기 인원수
		LevelCount levCount = mService.levelCount();
		// 회원 수
		int listCount = mService.AcceptListCount();
		//페이징
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		//회원 리스트
		ArrayList<Member> mAllList = mService.AcceptList(pi);
		
		model.addAttribute("lvCnt", levCount)
		     .addAttribute("mlist", mAllList)
			 .addAttribute("pi", pi)
			 .addAttribute("num", num);
		
		return "AdminAccept";
	}
	
	@RequestMapping("Acceptselect.adm")
	public String Acceptselect(@RequestParam(value="page", required = false) Integer page, @RequestParam("num") int num,
							   Model model) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		// 회원 수
		int listCount = mService.AcceptSelectCount(num);
		//페이징
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		//리스트
		ArrayList<Member> mAllList = mService.AcceptSelectList(pi,num);
		
		
		model.addAttribute("pi", pi)
		     .addAttribute("mlist", mAllList)
		     .addAttribute("num", num);
		
		return "AdminAccept";
	}
	
	@RequestMapping("searchAccept.adm")
	public String searchAccept(@RequestParam("searchOption") String searchOption, @RequestParam("searchText") String text,
			                   @RequestParam(value="page", required = false) Integer page, @RequestParam("num") int num,
							   Model model) {
		
		
		SearchOption so = new SearchOption();
		if(searchOption.equals("회원아이디")) {
			so.setUserId(text);
		}else if(searchOption.equals("닉네임")) {
			so.setNickName(text);
		}else if(searchOption.equals("이름")) {
			so.setUserName(text);
		}else if(searchOption.equals("전화번호")) {
			so.setPhone(text);
		}else if(searchOption.equals("이메일")) {
			so.setEmail(text);
		}else if(searchOption.equals("아파트")) {
			so.setAptName(text);
		}
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		//회원수 
		int listCount = mService.searchAcceptCount(so, num);
		System.out.println(listCount);
		//페이징
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		//리스트
		ArrayList<Member> mAllList = mService.searchAcceptlist(pi, so, num);
		
		System.out.println(pi);
		
		model.addAttribute("pi", pi)
		     .addAttribute("mlist", mAllList)
		     .addAttribute("num", num)
		     .addAttribute("searchOption", searchOption)
		     .addAttribute("searchText", text);
		
		return "AdminAccept";
	}
	
	@RequestMapping("MemberAccept.adm")
	public String MemberAccept(@RequestParam(value="chkId", required = false) String[] chkId, @RequestParam("num") int num
			                   ,Model model) {
		
		
		System.out.println(num);
		System.out.println(Arrays.toString(chkId));
		
		mService.MemberAccept(chkId);
		
		LevelCount levCount = mService.levelCount();
		
		model.addAttribute("lvCnt", levCount)
		     .addAttribute("num", num);
		
		if(num==1) {
			return "redirect:AcceptList.adm"; 
		}else if(num==2) {
			return "redirect:Acceptselect.adm";
		}else {
			return "redirect:Acceptselect.adm";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
