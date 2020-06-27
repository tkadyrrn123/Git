package com.kh.www.market.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.comment.model.exception.CommentException;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.freeBoard.model.exception.FreeBoardException;
import com.kh.www.freeBoard.model.vo.SearchCondition;
import com.kh.www.market.model.exception.MarketException;
import com.kh.www.market.model.service.MarketService;
import com.kh.www.market.model.vo.Market;

@Controller
public class MarketController {
	
	@Autowired
	private MarketService marketService;
	
	@RequestMapping("market.ma")
	public ModelAndView marketList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, Model model) throws MarketException {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = marketService.getListCount();	
		
		
		PageInfo pi = Pagenation.getPageInfoMarket(currentPage,listCount);
		System.out.println("market pi : " + pi);
		
		ArrayList<Market> list = marketService.selectList(pi);
		
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("marketList");
		} else {
			throw new MarketException("게시글 전체 조회에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("writingMarket.ma")
	public String writingMarket() {
		return "writingMarket";
	}
	
	
	@RequestMapping("writing.ma")
	public String writing(@ModelAttribute Market m, HttpServletRequest request,HttpSession session, 
							MultipartHttpServletRequest multi) throws MarketException {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getUserId();
		m.setUserId(id);
		
		System.out.println("id : " + id);
		System.out.println(m.getUserId());
		
		int result = marketService.insertBoard(m);
		
		String renameFileName="";
		String filenames = "";
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()) {
			
			String upFile = files.next();
			System.out.println(upFile);
			MultipartFile mFile = multi.getFile(upFile);
			renameFileName = saveFile(mFile, request);
			if(renameFileName!=null) {
				filenames += renameFileName+",";
			} 
		}
		filenames = filenames.substring(0, filenames.length()-1);
		String[] fileArr = filenames.split(",");
		
		System.out.println(filenames);
		System.out.println(Arrays.toString(fileArr));
		
		int fileResult = marketService.insertFiles(filenames);
		
		if(result > 0 && fileResult > 0) {
			return "redirect:market.ma";
		} else {
			throw new MarketException("게시글 등록에 실패하였습니다.");
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/marketUploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		if(!file.getOriginalFilename().equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String originFileName = file.getOriginalFilename();
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." 
			+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
			
			originFileName.substring(originFileName.lastIndexOf(".") + 1);
			
			String renamePath = folder + "/" + renameFileName;
			
			try {
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return renameFileName;
		} else {
			return null;
		}
	}
	
	
	@RequestMapping("marketDetail.ma")
	public ModelAndView marketDetail(@RequestParam(value="boardNo",required=false) int boardNo, 
									 @RequestParam("page") int page, ModelAndView mv) {
		Market ma = marketService.selectMarketList(boardNo);
		String filenames = "";
		if(ma != null) {
			filenames = ma.getFileName();
		}
//		filenames = filenames.substring(0, filenames.length()-1);
		String[] fileArr = filenames.split(",");
		
		System.out.println("detail : " + filenames);
		System.out.println(Arrays.toString(fileArr));
		
		if(ma != null) {
			mv.addObject("ma",ma)
			  .addObject("page",page)
			  .addObject("fileArr", fileArr)
			  .setViewName("marketDetail");
		} else {
			throw new MarketException("상세글 조회에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("deleteMarket.ma")
	public String deleteMarket(@RequestParam(value="boardNo",required=false) Integer boardNo) {
		System.out.println("deleteNo : " + boardNo);
		int result = marketService.deleteMarket(boardNo);
		
		if(result > 0) {
			return "redirect:market.ma";
		} else {
			throw new MarketException("게시글 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("updateView.ma")
	public ModelAndView updateView(@RequestParam("boardNo") int boardNo, @RequestParam(value="page", required=false) int page, ModelAndView mv) {
		
		Market ma = marketService.selectUpdateMarket(boardNo);
		
		if(ma != null) {
			mv.addObject("ma", ma).addObject("page", page).setViewName("updateMarketView");
			return mv;
		} else {
			throw new MarketException("게시글 수정 폼 요청에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("updateMarket.ma")
	public ModelAndView updateMarket(@ModelAttribute Market ma, @RequestParam("reloadFile") MultipartFile reloadFile,@RequestParam("page") int page, HttpServletRequest request, ModelAndView mv ) {
		if(reloadFile != null && reloadFile.isEmpty()) {
			if(ma.getFileName() != null) {
				deleteFile(ma.getFileName(), request);
			}
			
			String fileName = saveFile(reloadFile, request);
			
			if(fileName != null) {
				ma.setFileName(fileName);
			}
		}
//		int resultFile = marketService.updateMarketFile(ma);
		
		int result = marketService.updateMarket(ma);
		int result2 = marketService.updatePrice(ma);
		
		
		if(result > 0 || result2 > 0){
			mv.addObject("page",page);
			mv.setViewName("redirect:marketDetail.ma?boardNo=" + ma.getBoardNo());
		} else {
			throw new MarketException("게시글 수정에 실패했습니다.");
		}
		
		return mv;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/marketUploadFiles";
		
		File f = new File(savePath + '/' + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("filter.ma")
	public ModelAndView filterMarket(@RequestParam(value="page", required=false) Integer page, HttpSession session, ModelAndView mv,
									@RequestParam(value="filterValue") String filterValue, @RequestParam(value="condition") String condition) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		SearchCondition sc = new SearchCondition();
		
		if(condition.equals("writer")) {
			sc.setWriter(filterValue);
		} else if(condition.equals("title")) {
			sc.setTitle(filterValue);
		} else if(condition.equals("content")) {
			sc.setContent(filterValue);
		}
		
		HashMap hm = new HashMap();
		hm.put("sc",sc);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = marketService.getFilterResultListCount(hm);
		
		PageInfo pi = Pagenation.getPageInfoMarket(currentPage, listCount);
		
		ArrayList<Market> list = marketService.selectFilterResultList(hm,pi);
		
		if(list!=null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("condition", condition);
			mv.addObject("filterValue", filterValue);
			mv.setViewName("marketList");
		} else {
			throw new MarketException("중고장터 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 댓글 목록
	@RequestMapping("rList.ma")
	public void replyList(@RequestParam("boardNo") int boardNo, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Comment> list = marketService.selectRList(boardNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//  댓글 수정
	@RequestMapping("modifyReply.ma")
    @ResponseBody
    public String modifyReply(@RequestParam("rNo") int rNo, @ModelAttribute Comment c, @RequestParam("rContent") String rContent) {
		
		c.setrNo(rNo);
		c.setrContent(rContent);
		
		int result = marketService.modifyReply(c);
		
		if(result > 0) {
			return "success";
		} else {
			throw new FreeBoardException("댓글 수정 실패!");
		}
    }
	
//	댓글 삭제
	@RequestMapping("deleteComment.ma")
	@ResponseBody
	public String deleteReply(@RequestParam int rNo) {
		int result = marketService.deleteComment(rNo);
		
		if(result > 0) {
			return "success";
		} else {
			throw new MarketException("댓글 삭제에 실패했습니다.");
		}
	}
	
	
}
