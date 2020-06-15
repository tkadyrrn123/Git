package com.kh.www.club.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.www.club.model.exception.ClubException;
import com.kh.www.club.model.service.ClubService;
import com.kh.www.club.model.vo.Club;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;



@Controller
public class ClubController {
	
	@Autowired
	private ClubService cService;
	
	@RequestMapping("clubList.cb")
	public ModelAndView clubList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getListCount();
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<Club> list = cService.selectList(pi);
		System.out.println(list);
		
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("pi", pi);
			mv.setViewName("club");
		} else {
			throw new ClubException("게시글 전체 조회에 실패했습니다.");
		}
		
		
		return mv;
	}
	@RequestMapping("clubDetail.cb")
	public ModelAndView clubDetail(@RequestParam("clubName") String clubName, @RequestParam(value="page", required=false) Integer page, @RequestParam("boardNo") int boardNo, ModelAndView mv) {
		Club club = cService.selectClub(clubName);
		ArrayList<Comment> comment = cService.selectComment(boardNo);
		System.out.println(comment);
		if(club != null) {
			mv.addObject("c", club);
			mv.addObject("page", page);
			mv.addObject("comment", comment);
			mv.setViewName("clubDetail");
		}else {
			throw new ClubException("게시글 상세조회에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("clubUpdateForm.cb")
	public ModelAndView clubUpdateForm(@ModelAttribute Club c, HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		System.out.println(c);
		mv.addObject("c", c);
		mv.setViewName("clubUpdateForm");
		return mv;
	}

	@RequestMapping("updateClub.cb")
	public String clubUpdate(@ModelAttribute Club c, HttpServletRequest request, HttpServletResponse response, Model mv) {
		System.out.println(c);
		int result = cService.updateClub(c);

		mv.addAttribute("clubName", c.getClubName());
		mv.addAttribute("boardNo", c.getBoardNo());

		return "redirect:clubDetail.cb";
	}	
	
	
	
	@RequestMapping("clubInsertForm.cb")
	public String clubInsertForm() {
		return "clubInsertForm";
	}
	
	@RequestMapping("clubInsert.cb")
	public String clubInsert(@RequestParam(value="writer", required=false) String writer ,@ModelAttribute Club c, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) {
		int result1 = cService.insertBoard(writer);
		int result2 = cService.insertClub(c);
		HashMap m = new HashMap();
		m.put("clubName", c.getClubName());
		m.put("user", writer);
		int result3 = cService.insertClubMember(m);
		int result4 = 1;
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			if(renameFileName != null) {
				if(result2 > 0 && result3 > 0) {
					result4 = cService.insertFile(renameFileName);
				}
			}
		}
		if(result1 > 0 && result2 > 0 && result4 > 0 && result3> 0) {
			return "redirect:clubList.cb";
		} else {
			throw new ClubException("게시물 등록에 실패했습니다.");
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\clubFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ "."
								+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return renameFileName;
	}
	@RequestMapping("deleteClub.cb")
	public String clubDelte(@RequestParam("boardNo") Integer boardNo) {
		int result = cService.deleteClub(boardNo);
		
		if(result > 0 ) {
			return "redirect:clubList.cb";
		}else {
			throw new ClubException("게시글 삭제에 실패했습니다.");
		}

	}
	
	@RequestMapping("ClubApply.cb")
	public String clubApply(@RequestParam("clubName") String clubName, @RequestParam("userId") String userId, @RequestParam("boardNo") Integer boardNo, Model mv) {
		HashMap m = new HashMap();
		m.put("clubName", clubName);
		m.put("user", userId);
		int result = cService.insertClubMember(m);
		
		if(result > 0 ) {
			mv.addAttribute("clubName", clubName);
			mv.addAttribute("boardNo", boardNo);
			return "redirect:clubDetail.cb";
		}else {
			throw new ClubException("동호회 가입에 실패했습니다.");
		}
	}
	
	@RequestMapping(value="insertComment.cb")
	@ResponseBody
	public ArrayList<Comment> insertComments(@RequestParam("userId") String userId, @RequestParam("boardNo") int boardNo, @RequestParam("content") String content, HttpServletResponse response) {
		Comment c = new Comment();
		c.setBoardNo(boardNo);
		c.setrContent(content);
		c.setrUserId(userId);

		int result = cService.insertComment(c);
		
		if(result > 0) {
			ArrayList<Comment> comment = cService.selectComment(boardNo);
			return comment;
			
		}else {
			throw new ClubException("댓글 등록에 실패했습니다.");
		}
		
	}
	
	
	
	

}
