package com.kh.www.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.myPage.model.exception.MyPageException;
import com.kh.www.myPage.model.service.MyPageService;

@SessionAttributes("member")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myService;
	
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
	
	@RequestMapping("updatePage.my")
    public String updatePageView() {
        return "myUpdateProfile";
    }
	
	@RequestMapping("update.my")
    public String memberUpdate(@ModelAttribute Member m,Model model,@RequestParam("userOldPwd") String userOPwd) {
        int result = myService.memberUpdate(m);
        if(result > 0) {
            if(m.getUserPwd().equals("") || m.getUserPwd() == null) {
                m.setUserPwd(userOPwd);
                model.addAttribute("member", m);
            }
        }else {
            throw new MyPageException("정보 수정에 실패하였습니다.");
        }
        return "myProfile";
    }
}
