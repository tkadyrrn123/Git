package com.kh.www.Notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.Notice.model.exception.NoticeException;
import com.kh.www.Notice.model.service.NoticeService;
import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.Comment;
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
		
		//공지사항 전체 리스트 갯수 가져오기
		int listCount = noticeService.getNoticeListCount(); 

		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		//공지사항 리스트 페이지 가져오기
		ArrayList<Notice> list = noticeService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("noticeList");
		}else {
			throw new NoticeException("공지사항 전체 조회에 실패했습니다.");
		}

		return mv;
	}
	
	@RequestMapping("noticeInsertView.no")//공지사항 신규 작성으로 이동
	public String boardinsertView() {
		return "noticeInsertForm";
	}
		
	@RequestMapping("noticeInsert.no") //공지사항 작성
	public String noticeInsert(@ModelAttribute Notice n, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, HttpSession session) {
	
		if(uploadFile != null && !uploadFile.isEmpty()) {
			
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				n.setOriginalFileName(uploadFile.getOriginalFilename());
				n.setRenameFileName(renameFileName);
			}
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getUserId();
		
		n.setUserId(id);
		int result = noticeService.insertNotice(n);
		
		if(result > 0) {
			return "redirect:noticeList.no"; //DB에 저장하고나면 목록으로 이동
		}else {
			throw new NoticeException("공지사항 등록에 실패하였습니다.");
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
	
	@RequestMapping("ndetail.no") //공지사항 상세조회
	public ModelAndView noticeDetail(@RequestParam("nNo") int nNo, @RequestParam("page") int page,
							  ModelAndView mv) {
		
		Notice notice = noticeService.selectNotice(nNo); //글번호 전체 내용 가져오기
		
		if(notice != null) {
			// 모델엔드뷰로 보드를 보낸다.
			mv.addObject("notice", notice)
			  .addObject("page", page)
			  .setViewName("noticeDetailView");
		}else {
			throw new NoticeException("공지사항 상세보기에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("noticeUpdateView.no") //수정하기 폼으로 이동 - 수정할 글 상세조회
	public ModelAndView noticeUpdateView(@RequestParam("nNo") int nNo, @RequestParam("page") int page, ModelAndView mv) {
		System.out.println(nNo);
		
		Notice notice = noticeService.selectUpdateNotice(nNo);
		
		if(notice != null) {
			mv.addObject("notice", notice).addObject("page", page).setViewName("noticeUpdateForm");
		}else {
			throw new NoticeException("공지사항 수정하기 폼 요청에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("noticeUpdate.no") //공지사항 업데이트
	public ModelAndView boardUpdateForm(@ModelAttribute Notice n, @RequestParam("reloadFile") MultipartFile reloadFile,
								  @RequestParam("page") int page, HttpServletRequest request, ModelAndView mv) {
		
		//업데이트 파일 있으면이 기존 파일을 삭제하고 업데이트 파일을 renameFileName에 새로 저장
		//글 수정 시 업데이트 파일을 새로 넣지 않으면 기존파일은 유지됨
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(n.getRenameFileName() != null) {
				deleteFile(n.getRenameFileName(), request);
			}
			
			String renameFileName = saveFile(reloadFile, request);
			if(renameFileName != null) {
				n.setOriginalFileName(reloadFile.getOriginalFilename());
				n.setRenameFileName(renameFileName);
			}
		}
		
		//공지사항 업데이트 - 파일만 업데이트(파일테이블)
		int result_file = noticeService.updateNotice_File(n);
		
		//공지사항 업데이트 - 글만 업데이트(노티스테이블)
		int result_Content = noticeService.updateNotice_Content(n);
		
		if(result_file > 0 || result_Content > 0) {
			mv.addObject("page",page)
			  .setViewName("redirect:ndetail.no?nNo="+n.getnNo());
		}else {
			throw new NoticeException("공지사항 수정에 실패했습니다.");
		}
		
		return mv;
	}
	
	//공지사항 수정시 기존에 업로드한 파일 삭제 
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	//댓글 리스트 가져오기
	@RequestMapping("cList.no")
	public void replyList(@RequestParam("nNo") int nNo, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Comment> clist = noticeService.noticeCommentList(nNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		try {
			gson.toJson(clist, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	
	//댓글 등록
	@RequestMapping("addNoticeComment.no")
	@ResponseBody //success 리턴을 위해
	public String addReply(@ModelAttribute Comment nc, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String ncUserId = loginUser.getUserId();
		
		nc.setrUserId(ncUserId);
		
		int result = noticeService.insertNoticeComment(nc);
		
		if(result > 0) {
			return "success";
		}else {
			throw new NoticeException("댓글 등록에 실패하였습니다.");
		}
		
	}
	
	//댓글 수정
	@RequestMapping("commentUpdate.no")
    @ResponseBody
    private int commentUpdate(@RequestParam int rNo, @RequestParam String rContent) throws Exception{
        
        Comment comment = new Comment();
        comment.setrNo(rNo);
        comment.setrContent(rContent);
        
        return noticeService.commentUpdate(comment);
    }
	
	//댓글 삭제
	@RequestMapping("commentUpdate.no{rNo}")
    @ResponseBody
    private int commentUpdate(@PathVariable int rNo) throws Exception{
        
        return noticeService.commentUpdate(rNo);
    }

}
