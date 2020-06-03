package com.kh.www.club.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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



@Controller
public class ClubController {
	
	@Autowired
	private ClubService cService;
	
	@RequestMapping("clubList.cb")
	public String clubList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
//		int currentPage = 1;
//		if(page != null) {
//			currentPage = page;
//		}
//		
//		int listCount = cService.getListCount();
//		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
//		
//		ArrayList<Club> list = cService.selectList(pi);
//		
		
		
		return "club";
	}
	@RequestMapping("clubDetail.cb")
	public String clubDetail() {
		return "clubDetail";
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
		int result3 = 1;
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			if(renameFileName != null) {
				if(result2 > 0) {
					result3 = cService.insertFile(renameFileName);
				}
			}
		}
		System.out.println("result1" + result1 + "result2" + result2 + "result3" + result3);
		if(result1 >0 && result2 > 0 && result3 > 0) {
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
	

	

	
	
	

}
