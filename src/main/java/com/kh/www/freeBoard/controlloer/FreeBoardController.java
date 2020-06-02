package com.kh.www.freeBoard.controlloer;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.www.freeBoard.model.exception.FreeBoardException;
import com.kh.www.freeBoard.model.service.FreeBoardService;
import com.kh.www.freeBoard.model.vo.FreeBoard;


@Controller
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeService;
	
	
	@RequestMapping("list.fr")
	public String freeBoardListView() {		
		
		return"freeBoardList";
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
	public String insertFreeBoard(@ModelAttribute FreeBoard fb, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) throws FreeBoardException {
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				fb.setFileName(renameFileName);
				
			}
		}
		
		int result = freeService.insertBoard(fb); 
		
		
		if(result > 0) {
			return "redirect:list.fr";
		} else {
			throw new FreeBoardException("게시물 등록 실패");
		}
		
	}
	

	
}
