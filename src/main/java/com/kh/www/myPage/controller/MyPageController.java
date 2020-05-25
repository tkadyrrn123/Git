package com.kh.www.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("myProfile.my")
	public String myPageView() {
		return "myProfile";
	}
	
	@RequestMapping("breakfast.my")
	public String breakfastView() {
		return "breakfast";
	}
	
	@RequestMapping("myBoard.my")
	public String myBoardView() {
		return "myBoard";
	}
	
	@RequestMapping("myComment.my")
	public String myCommentView() {
		return "myComment";
	}
	
	@RequestMapping("myQnA.my")
	public String myQnAView() {
		return "myQnA";
	}
}
