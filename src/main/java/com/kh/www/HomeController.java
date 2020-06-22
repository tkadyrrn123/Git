package com.kh.www;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.www.Apart.model.exception.ApartException;
import com.kh.www.Apart.model.service.ApartService;
import com.kh.www.Apart.model.vo.Apart;
import com.kh.www.Member.model.service.MemberService;
import com.kh.www.Member.model.vo.Email;
import com.kh.www.Member.model.vo.EmailSender;
import com.kh.www.Member.model.vo.Member;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("loginUser")
@Controller
public class HomeController {
	
	@Autowired
	private ApartService aptService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder BCryptPasswordEncoder; 
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email email;
	
	@Autowired
	private JavaMailSender EmailSender;
	//아파트 추가
	@RequestMapping("aptAdd.do")
	public String aptInsert(@RequestParam("aptAdd_Name") String name, @RequestParam("address1") String address,
			                @RequestParam("aptAdd_dong") String[] dong, @RequestParam("aptAdd_phone") String phone,
			                Model model, HttpServletResponse response) throws IOException {
		
		System.out.println("이름:" + name);
		System.out.println("주소:" + address);
		System.out.println("동:" + Arrays.toString(dong));
		System.out.println("전화번호:" + phone);
		
		String dongjoin = String.join(",",dong); 
		
		Apart apt = new Apart(name, dongjoin, address, phone);
		
		int result = aptService.aptInsert(apt);
		
		if(result>0) {
			response.setContentType("text/html; charset=UTF-8");
			
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아파트 신청이 완료되었습니다.'); history.go(-1);</script>");
            out.flush();


			return "index";
		}else {
			throw new ApartException("아파트 신청이 불가능합니다.");
		}
		
	}
	// 아파트 동 리스트 뽑기
	@RequestMapping("donglist.bo")
	public void donglist(@RequestParam("name") String name, Model model,
						   HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8"); 
		String dong = null;
		String[] dongs = null;
		if(name != null) {
			dong = aptService.donglist(name);
			dongs = dong.split(",");
		}
		
		Gson gson = new Gson();
		
		try {
			gson.toJson(dongs, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 아파트 중복체크
	@RequestMapping("aptDupChk.do")
	public void aptDupName(@RequestParam("name") String name, HttpServletResponse response) {
		
		System.out.println(name);
		
		int result = aptService.aptDupName(name);
		
		boolean isable = result == 0 ? true : false;
		
		try {
			response.getWriter().print(isable);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//아이디 중복체크
	@RequestMapping("dupid.do")
	public void dupid(@RequestParam("id") String id, HttpServletResponse response) {
		System.out.println(id);
		
		int result = mService.dupid(id);
				
		boolean isable = result == 0 ? true : false;
		
		try {
			response.getWriter().print(isable);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	//닉네임 중복체크
	@RequestMapping("dupNick.do")
	public void dupNick(@RequestParam("nick") String nick, HttpServletResponse response) {
		System.out.println(nick);
		
		int result = mService.dupNick(nick);
				
		boolean isable = result == 0 ? true : false;
		
		try {
			response.getWriter().print(isable);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//멤버 회원가입
	@RequestMapping("memberInsert.do")
	public String InsertMember(@ModelAttribute Member m, @RequestParam("profile_img") MultipartFile imgFile,
								HttpServletRequest request, HttpServletResponse response) throws IOException {
		m.setUserId(request.getParameter("id"));
		m.setUserName(request.getParameter("name"));
		m.setNickName(request.getParameter("nickName"));
		m.setPhone(request.getParameter("phone"));
		m.setEmail(request.getParameter("email"));
		m.setAptName(request.getParameter("aptName"));
		m.setAptDong(request.getParameter("aptDong"));
		m.setAptHosu(request.getParameter("aptNum"));
		m.setUserLevel(Integer.parseInt(request.getParameter("user_level")));
		
		String encPwd = BCryptPasswordEncoder.encode(request.getParameter("pwd"));
		System.out.println(encPwd);
		
		m.setUserPwd(encPwd);
		
		if(imgFile != null && !imgFile.isEmpty()) {
			String renameFileName = saveFile(imgFile, request);
			
			if(renameFileName != null) {
				m.setUserFile(renameFileName);
			}
		}
		
		int result = mService.InsertMember(m);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result>0) {
            out.println("<script>alert('회원 가입이 완료되었습니다.'); history.go(-1);</script>");
            out.flush();
		}else {
			out.println("<script>alert('회원 가입에 실패했습니다.'); history.go(-1);</script>");
            out.flush();
		}
		return "index";
	}
	
	//관리자 회원가입
	@RequestMapping("adminInsert.do")
	public String InsertAdmin(@ModelAttribute Member m, @RequestParam("adminprofile_img") MultipartFile imgFile,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		m.setUserId(request.getParameter("adminid"));
		m.setNickName(request.getParameter("adminnickName"));
		m.setPhone(request.getParameter("adminphone"));
		m.setEmail(request.getParameter("adminemail"));
		m.setAptName(request.getParameter("adminaptName"));
		m.setUserLevel(Integer.parseInt(request.getParameter("user_level")));
		
		String encPwd = BCryptPasswordEncoder.encode(request.getParameter("adminpwd"));
		
		m.setUserPwd(encPwd);
		
		if(imgFile != null && !imgFile.isEmpty()) {
			String renameFileName = saveFile(imgFile, request);
			
			if(renameFileName != null) {
				m.setUserFile(renameFileName);
			}
		}
		
		int result = mService.InsertAdmin(m);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			out.println("<script>alert('회원 가입이 완료되었습니다.'); history.go(-1);</script>");
			out.flush();
		}else {
			out.println("<script>alert('회원 가입에 실패했습니다.'); history.go(-1);</script>");
			out.flush();
		}
		
		return "index";
	}
	
	
	//파일 이름 변경
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
		return renameFileName;
	}
	
	//로그인
	@RequestMapping("login.do")
	public String Login(@RequestParam("id") String id, @RequestParam("pwd") String pwd,
						Model model, HttpServletResponse response) throws IOException {
		
		Member loginUser = mService.Login(id);
		
		if(loginUser != null) {
			System.out.println("비밀번호 비교 :" + BCryptPasswordEncoder.matches(pwd, loginUser.getUserPwd()));
			if(BCryptPasswordEncoder.matches(pwd, loginUser.getUserPwd()) && (loginUser.getUserLevel() == 1 || loginUser.getUserLevel() == 2 )) {
				model.addAttribute("loginUser", loginUser);
				
				return "redirect:main.do";
			}else if(BCryptPasswordEncoder.matches(pwd, loginUser.getUserPwd()) && loginUser.getUserLevel() == 3) {
				model.addAttribute("loginUser", loginUser);
				
				return "redirect:adminMain.adm";
			}else {
				PrintWriter out = response.getWriter();
	            out.println("<script>alert('로그인 실패'); history.go(-1);</script>");
	            out.flush();
			}
		
		}else {
			response.setContentType("text/html; charset=UTF-8");
			
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 실패.'); history.go(-1);</script>");
            out.flush();
			
		}
		return "index";
	}
	
	@RequestMapping("main.do")
	public String mainView() {
		
		return "/WEB-INF/views/Main";
	}
	
	@RequestMapping("idSearch.do")
	public String idSearch(@RequestParam("userId_email") String user_email, HttpServletResponse response) throws IOException {
		
		String userId = mService.idSearch(user_email);
		
		String msg = "";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>아이디 찾기 입니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "비밀번호 찾기 페이지로 돌아가 인증코드 <strong>";
		msg += userId + "</strong> 를 입력해주세요.</div><br/>";
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(userId != null) {
			email.setSubject("[HOUSTORY] 아이디 찾기 메일입니다.");
			email.setContent(msg);
			email.setReceiver(user_email);
			emailSender.SendEmail(email, EmailSender);
			
			out.println("<script>alert('메일을 확인해주세요!'); history.go(-1);</script>");
            out.flush();
		}else {
			out.println("<script>alert('등록된 이메일이 없습니다. 다시 확인해주세요!'); history.go(-1);</script>");
            out.flush();
		}
		return "index";
	}
	@RequestMapping("passSearch.do")
	public String passSearch(@RequestParam("userPass_email") String user_email, HttpServletResponse response) throws IOException {
		
		 String uuid = "";
		 uuid = UUID.randomUUID().toString().replaceAll("-", "");
		 uuid = uuid.substring(0, 10);
		 
		 String msg = "";
		 msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		 msg += "<h3 style='color: blue;'>비밀번호 찾기 인증코드입니다.</h3>";
		 msg += "<div style='font-size: 130%'>";
		 msg += "비밀번호 찾기 페이지로 돌아가 인증코드 <strong>";
		 msg += uuid + "</strong> 를 입력해주세요.</div><br/>";
		 
		 String userId = mService.idSearch(user_email);
		 
		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out = response.getWriter();
		 
		 if(userId != null) {
			email.setSubject("[HOUSTORY] 비밀번호 찾기 메일입니다.");
			email.setContent(msg);
			email.setReceiver(user_email);
			emailSender.SendEmail(email, EmailSender);
			
			//임시비밀번호 DB에 변경
			String encPwd = BCryptPasswordEncoder.encode(uuid);
			mService.searchPwdAlter(userId, encPwd);
			
			out.println("<script>alert('메일을 확인해주세요!'); history.go(-1);</script>");
            out.flush();
		 }else {
			out.println("<script>alert('등록된 이메일이 없습니다. 다시 확인해주세요!'); history.go(-1);</script>");
            out.flush();
		 }
		 
		return "index";
	}
	
}
