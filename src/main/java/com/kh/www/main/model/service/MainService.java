package com.kh.www.main.model.service;

import java.util.ArrayList;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.club.model.vo.Club;
import com.kh.www.freeBoard.model.vo.FreeBoard;

public interface MainService {

	ArrayList<Notice> getRealNoticeList(String aptName);

	ArrayList<FreeBoard> getRealFreeBoard(String aptName);

	ArrayList<Club> getRealClub(String aptName);

}
