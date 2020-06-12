package com.kh.www.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.club.model.vo.Club;
import com.kh.www.freeBoard.model.vo.FreeBoard;
import com.kh.www.main.model.exception.MainException;
import com.kh.www.main.model.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;

	// 메인페이지 최근 공지사항 가져오기
	@RequestMapping("getRealNoticeList.main")
	private void getRealNoticeList(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");

		ArrayList<Notice> nlist = mainService.getRealNoticeList();
		JSONArray jArray = new JSONArray();
		for (Notice n : nlist) {
			JSONObject jObject = new JSONObject();
			jObject.put("nNo", n.getnNo());
			jObject.put("nTitle", n.getnTitle());
			jObject.put("nWriter", n.getUserId());
			jObject.put("nCount", n.getnCount());
			jArray.add(jObject);
		}
		Gson gson = new Gson();
		try {
			gson.toJson(jArray, response.getWriter());
		} catch (JsonIOException | IOException e) {
			throw new MainException("공지사항을 불러오는데 실패하였습니다.");
		}

	}
	
	@RequestMapping("getRealFreeBoard.main")
	@ResponseBody
	private ArrayList<FreeBoard> getRealFreeBoard() {
		ArrayList<FreeBoard> flist = mainService.getRealFreeBoard();
		return flist;
	}
	
	@RequestMapping("getRealClub.main")
	@ResponseBody
	private ArrayList<Club> getRealClub(){
		ArrayList<Club> clist = mainService.getRealClub();
		return clist;
	}
}
