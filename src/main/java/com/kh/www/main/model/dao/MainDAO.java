package com.kh.www.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.club.model.vo.Club;
import com.kh.www.freeBoard.model.vo.FreeBoard;

@Repository
public class MainDAO {

	public ArrayList<Notice> getRealNoticeList(String aptName, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.getRealNoticeList", aptName);
	}

	public ArrayList<FreeBoard> getRealFreeBoard(String aptName, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.getRealFreeBoard", aptName);
	}

	public ArrayList<Club> getRealClub(String aptName, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.getRealClub", aptName);
	}


}
