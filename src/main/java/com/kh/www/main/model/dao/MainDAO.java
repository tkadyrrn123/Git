package com.kh.www.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.club.model.vo.Club;
import com.kh.www.freeBoard.model.vo.FreeBoard;

@Repository
public class MainDAO {

	public ArrayList<Notice> getRealNoticeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.getRealNoticeList");
	}

	public ArrayList<FreeBoard> getRealFreeBoard(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.getRealFreeBoard");
	}

	public ArrayList<Club> getRealClub(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.getRealClub");
	}


}
