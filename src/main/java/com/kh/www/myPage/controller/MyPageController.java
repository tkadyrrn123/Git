package com.kh.www.myPage.controller;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.myPage.model.exception.MyPageException;
import com.kh.www.myPage.model.service.MyPageService;
import com.kh.www.myPage.model.vo.Meal;
import com.kh.www.myPage.model.vo.MyBoard;
import com.kh.www.myPage.model.vo.MyComment;
import com.kh.www.myPage.model.vo.MyQnA;
import com.kh.www.myPage.model.vo.REQnA;
@SessionAttributes("loginUser")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myService;
	
	// 프로필 페이지
	@RequestMapping("myProfile.my")
	public String myPageView() {
		return "myProfile";
	}
	
	// 조석식 페이지
	@RequestMapping("breakfast.my")
	public String breakfastView() {
		return "breakfast";
	}
	
	// 내 게시글 페이지
	@RequestMapping("myBoard.my")
	public ModelAndView myBoardView(@ModelAttribute("loginUser") Member m, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = myService.getListCount(m.getUserId());
		
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<MyBoard> blist = myService.getBoardList(m.getUserId(),pi);
		System.out.println(blist);
		for(MyBoard b : blist) {
			if(b.getFree() != 0) {
				b.setType("자유");
			}else if(b.getMarket() != 0) {
				b.setType("중고마켓");
			}else if(b.getClub() != 0) {
				b.setType("동호회");
			}else if(b.getClubNotice() != 0) {
				b.setType("동호회 공지");
			}
		}
		mv.setViewName("myBoard");
		mv.addObject("blist", blist);
		mv.addObject("pi", pi);
		return mv;
	}
	
	// 내 댓글 페이지
	@RequestMapping("myComment.my")
	public ModelAndView myCommentView(@ModelAttribute("loginUser") Member m, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = myService.getCommentListCount(m.getUserId());
		
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<MyComment> clist = myService.getCommentList(m.getUserId(),pi);
		mv.setViewName("myComment");
		mv.addObject("clist", clist);
		mv.addObject("pi", pi);
		return mv;
	}
	
	// 내 QNA 페이지
	@RequestMapping("myQnA.my")
	public ModelAndView myQnAView(@ModelAttribute("loginUser") Member m, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = myService.getQnAListCount(m.getUserId());
		
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<MyQnA> qlist = myService.getQnAList(m.getUserId(),pi);
		
		ArrayList<REQnA> rqlist = myService.getREQnAList(null);
		mv.addObject("qlist", qlist).addObject("rqlist", rqlist);
		mv.addObject("pi", pi);
		mv.setViewName("myQnA");
		return mv;
	}
	
	// 프로필 수정 페이지
	@RequestMapping("updatePage.my")
    public String updatePageView() {
        return "myUpdateProfile";
    }
	
	// 내 정보 수정
	@RequestMapping("update.my")
    public String memberUpdate(@ModelAttribute("loginUser") Member m,Model model,@RequestParam("userOldPwd") String userOldPwd) {
        int result = myService.memberUpdate(m);
        if(result > 0) {
            if(m.getUserPwd().equals("") || m.getUserPwd() == null) {
                m.setUserPwd(userOldPwd);
                model.addAttribute("loginUser", m);
            }
        }else {
            throw new MyPageException("정보 수정에 실패하였습니다.");
        }
        return "myProfile";
    }
	
	// 프로필사진 수정
	@RequestMapping("image.my")
	public void updateImage(MultipartHttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		// 원래 프사가 있을경우 파일 지움
		String originFileName = request.getParameter("originFile");
		if(originFileName != null && !originFileName.equals("normal.jpg")) {
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
			Member m = (Member)session.getAttribute("loginUser");
			
			if(renameFileName != null) {
				// 세션 파일 최신화
				m.setUserFile(renameFileName);
				session.setAttribute("loginUser", m);
				
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
	
	// 조석식 예약
	@RequestMapping("insertBreakfast.my")
	public void insertBreak(@ModelAttribute("loginUser") Member m, @RequestParam("date") String date, 
													  @RequestParam("time") String time,
													  @RequestParam("option") String option,
													  HttpServletResponse response) {
		Date d = Date.valueOf(date);
		Meal meal = new Meal(m.getUserId(), d, time, option);
		int result = myService.insertBreakfast(meal);
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
	
	// 조석식 리스트 가져오기
	@RequestMapping("breakfastList.my")
	public void breakList(@ModelAttribute("loginUser") Member m, HttpServletResponse response) {
		String userId = m.getUserId();
		ArrayList<Meal> mList = myService.getBreakfastList(userId);
		
		Gson gson = new Gson();
		if(mList != null && !mList.isEmpty()) {
			try {
				response.setContentType("application/json; charset=utf-8");
				gson.toJson(mList, response.getWriter());
			} catch (JsonIOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			throw new MyPageException("조석식 목록을 불러오는데 실패하였습니다.");
		}
		
	}
	
	// QnA 입력하기
	@RequestMapping("insertQnA.my")
	public String insertQnA(@ModelAttribute("loginUser") Member m, MultipartHttpServletRequest request, HttpServletResponse response) {
		String userId = m.getUserId();
		String title = request.getParameter("QnATitle");
		String content = request.getParameter("QnAContent");
		MultipartFile file = request.getFile("QnAFile");
		int page = 1;
		if(request.getParameter("page") != null && request.getParameter("page").length() != 0) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		String renameFileName = "";
		
		MyQnA QNA = new MyQnA(userId, title, content);
		// DB에 QNA저장
		int result = 0;
		if(file != null && !file.isEmpty()) {
			// 파일 저장
			renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				// DB에 QNA파일이름저장
				QNA.setQNAFileName(renameFileName);
				result = myService.insertQnAFileName(QNA);
			}
		}else {
			result = myService.insertQnA(QNA);
		}
		
		if(result > 0) {
			return "redirect:myQnA.my?page=" + page;
		}else {
			if(renameFileName != null) {
				deleteFile(renameFileName, request);
			}
			throw new MyPageException("QNA입력에 실패하였습니다.");
		}
	}
	
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
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
}
