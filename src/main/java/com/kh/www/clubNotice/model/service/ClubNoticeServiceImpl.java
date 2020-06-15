package com.kh.www.clubNotice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.clubNotice.model.dao.CNoticeDAO;
import com.kh.www.clubNotice.model.vo.ClubNotice;
import com.kh.www.common.model.vo.PageInfo;
import com.sun.xml.internal.bind.v2.runtime.NameList;

@Service("cnService")
public class ClubNoticeServiceImpl implements ClubNoticeService {
	
	@Autowired
	private CNoticeDAO cnDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override //동호회 공지사항 전체 리스트 갯수 가져오기
	public int getCNoticeListCount() {
		return cnDAO.getCNoticeListCount(sqlSession);
	}
	
	@Override //동호회 공지사항 리스트 페이지 가져오기
	public ArrayList<ClubNotice> selectList(PageInfo pi) {
		return cnDAO.selectList(sqlSession, pi);
	}
	
	@Override //동호회 공지사항 작성
	public int insertNotice(ClubNotice cn) {
		return cnDAO.insertNotice(sqlSession, cn);
	}

	@Override //동호회-이름목록 받아오기
	public ArrayList<String[]> selectcNamelist() {
		return cnDAO.selectcNamelist(sqlSession);
	}
	
	@Override //동호회-공지사항 상세조회
	public ClubNotice selectclubNotice(int cnNo) {
		ClubNotice cn = null;
		
		//조회수 증가 체크하기
		int result = cnDAO.addReadCount(sqlSession, cnNo);
		
		if(result > 0) { //공지사항 상세조회
			cn = cnDAO.selectNotice(sqlSession, cnNo);
		}
		return cn;
	}
}
