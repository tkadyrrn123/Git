package com.kh.www.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.www.Apart.model.service.ApartService;
import com.kh.www.Apart.model.vo.Apart;
import com.kh.www.Member.model.service.MemberService;
import com.kh.www.Member.model.vo.BoardType;
import com.kh.www.Member.model.vo.LevelCount;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.Member.model.vo.MemberCount;
import com.kh.www.admin.model.vo.SearchOption;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.PageInfo;

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
	public String memberList(Model model,@RequestParam(value="page", required = false) Integer page) {
		
		int currentPage = 1;
		int num = 0;
		
		if(page != null) {
			currentPage = page;
		}
		//회원 상태
		MemberCount memberall = mService.memberCount();
		// 회원 수
		int listCount = mService.getListCount();
		//회원 페이징
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		//회원 리스트
		ArrayList<Member> mAllList = mService.memberAllList(pi);
		
		
		model.addAttribute("mlist", mAllList)
			 .addAttribute("mall",memberall)
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
		
		System.out.println(pi);
		
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
		System.out.println(pi);
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
		//승인 대기 인원수
		LevelCount levCount = mService.levelCount();
		// 회원 수
		int listCount = mService.AcceptSelectCount(num);
		//페이징
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		//리스트
		ArrayList<Member> mAllList = mService.AcceptSelectList(pi,num);
		
		
		model.addAttribute("pi", pi)
		     .addAttribute("mlist", mAllList)
		     .addAttribute("lvCnt", levCount)
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
		
		model.addAttribute("pi", pi)
		     .addAttribute("mlist", mAllList)
		     .addAttribute("num", num)
		     .addAttribute("searchOption", searchOption)
		     .addAttribute("searchText", text);
		
		return "AdminAccept";
	}
	
	@RequestMapping("MemberAccept.adm")
	public String MemberAccept(@RequestParam(value="accept", required = false) String accept, @RequestParam(value="delete", required = false) String delete,
							   @RequestParam(value="chkId", required = false) String[] chkId, @RequestParam("num") int num
			                   ,Model model) {
		
		System.out.println(chkId);
		System.out.println(accept);
		System.out.println(delete);
		System.out.println(num);
		
		if(accept!=null) {
			mService.MemberAccept(chkId);
		}else if(delete != null) {
			mService.MemberDelete(chkId);
		}
		
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
	
	@RequestMapping("ApartList.adm")
	public String ApartList(@RequestParam(value="page", required = false) Integer page, @RequestParam(value="num", required = false) Integer num,
							Model model) {
		int Num = 1;
		
		if(num != null) {
			Num = num;
		}
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		//아파트 카운트
		MemberCount aptall = aptService.aptCount();
		
		//아파트 리스트 카운트
		int listCount = aptService.aptlistCount(Num);
		//페이징
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		//리스트
		ArrayList<Apart> apartList = aptService.apartAllList(pi, num); 
		
		
		model.addAttribute("aptall", aptall)
			 .addAttribute("alist", apartList)
			 .addAttribute("pi", pi)
			 .addAttribute("num", Num);
		
		return "AdminApartList";
	}
	//아파트 승인 관리 페이지
	@RequestMapping("ApartAccept.adm")
	public String ApartAccept(@RequestParam(value="page", required = false) Integer page, Model model) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aptService.acceptlistCount();
		
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		
		ArrayList<Apart> alist = aptService.aptAcceptList(pi);
		
		model.addAttribute("pi", pi)
			 .addAttribute("alist", alist);
		
		return "AdminApartAccept";
	}
	@RequestMapping("searchApart.adm")
	public String searchApart(@RequestParam("searchOption") String searchOption, @RequestParam("searchText") String text,
					          @RequestParam(value="page", required = false) Integer page, @RequestParam("num") int num,
						      Model model) {
		
		SearchOption so = new SearchOption();
		if(searchOption.equals("아파트명")) {
			so.setAptName(text);
		}else if(searchOption.equals("전화번호")) {
			so.setPhone(text);
		}
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		MemberCount aptall = aptService.aptCount();
	
		int listCount = aptService.searchApartCount(so, num);
		
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		
		ArrayList<Apart> alist = aptService.SearchApartList(pi, so, num);
		
		model.addAttribute("pi", pi)
		     .addAttribute("alist", alist)
		     .addAttribute("aptall", aptall)
		     .addAttribute("num", num);
		
		return "AdminApartList";
	}
	
	@RequestMapping("searchAptAccept.adm")
	public String searchAptAccept(@RequestParam("searchOption") String searchOption, @RequestParam("searchText") String text,
						          @RequestParam(value="page", required = false) Integer page,
							      Model model) {
		
		SearchOption so = new SearchOption();
		if(searchOption.equals("아파트명")) {
			so.setAptName(text);
		}else if(searchOption.equals("전화번호")) {
			so.setPhone(text);
		}
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aptService.searchAptAcceptCount(so);
		
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		
		ArrayList<Apart> alist = aptService.searchAptAcceptList(pi, so);
		
		model.addAttribute("pi", pi)
	         .addAttribute("alist", alist);
		
		return "AdminApartAccept";
	}
	
	@RequestMapping("ApartAcceptexe.adm")
	public String ApartAccept(@RequestParam(value="chkId", required = false) String[] chkId,@RequestParam(value="accept", required = false) String accept, @RequestParam(value="delete", required = false) String delete,
            				  Model model) {
		System.out.println(chkId);
		System.out.println(delete);
		System.out.println(accept);
		if(accept != null) {
			aptService.ApartAccept(chkId);
		}else if(delete != null) {
			aptService.ApartDelete(chkId);
		}
		
		return "redirect:ApartAccept.adm";
	}
