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
	public ArrayList<Notice> getRealNoticeList() {
		return mDAO.getRealNoticeList(sqlSession);
	}

	@Override
	public ArrayList<FreeBoard> getRealFreeBoard() {
		// TODO Auto-generated method stub
		return mDAO.getRealFreeBoard(sqlSession);
	}

	@Override
	public ArrayList<Club> getRealClub() {
		// TODO Auto-generated method stub
		return mDAO.getRealClub(sqlSession);
	}

}
