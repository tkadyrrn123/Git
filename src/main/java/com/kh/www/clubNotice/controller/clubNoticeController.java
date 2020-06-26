package com.kh.www.clubNotice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.Notice.model.exception.NoticeException;
import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.clubNotice.model.exception.ClubNoticeException;
import com.kh.www.clubNotice.model.service.ClubNoticeService;
import com.kh.www.clubNotice.model.vo.ClubNotice;
import com.kh.www.common.Pagenation;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;

@Controller
public class clubNoticeController {
	
	@Autowired
	private ClubNoticeService ClubNoticeService;
	
	@RequestMapping("clubNoticeList.cn") //동호회-공지사항 리스트
	public ModelAndView clubNoticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String aptName = loginUser.getAptName();
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		//공지사항 전체 리스트 갯수 가져오기
		int listCount = ClubNoticeService.getCNoticeListCount(aptName); 

		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		//공지사항 리스트 페이지 가져오기
		ArrayList<ClubNotice> list = ClubNoticeService.selectList(pi, aptName);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("clubNoticeList");
		}else {
			throw new ClubNoticeException("동호회 공지사항 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
//	@RequestMapping("cnoticeInsertView.cn")//동호회 공지사항 신규 작성으로 이동
//	public String boardinsertView() {
//		return "clubNoticeInsertForm";
//	}
	
	//동호회 공지사항 신규 작성으로 이동 및 동호회 이름 리스트 가져오기
	@RequestMapping("cnoticeInsertView.cn")
	public ModelAndView clubNameList(ModelAndView mv, HttpSession session) {
		
		//동호회 이름 리스트 가져오기
		Member loginUser = (Member)session.getAttribute("loginUser");
		String aptName = loginUser.getAptName();
		
		ArrayList<String[]> cNamelist = ClubNoticeService.selectcNamelist(aptName);
		
		if(cNamelist != null) {
			mv.addObject("cNamelist", cNamelist);
			mv.setViewName("clubNoticeInsertForm");
			System.out.println("//동호회 이름 리스트 가져오기"+mv);
		}else {
			throw new ClubNoticeException("동호회 공지사항 작성폼을 가져오는데에 실패했습니다.");
		}
		
		return mv;
	}
	
	
	@RequestMapping("clubNoticeInsert.cn") //동호회-공지사항 작성
	public String noticeInsert(@ModelAttribute ClubNotice cn, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, HttpSession session) {
	
		if(uploadFile != null && !uploadFile.isEmpty()) {
			
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				cn.setOriginalFileName(uploadFile.getOriginalFilename());
				cn.setRenameFileName(renameFileName);
			}
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getUserId();
		
		cn.setUserId(id);
		int result = ClubNoticeService.insertNotice(cn);
		
		if(result > 0) {
			return "redirect:clubNoticeList.cn"; //DB에 저장하고나면 목록으로 이동
		}else {
			throw new ClubNoticeException("동호회 공지사항 등록에 실패하였습니다.");
		}
		
	}
	
	//첨부파일 저장
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
		
		return renameFileName; //리네임 파일만 디비에 저장함 
	}
		
	@RequestMapping("cndetail.cn") //동호회-공지사항 상세조회
	public ModelAndView noticeDetail(@RequestParam("cnNo") int cnNo, @RequestParam("page") int page,
							  ModelAndView mv) {
		
		ClubNotice ClubNotice = ClubNoticeService.selectclubNotice(cnNo); //글번호 전체 내용 가져오기
		
		if(ClubNotice != null) {
			// 모델엔드뷰로 보드를 보낸다.
			mv.addObject("ClubNotice", ClubNotice)
			  .addObject("page", page)
			  .setViewName("clubNoticeDetailView");
		}else {
			throw new ClubNoticeException("공지사항 상세보기에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("ClubNoticeUpdateView.cn") //동호회 공지 수정하기 폼으로 이동 - 수정할 글 상세조회
	public ModelAndView noticeUpdateView(@RequestParam("cnNo") int cnNo, @RequestParam("page") int page, ModelAndView mv, HttpSession session) {
		
		ClubNotice ClubNotice = ClubNoticeService.selectUpdateClubNotice(cnNo);
		
		//동호회 이름 리스트 가져오기
		Member loginUser = (Member)session.getAttribute("loginUser");
		String aptName = loginUser.getAptName();
		
		ArrayList<String[]> cNamelist = new ArrayList<>();
		cNamelist = ClubNoticeService.selectcNamelist(aptName);
		
		if(ClubNotice != null && cNamelist != null) {
			mv.addObject("ClubNotice", ClubNotice).addObject("page", page).addObject("cNamelist", cNamelist).setViewName("clubNoticeUpdateForm");
		}else {
			throw new ClubNoticeException("공지사항 수정하기 폼 요청에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("ClubNoticeUpdate.cn") //동호회 공지사항 업데이트
	public ModelAndView boardUpdateForm(@ModelAttribute ClubNotice cn, @RequestParam("reloadFile") MultipartFile reloadFile,
								  @RequestParam("page") int page, HttpServletRequest request, ModelAndView mv) {
		
		//업데이트 파일 있으면이 기존 파일을 삭제하고 업데이트 파일을 renameFileName에 새로 저장
		//글 수정 시 업데이트 파일을 새로 넣지 않으면 기존파일은 유지됨
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(cn.getRenameFileName() != null) {
				deleteFile(cn.getRenameFileName(), request);
			}
			
			String renameFileName = saveFile(reloadFile, request);
			if(renameFileName != null) {
				cn.setOriginalFileName(reloadFile.getOriginalFilename());
				cn.setRenameFileName(renameFileName);
			}
		}
		System.out.println("controller에서 뽑아보는 cn : "+cn);
		//공지사항 업데이트 - 파일만 업데이트(파일테이블)
		int result_file = ClubNoticeService.updateClubNotice_File(cn);
		
		//공지사항 업데이트 - 글만 업데이트(노티스테이블)
		int result_Content = ClubNoticeService.updateClubNotice_Content(cn);
		
		//공지사항 업데이트 - 클럽명만 업데이트(클럽노티스 테이블)
		int result_clubName = ClubNoticeService.updateClubNotice_Name(cn);
		
		System.out.println("1:  "+result_file + "2:  "+result_Content +"3:  "+ result_clubName );
		
		if(result_file > 0 || result_Content > 0 || result_clubName > 0) {
			mv.addObject("page",page)
			  .setViewName("redirect:cndetail.cn?cnNo="+cn.getCnNo());
		}else {
			throw new ClubNoticeException("동호회 공지사항 수정에 실패했습니다.");
		}
		
		return mv;
	}
	
	//공지사항 수정시 기존에 업로드한 파일 삭제 
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	//동호회 공지사항 삭제
	@RequestMapping("ClubNoticeDelete.cn")
	public String deleteBoard(@RequestParam("cnNo") int cnNo) {
		int result = ClubNoticeService.deleteClubNotice(cnNo);
		
		if(result > 0) {
			return "redirect:clubNoticeList.cn";
		
		}else {
			throw new ClubNoticeException("동호회 공지사항 삭제에 실패하였습니다.");
		}
	}
	
	//동호회 공지사항 검색
	@RequestMapping("clubNoticeSearch.cn")
	private ModelAndView boardSearch(@RequestParam(value="page", required=false) Integer page,
			@RequestParam String cnSearchCondition, @RequestParam String cnSearchValue, 
			@ModelAttribute ClubNotice cn, HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, HttpSession session) {
		
		if(cnSearchCondition.equals("cnoticeNickname")) {
			cn.setCnoticeNickname(cnSearchValue);
		}else if(cnSearchCondition.equals("cnTitle")) {
			cn.setCnTitle(cnSearchValue);
		}else if(cnSearchCondition.equals("clubName")) {
			cn.setClubName(cnSearchValue);
		}else if(cnSearchCondition.equals("cnContent")) {
			cn.setCnContent(cnSearchValue);
		}else if(cnSearchCondition.equals("cnTotal")) {
			cn.setCnTotal(cnSearchValue);
		}
		
		System.out.println("controller에서 뽑아보는 cn : "+ cn);
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		//세션에서 아파트이름 가져오기
		Member loginUser = (Member)session.getAttribute("loginUser");
		String aptName = loginUser.getAptName();
		cn.setAptName(aptName);
		
		//동호회 공지사항 검색키워드에 따른 전체 수 가져오기
		int listCount = ClubNoticeService.getSearchResultListCount(cn);
		
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		//동호회 공지사항 검색한 리스트 가져오기
		ArrayList<ClubNotice> list = ClubNoticeService.selectSearchResultList(cn, pi);
		
		System.out.println("controller에서 뽑아보는  list : "+ list);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("cnSearchCondition", cnSearchCondition);
			mv.addObject("cnSearchValue", cnSearchValue);
			
			mv.setViewName("clubNoticeList");
		}else {	
			throw new NoticeException("공지사항 검색에 실패했습니다.");
		}	
		return mv;
	}
	//동호회 공지사항 정렬 검색
		@RequestMapping("cnSortCondition.cn")
		private ModelAndView boardSearch(@RequestParam(value="page", required=false) Integer page,
				@RequestParam(value="cnSortCondition", required=false) String cnSortCondition, @ModelAttribute ClubNotice cn, HttpServletRequest request, 
				ModelAndView mv, HttpSession session) {
			
			//세션에서 아파트이름 가져오기
			Member loginUser = (Member)session.getAttribute("loginUser");
			String aptName = loginUser.getAptName();
			cn.setAptName(aptName);
			
			HashMap map = new HashMap();
			map.put("cnSortCondition", cnSortCondition);
			map.put("aptName", aptName);
			map.put("ClubNotice", cn);
			
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			//동호회 공지사항 검색키워드에 따른 전체 수 가져오기
			int listCount = ClubNoticeService.getSearchResultListCount(cn);
			
			PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
			
			map.put("pi", pi);
			
			//동호회 공지사항 정렬 리스트 가져오기
			ArrayList<ClubNotice> list = ClubNoticeService.selectSortCondition(map);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.addObject("cnSortCondition", cnSortCondition);
				mv.setViewName("clubNoticeList");
			}else {	
				throw new NoticeException("동호회 공지사항 정렬에 실패했습니다.");
			}	
			return mv;
		}
		//댓글 리스트 가져오기
		@RequestMapping("ccList.cn")
		public void replyList(@RequestParam("cnNo") int cnNo, HttpServletResponse response) {
			response.setContentType("application/json; charset=UTF-8");
			
			ArrayList<Comment> cclist = ClubNoticeService.noticeCommentList(cnNo);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			try {
				gson.toJson(cclist, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
				
		}
		//댓글 등록
		@RequestMapping("addNoticeComment.cn")
		@ResponseBody //success 리턴을 위해
		public Object addReply(@ModelAttribute Comment nc, HttpSession session) {
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			String ncUserId = loginUser.getUserId();
			
			nc.setrUserId(ncUserId); //코멘트 객체에 userId 넣기
			
			int result = ClubNoticeService.insertNoticeComment(nc);
			
			if(result > 0) {
				return "success";
			}else {
				throw new NoticeException("동호회 공지사항 댓글 등록에 실패하였습니다.");
			}
			
		}
		//댓글 수정
		@RequestMapping("commentUpdate.cn")
	    @ResponseBody
	    private int commentUpdate(@RequestParam int rNo, @RequestParam String rContent) throws Exception{
	        
	        Comment comment = new Comment();
	        comment.setrNo(rNo);
	        comment.setrContent(rContent);
	        
	        return ClubNoticeService.commentUpdate(comment);
	    }
		
		//댓글 삭제
		@RequestMapping("commentUpdate.cn{rNo}")
	    @ResponseBody
	    private int commentUpdate(@PathVariable int rNo) throws Exception{
	        
	        return ClubNoticeService.commentUpdate(rNo);
	    }
}
