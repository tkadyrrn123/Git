package com.kh.www.Vote.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.Vote.model.exception.VoteException;
import com.kh.www.Vote.model.service.VoteService;
import com.kh.www.Vote.model.vo.VChoice;
import com.kh.www.Vote.model.vo.VInvote;
import com.kh.www.Vote.model.vo.VKeyword;
import com.kh.www.Vote.model.vo.Vote;
import com.kh.www.comment.model.service.CommentService;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.Comment2;
import com.kh.www.common.model.vo.PageInfo;

@Controller
public class VoteController {
	
	@Autowired
	private VoteService vService;
	
	@Autowired
	private CommentService cService;
	
	// 투표목록 불러오기
	@RequestMapping("voteList.vo")
	public ModelAndView voteList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, @RequestParam(value="option", required=false) String option, @RequestParam(value="search", required=false) String search, @RequestParam(value="sOption", required=false) String sOption, HttpServletRequest request) {
		int currentPage = 1;
		// continue, finish, latest, total, content
		if(page != null) {
			currentPage = page;
		}
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String apt = loginUser.getAptName();
		if(option == null) {
			option = "latest";
		}
		// 최신순, 진행중 같은 정렬조건과 아파트이름, 검색조건등을 키워드에 넣음
		VKeyword keyword = new VKeyword(option, search, sOption, apt);
		
		int listCount = vService.getListCount(keyword);
		
		PageInfo pi = Pagenation.getPageInfoTen(currentPage, listCount);
		
		ArrayList<Vote> vlist = vService.getVoteList(pi, keyword);
		mv.addObject("vlist", vlist).addObject("pi", pi).addObject("keyword", keyword).setViewName("voteList");
		
		return mv;
	}
	
	//투표 작성페이지 이동
	@RequestMapping("writeVoteView.vo")
	public String writeVoteView() {
		return "writingVote";
	}
	
	//투표 작성기능
	@RequestMapping("writeVote.vo")
	public String writeVote(HttpServletRequest request) {
		String vName = request.getParameter("vTitle");
		String vEndDate = request.getParameter("vEnd");
		String vContent = request.getParameter("vContent");
		String[] clist = request.getParameterValues("vclist");
		String overlabYN = request.getParameter("overlab");
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		Date endDate = Date.valueOf(vEndDate);
		
		Vote v = new Vote(userId, vName, vContent, endDate, overlabYN);
		
		// 투표게시글을 DB에 넣은후 id값 반환
		int vId = vService.insertVote(v);
		
		int result = 0;
		if(vId > 0) {
			// 투표 후보 목록 ArrayList에 넣기
			ArrayList<VChoice> vclist = new ArrayList<VChoice>();
			for(int i=0; i<clist.length; i++) {
				VChoice vChoice = new VChoice(vId, clist[i]);
				vclist.add(vChoice);
			}
			result = vService.insertVChoice(vclist);
		}
		if(result > 0) {
			return "redirect:voteList.vo";
		}else {
			throw new VoteException("투표작성에 실패하였습니다.");
		}
	}
	
	@RequestMapping("voteDetail.vo")
	public ModelAndView votingDetail(@RequestParam ("vId") int vId, @RequestParam ("check") boolean check, @RequestParam("userId") String userId, @RequestParam ("page") Integer page, ModelAndView mv, HttpServletResponse response) {
		ArrayList<Comment> comment = cService.selectVoteComment(vId);
		ArrayList<Comment2> comment2 = cService.selectComment2();
		ArrayList<Comment> likeList = cService.selectLike();
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		Vote v = vService.selectVote(vId);
		ArrayList<VChoice> vclist = vService.selectVChoiceList(vId);
		ArrayList<Integer> vcIdList = new ArrayList<Integer>();
		for(VChoice vc : vclist) {
			vcIdList.add(vc.getVcId());
		}
		ArrayList<VInvote> vInlist = new ArrayList<VInvote>();
		if(!vcIdList.isEmpty()) {
			vInlist = vService.selectVInvoteList(vcIdList);
		}
		Member writer = vService.selectWriteUser(v.getUserId());
		mv.addObject("Vote", v).addObject("vclist", vclist).addObject("vInlist", vInlist).addObject("writer", writer).addObject("likeList", likeList).addObject("currentPage", currentPage).addObject("check", check).addObject("comment", comment).addObject("comment2", comment2).setViewName("voteDetail");
		// 캐시 없애서 뒤로가기 방지
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
		return mv;
	}
	
	@RequestMapping("choiseVote.vo")
	public ModelAndView choiseVote(@RequestParam("article_poll_fldpoll_egseq") int[] vcId, @RequestParam("vId") int vId, @RequestParam ("check") boolean check, @RequestParam ("page") Integer page, HttpServletRequest req, HttpServletResponse response, ModelAndView mv) {
		HttpSession session = req.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		ArrayList<VInvote> invoteList = new ArrayList<VInvote>();
		
		for(int i=0; i<vcId.length; i++) {
			invoteList.add(new VInvote(userId, vcId[i]));
		}
		
		int result = vService.insertVInvote(invoteList);
		if(result > 0) {
			return votingDetail(vId, check, userId, page, mv, response);
		}else {
			throw new VoteException("투표에 실패하였습니다.");
		}
	}
	
	@RequestMapping("voteModifyView.vo")
	public ModelAndView voteModifyView(@RequestParam ("vId") int vId, @RequestParam ("page") String page, ModelAndView mv) {
		Vote v = vService.selectVote(vId);
		ArrayList<VChoice> vclist = vService.selectVChoiceList(vId);
		mv.addObject("Vote", v).addObject("vclist", vclist).addObject("page", Integer.parseInt(page)).setViewName("voteModify");
		return mv;
	}
	
	@RequestMapping("voteModify.vo")
	public ModelAndView voteModify(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		int vId = Integer.parseInt(request.getParameter("vId"));
		int page = Integer.parseInt(request.getParameter("page"));
		String vName = request.getParameter("vTitle");
		String vEndDate = request.getParameter("vEnd");
		String vContent = request.getParameter("vContent");
		String[] clist = request.getParameterValues("vclist");
		String overlabYN = "N";
		System.out.println(overlabYN);
		if(request.getParameter("overlab") != null) {
			overlabYN = request.getParameter("overlab");
		}
		System.out.println(overlabYN);
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		Date endDate = Date.valueOf(vEndDate);
		Date today = new Date(new java.util.Date().getTime());
		Vote v = new Vote(userId, vName, vContent, endDate, overlabYN);
		v.setvId(vId);
		
		int result = 0;
		
		// 투표 후보 목록 ArrayList에 넣기
		ArrayList<VChoice> vclist = new ArrayList<VChoice>();
		for(int i=0; i<clist.length; i++) {
			VChoice vChoice = new VChoice(vId, clist[i]);
			vclist.add(vChoice);
		}
		
		// 원래 투표 후보 목록 ArrayList에 넣기
		ArrayList<VChoice> originVClist = vService.selectVChoiceList(vId);
		
		// 투표 진행중인지 종료인지 확인
		boolean check = today.before(endDate);
		
		// 투표 수정하기
		result = vService.updateVote(v,vclist,originVClist);
		
		if(result > 0) {
			return votingDetail(vId, check, userId, page, mv, response);
		} else {
			throw new VoteException("투표 수정에 실패하였습니다.");
		}
	}
	@RequestMapping("voteDelete.vo")
	public String voteDelete(@RequestParam ("vId") int vId) {
		ArrayList<VChoice> vclist = vService.selectVChoiceList(vId);
		int result = vService.deleteVote(vId,vclist);
		if(result > 0) {
			return "redirect:voteList.vo";
		}else {
			throw new VoteException("투표 글 삭제에 실패하였습니다.");
		}
	}
}
