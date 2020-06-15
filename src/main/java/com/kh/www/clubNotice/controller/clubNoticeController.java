package com.kh.www.clubNotice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.Notice.model.exception.NoticeException;
import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.clubNotice.model.service.ClubNoticeService;
import com.kh.www.clubNotice.model.vo.ClubNotice;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.PageInfo;

@Controller
public class clubNoticeController {
	
	@Autowired
	private ClubNoticeService ClubNoticeService;
	
	@RequestMapping("clubNoticeList.cn") //동호회-공지사항 리스트
	public ModelAndView clubNoticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		//공지사항 전체 리스트 갯수 가져오기
		int listCount = ClubNoticeService.getCNoticeListCount(); 

		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		//공지사항 리스트 페이지 가져오기
		ArrayList<ClubNotice> list = ClubNoticeService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("clubNoticeList");
		}else {
			throw new NoticeException("동호회 공지사항 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
//	@RequestMapping("cnoticeInsertView.cn")//동호회 공지사항 신규 작성으로 이동
//	public String boardinsertView() {
//		return "clubNoticeInsertForm";
//	}
	
	//동호회 공지사항 신규 작성으로 이동 및 동호회 이름 리스트 가져오기
	@RequestMapping("cnoticeInsertView.cn")
	public ModelAndView clubNameList(ModelAndView mv) {
		
		//공지사항 리스트 페이지 가져오기
		ArrayList<String[]> cNamelist = new ArrayList<>();
		cNamelist = ClubNoticeService.selectcNamelist();
		
		//System.out.println("Controller에서 뽑아보는 cNameList : " + cNamelist);
		
		if(cNamelist != null) {
			mv.addObject("cNamelist", cNamelist);
			mv.setViewName("clubNoticeInsertForm");
		}else {
			throw new NoticeException("동호회 공지사항 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	
	@RequestMapping("clubNoticeInsert.cn") //동호회-공지사항 작성
	public String noticeInsert(@ModelAttribute ClubNotice cn, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, HttpSession session) {
	
		if(uploadFile != null && !uploadFile.isEmpty()) {
			
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				cn.setOriginalFileName(uploadFile.getOriginalFilename());
				cn.setRenameFileName(renameFileName);
			}
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getUserId();
		
		cn.setUserId(id);
		int result = ClubNoticeService.insertNotice(cn);
		
		if(result > 0) {
			return "redirect:clubNoticeList.cn"; //DB에 저장하고나면 목록으로 이동
		}else {
			throw new NoticeException("동호회 공지사항 등록에 실패하였습니다.");
		}
		
	}
	
	//첨부파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ "."
								+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName; //리네임 파일만 디비에 저장함 
	}
		
	@RequestMapping("cndetail.cn") //동호회-공지사항 상세조회
	public ModelAndView noticeDetail(@RequestParam("cnNo") int cnNo, @RequestParam("page") int page,
							  ModelAndView mv) {
		
		ClubNotice ClubNotice = ClubNoticeService.selectclubNotice(cnNo); //글번호 전체 내용 가져오기
		
		if(ClubNotice != null) {
			// 모델엔드뷰로 보드를 보낸다.
			mv.addObject("ClubNotice", ClubNotice)
			  .addObject("page", page)
			  .setViewName("clubNoticeDetailView");
		}else {
			throw new NoticeException("공지사항 상세보기에 실패했습니다.");
		}
		return mv;
	}
			
		
}
