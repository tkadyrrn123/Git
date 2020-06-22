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
import com.kh.www.common.model.vo.Comment2;
import com.kh.www.common.model.vo.PageInfo;



@Controller
public class ClubController {
	
	@Autowired
	private ClubService cService;
	
// 동호회 리스트 불러오기	
	@RequestMapping("clubList.cb")
	public ModelAndView clubList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getListCount();
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<Club> list = cService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("pi", pi);
			mv.setViewName("club");
		} else {
			throw new ClubException("게시글 전체 조회에 실패했습니다.");
		}
		
		
		return mv;
	}
	
// 동호회 상세 페이지	
	@RequestMapping("clubDetail.cb")
	public ModelAndView clubDetail(@RequestParam("clubName") String clubName, @RequestParam(value="page", required=false) Integer page, @RequestParam("boardNo") int boardNo, @RequestParam("userId") String userId, ModelAndView mv) {
		Club club = cService.selectClub(clubName);
		ArrayList<Comment> comment = cService.selectComment(boardNo);
		ArrayList<Comment2> comment2 = cService.selectComment2();

		
		HashMap m = new HashMap();
		m.put("clubName", clubName);
		m.put("userId", userId);
		
		int result = cService.checkClubMember(m);
		if(club != null) {
			mv.addObject("c", club);
			mv.addObject("page", page);
			mv.addObject("comment", comment);
			mv.addObject("comment2", comment2);
			mv.addObject("result", result);
			mv.setViewName("clubDetail");
		}else {
			throw new ClubException("게시글 상세조회에 실패했습니다.");
		}
		return mv;
	}

// 동호회 수정 폼 이동	
	@RequestMapping("clubUpdateForm.cb")
	public ModelAndView clubUpdateForm(@ModelAttribute Club c, HttpServletRequest request,@RequestParam("userId") String userId, HttpServletResponse response, ModelAndView mv) {
		mv.addObject("c", c);
		mv.addObject("userId", userId);
		mv.setViewName("clubUpdateForm");
		return mv;
	}

// 동호회 수정	
	@RequestMapping("updateClub.cb")
	public String clubUpdate(@ModelAttribute Club c, @RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response, Model mv) {
		
		
		
		int result = cService.updateClub(c);

		mv.addAttribute("clubName", c.getClubName());
		mv.addAttribute("boardNo", c.getBoardNo());
		mv.addAttribute("userId", userId);

		return "redirect:clubDetail.cb";
	}	
	
	
// 동호회 등록 폼 이동	
	@RequestMapping("clubInsertForm.cb")
	public String clubInsertForm() {
		return "clubInsertForm";
	}

// 동호회 등록	
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

	
// 파일 업로드	
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
	
// 동호회 삭제	
	@RequestMapping("deleteClub.cb")
	public String clubDelte(@RequestParam("boardNo") Integer boardNo) {
		int result = cService.deleteClub(boardNo);
		
		if(result > 0 ) {
			return "redirect:clubList.cb";
		}else {
			throw new ClubException("게시글 삭제에 실패했습니다.");
		}

	}

	// 동호회 가입하기	
		@RequestMapping("ClubApply.cb")
		public String clubApply(@RequestParam("clubName") String clubName, @RequestParam("userId") String userId, @RequestParam("boardNo") Integer boardNo, Model mv) {
			HashMap m = new HashMap();
			m.put("clubName", clubName);
			m.put("user", userId);
			int result = cService.insertClubMember(m);
			
			if(result > 0 ) {
				mv.addAttribute("clubName", clubName);
				mv.addAttribute("boardNo", boardNo);
				mv.addAttribute("userId", userId);
				return "redirect:clubDetail.cb";
			}else {
				throw new ClubException("동호회 가입에 실패했습니다.");
			}
		}
		
// 동호회 탈퇴	
		@RequestMapping("ClubOut.cb")
		public String clubOut(@RequestParam("clubName") String clubName, @RequestParam("userId") String userId, @RequestParam("boardNo") Integer boardNo, Model mv) {
			HashMap m = new HashMap();
			m.put("clubName", clubName);
			m.put("userId", userId);
			int result = cService.deleteClubMember(m);
			if(result > 0 ) {
				mv.addAttribute("clubName", clubName);
				mv.addAttribute("boardNo", boardNo);
				mv.addAttribute("userId", userId);
				return "redirect:clubDetail.cb";
			}else {
				throw new ClubException("동호회 탈퇴에 실패했습니다.");
			}
		}		

	
// 동호회 댓글 추가	
	@RequestMapping("insertComment.cb")
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
	
//	동호회 댓글 수정
	@RequestMapping("updateComment.cb")
	@ResponseBody
	public ArrayList<Comment> updateComments(@RequestParam("boardNo") int boardNo, @RequestParam("content") String content, @RequestParam("rNo") int rNo, HttpServletResponse response) {
		Comment c = new Comment();
		c.setrNo(rNo);
		c.setBoardNo(boardNo);
		c.setrContent(content);
		
		int result = cService.updateComment(c);
		
		if(result > 0) {
			ArrayList<Comment> comment = cService.selectComment(boardNo);
			return comment;
			
		}else {
			throw new ClubException("댓글 수정에 실패했습니다.");
		}
		
	}
	
// 동호회 댓글 삭제	
	@RequestMapping("deleteComment.cb")
	public String deleteComment(@RequestParam("clubName") String clubName, @RequestParam("userId") String userId, @RequestParam("boardNo") Integer boardNo, Model mv, @RequestParam("rNo") int rNo) {
		
		
		int result = cService.deleteComment(rNo);
		if(result > 0 ) {
			mv.addAttribute("clubName", clubName);
			mv.addAttribute("boardNo", boardNo);
			mv.addAttribute("userId", userId);
			return "redirect:clubDetail.cb";
		
		}else {
			throw new ClubException("댓글 삭제에 실패했습니다.");
		}
	}
	@RequestMapping("deleteComment2.cb")
	@ResponseBody
	public int deleteComment2(@RequestParam("rNo") int rNo) {
		
		int result = cService.deleteComment(rNo);
		return result;
	}
	
// 동호회 대댓글 추가	
	@RequestMapping("insertComment2.cb")
	@ResponseBody
	public ArrayList<Comment2> insertComments2(@RequestParam("userId") String userId, @RequestParam("rNo") int rNo, @RequestParam("content") String content, HttpServletResponse response) {
		Comment2 c = new Comment2();
		c.setrNo(rNo);
		c.setrContent(content);
		c.setrUserId(userId);

		int result = cService.insertComment2(c);
		
		if(result > 0) {
			ArrayList<Comment2> comment2 = cService.selectComment2(rNo);
			return comment2;
			
		}else {
			throw new ClubException("댓글 등록에 실패했습니다.");
		}
		
	}
// 동호회 대댓글 삭제	
	@RequestMapping("deleteComment3.cb")
	@ResponseBody
	public int deleteComment3(@RequestParam("rrNo") int rrNo) {
		
		int result = cService.deleteComment3(rrNo);
		return result;
	}
	
//	동호회 대댓글 수정
	@RequestMapping("updateComment3.cb")
	@ResponseBody
	public int updateComment2(@RequestParam("content") String content, @RequestParam("rrNo") int rrNo, HttpServletResponse response) {
		Comment2 c = new Comment2();
		c.setRrNo(rrNo);
		c.setrContent(content);
		
		int result = cService.updateComment2(c);
		
		if(result > 0) {

			return result;
			
		}else {
			throw new ClubException("댓글 수정에 실패했습니다.");
		}
		
	}	
}
