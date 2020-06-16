package com.kh.www.market.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.market.model.exception.MarketException;
import com.kh.www.market.model.service.MarketService;
import com.kh.www.market.model.vo.Market;

@Controller
public class MarketController {
	
	@Autowired
	private MarketService marketService;
	
	@RequestMapping("market.ma")
	public ModelAndView marketList(@RequestParam(value="page", required=false) Integer page,ModelAndView mv) throws MarketException {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = marketService.getListCount();
		
		PageInfo pi = Pagenation.getPageInfo(currentPage,listCount);
		
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
	public String writing(@ModelAttribute Market m, @RequestParam(value="uploadFile",required=false) MultipartFile uploadFile, HttpServletRequest request,HttpSession session) throws MarketException {
		
		System.out.println("mmmm : " + m);
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				m.setFileName(renameFileName);
			}
		}
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getUserId();
		m.setUserId(id);
		
		System.out.println("id : " + id);
		System.out.println(m.getUserId());
		
		int result = marketService.insertBoard(m);
		
		if(result > 0) {
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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ".";
		
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
	}
	
	
	@RequestMapping("marketDetail.ma")
	public ModelAndView marketDetail(@RequestParam(value="boardNo",required=false) int boardNo, @RequestParam("page") int page, ModelAndView mv) {
		Market ma = marketService.selectMarketList(boardNo);
		
		if(ma != null) {
			mv.addObject("ma",ma)
			  .addObject("page",page)
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
	
}
