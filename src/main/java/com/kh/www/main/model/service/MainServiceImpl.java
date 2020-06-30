package com.kh.www.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.club.model.vo.Club;
import com.kh.www.freeBoard.model.vo.FreeBoard;
import com.kh.www.main.model.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Notice> getRealNoticeList(String aptName) {
		return mDAO.getRealNoticeList(aptName, sqlSession);
	}

	@Override
	public ArrayList<FreeBoard> getRealFreeBoard(String aptName) {
		// TODO Auto-generated method stub
		return mDAO.getRealFreeBoard(aptName, sqlSession);
	}

	@Override
	public ArrayList<Club> getRealClub(String aptName) {
		// TODO Auto-generated method stub
		return mDAO.getRealClub(aptName, sqlSession);
	}

}
