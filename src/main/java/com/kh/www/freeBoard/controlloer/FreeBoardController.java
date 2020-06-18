 package com.kh.www.freeBoard.controlloer;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.freeBoard.model.exception.FreeBoardException;
import com.kh.www.freeBoard.model.service.FreeBoardService;
import com.kh.www.freeBoard.model.vo.FreeBoard;


@Controller
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeService;
	
	
	@RequestMapping("list.fr")
	public ModelAndView freeBoardListView(@RequestParam(value="page", required=false) Integer page, 
										ModelAndView mv, HttpSession session) throws FreeBoardException{		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String aptName = loginUser.getAptName();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = freeService.getListCount(aptName);
		
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<FreeBoard> list = freeService.selectList(pi, aptName);
		
	//	System.out.println("list.fr "+list);
		if(list !=null) {
			// 보낼 것 : list, pi, 
			// 갈 화면 정해야함 : view
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("freeBoardList");
		} else {
			throw new FreeBoardException("게시글 조회 실패");
		}
		
		return mv;
	}
	
	
	@RequestMapping("writing.fr")
	public String writingFreeBoardView() {		
		
		return"writingFree";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
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
		
		return renameFileName;
	}
	
	@RequestMapping("insert.fr")
	public String insertFreeBoard(@ModelAttribute FreeBoard fb, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, HttpSession session) throws FreeBoardException {
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				fb.setFileName(renameFileName);
				
			}
		}
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getUserId();
		fb.setUserId(id);
		System.out.println("insert.fr 세션id : " + id);
		
		int result = freeService.insertBoard(fb); 
		
		
		if(result > 0) {
			return "redirect:list.fr";
		} else {
			throw new FreeBoardException("게시물 등록 실패");
		}
		
	}
	
	@RequestMapping("bdetail.fr")
	public ModelAndView freeDetail(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page,
							 ModelAndView mv) {
		
		FreeBoard fb = freeService.selectFreeBoard(boardNo);
		
		
		if(fb != null) {
			mv.addObject("fb", fb)
			  .addObject("page", page)
			  .setViewName("detailFree");
		} else {
			throw new FreeBoardException("자게 상세 조회 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("bdelete.fr")
	public String deleteFree(@RequestParam("boardNo") int boardNo) {
		int result = freeService.deleteFree(boardNo);
		
		if(result > 0) {
			return "redirect:list.fr";
		} else {
			throw new FreeBoardException("삭제 실패!");
		}
	}
	
	@RequestMapping("modifyView.fr")
	public ModelAndView modifyFreeView(@RequestParam("boardNo") int boardNo, @RequestParam(value="page", required=false) int page,
									ModelAndView mv) {
		FreeBoard fb = freeService.selectUpdateFreeBoard(boardNo);
		
	//	System.out.println("modifyView.fr fb 오냐???? : " +fb);
		
		if(fb != null) {
			mv.addObject("fb", fb).addObject("page", page).setViewName("modifyingFree");
			return mv;
		} else {
			throw new FreeBoardException("수정하러 가기 실패 ");
		}
	}
	
	@RequestMapping("update.fr")
	public ModelAndView updateFree(@ModelAttribute FreeBoard fb, @RequestParam("reloadFile") MultipartFile reloadFile,
								@RequestParam("page") int page, HttpServletRequest request, ModelAndView mv) {
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(fb.getFileName() != null) {
				deleteFile(fb.getFileName(), request);
			}
			
			String fileName = saveFile(reloadFile, request);
			
			if(fileName != null) {
				fb.setFileName(fileName);
			}
		}
		int resultFile = freeService.updateFreeFile(fb);
		
		int result = freeService.updateFreeBoard(fb);
		
		if(result > 0 || resultFile > 0) {
			mv.addObject("page", page);
			mv.setViewName("redirect:bdetail.fr?boardNo=" + fb.getBoardNo());
		} else {
			throw new FreeBoardException("수정 실패!");
		}
		return mv;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
		
	}


	@RequestMapping("rList.fr")
	public void replyList(@RequestParam("boardNo") int boardNo, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Comment> list = freeService.selectRList(boardNo);
	//	System.out.println("댓글리스트 받아옴? "+list);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("addReply.fr")
	@ResponseBody
	public String addReply(@ModelAttribute Comment c, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String rUserId = loginUser.getUserId();
		
		c.setrUserId(rUserId);
		
	//	System.out.println("addReply.fr의 c는 방아오는지??? "+ c);
		int result = freeService.insertReply(c);
		
		if(result > 0) {
			return "success";
		} else {
			throw new FreeBoardException("댓글 등록 실패!");
		}
		
	}
	
	@RequestMapping("commentModify.fr")
    @ResponseBody
    private int commentModify(@RequestParam int rNo, @RequestParam String rContent) {
        
        Comment comment = new Comment();
        comment.setrNo(rNo);
        comment.setrContent(rContent);
        
        return freeService.commentModify(comment);
    }


	
}
