package com.kh.www.club.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.www.club.model.exception.ClubException;
import com.kh.www.club.model.service.ClubService;
import com.kh.www.club.model.vo.Club;
import com.kh.www.common.Pagenation;
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
	public ModelAndView clubDetail(@RequestParam("clubName") String clubName, @RequestParam("page") int page, ModelAndView mv) {
		Club club = cService.selectClub(clubName);
		
		if(club != null) {
			mv.addObject("c", club);
			mv.addObject("page", page);
			mv.setViewName("clubDetail");
		}else {
			throw new ClubException("게시글 상세조회에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("clubUpdateForm.cb")
	public String clubUpdate() {
		return "clubUpdateForm";
	}
	
	@RequestMapping("clubInsertForm.cb")
	public String clubInsertForm() {
		return "clubInsertForm";
	}
	
	@RequestMapping("clubInsert.cb")
	public String clubInsert(@ModelAttribute Club c, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request  ) {
		System.out.println(c);
		System.out.println(uploadFile);
		int result1 = cService.insertBoard();
		int result2 = cService.insertClub(c);
		HashMap m = new HashMap();
		m.put("clubName", c.getClubName());
		m.put("user", "테스트1");
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
	public String clubDelte() {
		int result = cService.deleteClub();
		
		if(result > 0 ) {
			return "redirect:clubList.cb";
		}else {
			throw new ClubException("게시글 삭제에 실패했습니다.");
		}

	}
	
	@RequestMapping("ClubApply.cb")
	public String clubApply(@RequestParam("clubName") String clubName) {
		HashMap m = new HashMap();
		m.put("clubName", clubName);
		m.put("user", "테스트1");
		int result = cService.insertClubMember(m);
		
		if(result > 0 ) {
			return "redirect:clubDetail.cb";
		}else {
			throw new ClubException("동호회 가입에 실패했습니다.");
		}
	}
	
	
	
	
	
	

}
