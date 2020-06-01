package com.kh.www.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.myPage.model.exception.MyPageException;
import com.kh.www.myPage.model.service.MyPageService;
import com.kh.www.myPage.model.vo.Meal;
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
    public String memberUpdate(@ModelAttribute Member m,Model model,@RequestParam("userOldPwd") String userOldPwd) {
        int result = myService.memberUpdate(m);
        if(result > 0) {
            if(m.getUserPwd().equals("") || m.getUserPwd() == null) {
                m.setUserPwd(userOldPwd);
                model.addAttribute("member", m);
            }
        }else {
            throw new MyPageException("정보 수정에 실패하였습니다.");
        }
        return "myProfile";
    }
	@RequestMapping("image.my")
	public void updateImage(MultipartHttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		// 원래 프사가 있을경우 파일 지움
		String originFileName = request.getParameter("originFile");
		if(originFileName != null) {
			deleteFile(originFileName, request);
		}
		
		String renameFileName = "";
		MultipartFile imageFile = request.getFile("uploadfile");
		// 새로 바꿀 파일을 받아왔을 경우
		if(imageFile != null && !imageFile.isEmpty()) {
			
			// 파일 저장
			renameFileName = saveFile(imageFile, request);
			
			// 멤버 받아옴
			HttpSession session = request.getSession();
			Member m = (Member)session.getAttribute("member");
			
			if(renameFileName != null) {
				// 세션 파일 최신화
				m.setUserFile(renameFileName);
				session.setAttribute("member", m);
				
				// DB에 파일 이름 저장
				result = myService.imageUpdate(m);
			}
		}
		Gson gson = new Gson();
		try {
			if(result > 0) {
				gson.toJson(renameFileName,response.getWriter());
			}else {
				throw new MyPageException("프로필 사진 수정에 실패하였습니다.");
			}
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("insertBreak.my")
	public void insertBreak(@ModelAttribute Member m, @RequestParam("date") String date, 
													  @RequestParam("time") String time,
													  @RequestParam("option") String option,
													  HttpServletResponse response) {
		Date d = Date.valueOf(date);
		Meal meal = new Meal(m.getUserId(), d, time, option);
		int result = myService.insertBreak(meal);
		Gson gson = new Gson();
		if(result > 0) {
			try {
				gson.toJson("success",response.getWriter());
			} catch (JsonIOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			throw new MyPageException("조석식 예약에 실패하였습니다.");
		}
		
	}
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ "." 
								+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
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
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
}