//=================================================아파트 관리사무소==============================================
	@RequestMapping("AptAdminMain.adm")
	public String AptAdminMain(HttpSession session,  Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String aptName= loginUser.getAptName();
		//회원가입 들어온 횟수
		int createCount = mService.createCount(aptName);
		//총 멤버 인원수
		MemberCount memberCount = mService.AptMemberCount(aptName);
		//멤버 리스트
		ArrayList<Member> mList = mService.AptMemberfiveList(aptName);
		//최근 게시물 5건
		ArrayList<BoardType> bList = mService.fiveBoardList(aptName);
		for(BoardType b : bList) {
			if(b.getFree() != 0) {
				b.setType("자유게시판");
			}else if(b.getMarket() != 0) {
				b.setType("중고마켓");
			}else if(b.getClub() != 0) {
				b.setType("동호회");
			}else if(b.getClubNotice() != 0) {
				b.setType("동호회공지");
			}
		}
		
		System.out.println("컨트롤러: " +bList);
		model.addAttribute("cCount", createCount)
		     .addAttribute("mCount", memberCount)
		     .addAttribute("bList", bList)
		     .addAttribute("mlist", mList);
		
		return "AptAdminMain";
	}
	
	@RequestMapping("AptAdminMemberList.adm")
	public String AptAdminMemberList(@RequestParam(value="page", required = false) Integer page, @RequestParam(value="num", required = false) Integer num,
									 HttpSession session,  Model model) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int Num = 1;
		
		if(num != null) {
			Num = num;
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String aptName= loginUser.getAptName();
		
		//총 멤버 인원수
		MemberCount memberCount = mService.AptMemberCount(aptName);
		//리스트 카운트
		int listCount = mService.AptMemberlistCount(aptName, Num);
		//페이징
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		//리스트 
		ArrayList<Member> mlist = mService.AptMemberList(pi, aptName, Num);
		
		System.out.println(Num);
		
		model.addAttribute("mCount", memberCount)
			 .addAttribute("num", Num)
			 .addAttribute("pi", pi)
			 .addAttribute("mlist", mlist);
		
		
		
		return "AptAdminMemberList";
	}
	
	@RequestMapping("AptAdminMemberSearch.adm")
	public String AptAdminMemberSearch(@RequestParam("searchOption") String searchOption, @RequestParam("searchText") String text,
							           @RequestParam(value="page", required = false) Integer page, @RequestParam("num") int num,
								       Model model, HttpSession session) {
		
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
		}
		
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String aptName= loginUser.getAptName();
		
		MemberCount memberCount = mService.AptMemberCount(aptName);
		int listCount = mService.AptAdminMemberSearchCount(so, num, aptName);
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		ArrayList<Member> mlist = mService.AptAdminMemberSearchList(pi, so, num, aptName);
		
		System.out.println("컨트롤러 : " + pi);
		
		model.addAttribute("mCount", memberCount)
			 .addAttribute("searchOption", searchOption)
		     .addAttribute("searchText", text)
		     .addAttribute("num", num)
		     .addAttribute("pi", pi)
		     .addAttribute("mlist", mlist);
		
		return "AptAdminMemberList";
		
	}
	
	@RequestMapping("AptAdminAcceptList.adm")
	public String AptAdminAcceptList(@RequestParam(value="page", required = false) Integer page,
		                             Model model, HttpSession session) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String aptName = loginUser.getAptName();
		
		int listCount = mService.AptAdminAcceptCount(aptName);
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		ArrayList<Member> mlist = mService.AptAdminAcceptList(pi, aptName);
		
		model.addAttribute("mlist", mlist)
		     .addAttribute("pi", pi);
		
		return "AptAdminAccept";
	}
	
	@RequestMapping("AptAdminAccept.adm")
	public String AptAdminAccept(@RequestParam(value="accept", required = false) String accept, @RequestParam(value="delete", required = false) String delete,
			                     @RequestParam(value="chkId", required = false) String[] chkId,Model model) {
		
		if(accept != null) {
			mService.AptAdminAccept(chkId);
		}else if(delete != null) {
			mService.AptAdminDelete(chkId);
		}
		
		return "redirect:AptAdminAcceptList.adm";
	}
	
	@RequestMapping("AptAdminAcceptSearch.adm")
	public String AptAdminAcceptSearch(@RequestParam("searchOption") String searchOption, @RequestParam("searchText") String text,
							           @RequestParam(value="page", required = false) Integer page,
								       Model model, HttpSession session) {
		
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
		}
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String aptName= loginUser.getAptName();
		
		int listCount = mService.AptAdminSearchCount(so, aptName);
		PageInfo pi = Pagenation.getMemberInfo(currentPage, listCount);
		ArrayList<Member> mlist = mService.AptAdminSearchList(pi, so, aptName);
		
		model.addAttribute("searchOption", searchOption)
		     .addAttribute("searchText", text)
		     .addAttribute("pi", pi)
		     .addAttribute("mlist", mlist);
		
		return "AptAdminAccept";
	}
	
	@RequestMapping("AdminAptMemberDelete.adm")
	public String AdminAptMemberDelete(@RequestParam("id") String userId, @RequestParam("num") String num,
									   Model model) {
		System.out.println(num);
		mService.AdminAptMemberDelete(userId);
		
		model.addAttribute("num", num);
		return "redirect:AptAdminMemberList.adm";
	}
	
	@RequestMapping("AptBoardList.adm")
	public String AptBoardList() {
		
		return "AptAdminBoardList";
	}
}
