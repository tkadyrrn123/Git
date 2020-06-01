package com.kh.www.freeBoard.controlloer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class FreeBoardController {
	
	@RequestMapping("list.fr")
	public String freeBoardListView() {		
		
		return"freeBoardList";
	}
	
	
	@RequestMapping("writing.fr")
	public String writingFreeBoardView() {		
		
		return"writingFree";
	}
	
	@RequestMapping("insert.fr")
	public String insertFreeBoard() {
		
		return "";
	}
	

	
}
