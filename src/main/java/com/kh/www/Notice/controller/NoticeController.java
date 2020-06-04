package com.kh.www.Notice.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.Notice.model.exception.NoticeException;
import com.kh.www.Notice.model.service.NoticeService;
import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.PageInfo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("noticeList.no") //공지사항 리스트
	public ModelAndView noticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
	
		if(page != null) {
			currentPage = page;
		}
		int listCount = noticeService.getNoticeListCount(); 

		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = noticeService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("noticeList");
		}

		return mv;
	}
	
	@RequestMapping("noticeInsertView.no")//공지사항 신규 작성
	public String boardinsertView() {
		return "noticeInsertForm";
	}
	
	@RequestMapping(value="noticelogin.no", method=RequestMethod.GET)
	public String memberLogin(String userId, String userPwd, HttpSession session) {
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		
		session.setAttribute("loginUser", m);
		
		
		System.out.println("임시 로그인  : "+ m);

		
		return "noticeList";
	}
	
	@RequestMapping("noticeInsert.no") //공지사항 등록
	public String noticeInsert(@ModelAttribute Notice n, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, HttpSession session) {
		//글쓰기 완료하면 리스트로 넘어감
		//제목, 타이틀, 업로드 파일 넣기
		
		System.out.println("db가기전 n:"+n);
		if(uploadFile != null && !uploadFile.isEmpty()) { //파일이 있으면
			//아래 만들어놓은 세이브파일 메소드 불러옴
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				n.setOriginalFileName(uploadFile.getOriginalFilename());
				n.setRenameFileName(renameFileName);
			}
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getUserId();
		
		System.out.println("세션에서 가져온 id->"+id);
		n.setUserId(id);
		int result = noticeService.insertNotice(n);
		System.out.println("db다녀온 n:"+n);
		
		if(result > 0) {
			return "redirect:noticeList.no"; //DB에 저장하고나면 목록으로 이동
		}else {
			throw new NoticeException("공지사항 등록에 실패하였습니다.");
		}
		
	}
	
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources"); //작은 리소시스의 위치
		String savePath = root + "\\nuploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) { //폴더가 존재하지 않으면
			folder.mkdirs(); //폴더를 만들어줘라
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
		
		return renameFileName;
	}
}
